*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}           chrome
${URL}               https://blogdoagi.com.br/
${MENSAGEM_ERRO}     xpath=//p[contains(text(), 'Lamentamos, mas nada foi encontrado')]

*** Keywords ***
### Setup e Teardown 
Abrir o blog do Agi
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

### Passo-a-Passo
Dado que o usuário esteja na página home do blog
    Title Should Be     Agi Blog | Tudo sobre empréstimo e educação financeira

Quando o usuário pesquisa pelo termo "${TERMO}"
    Execute Javascript    document.querySelector('.ast-search-menu-icon a').click()
    Sleep    1s

    Execute Javascript    
    ...    var inputs = document.querySelectorAll('.search-field');
    ...    for(var i=0; i<inputs.length; i++){
    ...        if(inputs[i].offsetWidth > 0 || inputs[i].offsetHeight > 0){
    ...            inputs[i].value = '${TERMO}';
    ...            inputs[i].form.submit();
    ...            break;
    ...        }
    ...    }
    

Então o sistema deve exibir uma lista de resultados relacionados ao termo
    # Aqui retorna os dados da busca no step parcial
    Wait Until Element Is Visible    id:main    15s
    Capture Page Screenshot          evidencias/busca_parcial_resultados.png

# Aqui retorna os dados da busca no step completo
Então o sistema deve exibir o artigo exato relacionado ao termo    
    Wait Until Element Is Visible    css:article    10s
    Capture Page Screenshot          evidencias/busca_completo_resultados.png    

# Aqui retorna os dados da busca no step negativa
Então deve ser exibido a mensagem "Lamentamos, mas nada foi encontrado"
    Wait Until Element Is Visible    ${MENSAGEM_ERRO}    10s
    Element Should Be Visible        ${MENSAGEM_ERRO}
    Capture Page Screenshot          evidencias/busca_negativa_resultados.png