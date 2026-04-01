*** Settings ***
Resource         ../resources/resource.robot
Test Setup       Abrir o blog do Agi
Test Teardown    Fechar o navegador

*** Test Cases ***
Cenário 1: Realizar a busca inserindo uma parte do conteúdo de um artigo existente
    [Tags]    busca_parcial
    Dado que o usuário esteja na página home do blog
    Quando o usuário pesquisa pelo termo "Empréstimo"
    Então o sistema deve exibir uma lista de resultados relacionados ao termo

Cenário 2: Realizar a busca com o nome completo de um artigo existente
    [Tags]    busca_completo
    Dado que o usuário esteja na página home do blog
    Quando o usuário pesquisa pelo termo "Como o Agibank usou o Agentforce da Salesforce para transformar o seu atendimento"
    Então o sistema deve exibir o artigo exato relacionado ao termo

Cenário 3: Realizar a busca com um dado que não existe
    [Tags]    busca_negativa
    Dado que o usuário esteja na página home do blog
    Quando o usuário pesquisa pelo termo "TermoInexistenteXPTO"
    Então deve ser exibido a mensagem "Lamentamos, mas nada foi encontrado"

*** Keywords ***
O usuário pesquisa pelo termo "${TERMO}"
    Pesquisa pelo termo "${TERMO}"