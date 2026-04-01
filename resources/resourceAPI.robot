*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://dog.ceo/api
${RES}         ${None}          # Inicializa para evitar erro no VS Code
${RACA}        ${None}

*** Keywords ***
Criar Sessao DogAPI
    Create Session    dog_api    ${BASE_URL}    disable_warnings=1

### Passo-a-Passo
Dado que a API Dog está disponível
    #Criado semântico para o BDD
    No Operation

Quando eu solicitar a lista de todas as raças
    ${RES}    GET On Session    dog_api    url=/breeds/list/all
    Set Test Variable    ${RES}

Dado que eu queira visualizar fotos da raça "${raca_nome}"
    Set Test Variable    ${RACA}    ${raca_nome}

Quando eu consultar as imagens desta raça
    ${RES}    GET On Session    dog_api    url=/breed/${RACA}/images    expected_status=any
    Set Test Variable    ${RES}

Dado que eu solicite uma imagem aleatória de um cão
    #Criado semântico para o BDD
    No Operation

Quando a requisição for processada
    ${RES}    GET On Session    dog_api    url=/breeds/image/random
    Set Test Variable    ${RES}

Dado que eu consulte a raça inexistente "${raca_fake}"
    Set Test Variable    ${RACA}    ${raca_fake}

Quando a consulta for realizada
    ${RES}    GET On Session    dog_api    url=/breed/${RACA}/images    expected_status=any
    Set Test Variable    ${RES}

Então o status code deve ser ${status_esperado}
    Status Should Be    ${status_esperado}    ${RES}

E a resposta deve conter a lista de raças com o status "${status_msg}"
    # Validando JSON
    Dictionary Should Contain Key    ${RES.json()}    message
    Dictionary Should Contain Key    ${RES.json()}    status
    Should Be Equal As Strings       ${RES.json()}[status]    ${status_msg}
    # Verifica se 'message' é um objeto (dicionário de raças)
    ${tipo}=    Evaluate    type($RES.json()['message']).__name__
    Should Be Equal As Strings    ${tipo}    dict

E a lista de imagens não deve estar vazia
    # Validando  JSON: Se 'message' é uma lista com itens
    ${tipo}=    Evaluate    type($RES.json()['message']).__name__
    Should Be Equal As Strings    ${tipo}    list
    ${quantidade}=    Get Length    ${RES.json()}[message]
    Should Be True    ${quantidade} > 0

E o campo "message" deve conter a URL de uma imagem válida
    # Validando JSON: Formato da string de imagem
    ${url}=    Set Variable    ${RES.json()}[message]
    Should Contain    ${url}    https://images.dog.ceo/breeds/
    Should Match Regexp    ${url}    .*\\.(jpg|jpeg|png)$

E a mensagem de erro deve ser "${msg_erro}"
    # Validando JSON com retorno da mensagem de erro
    Should Be Equal As Strings    ${RES.json()}[message]    ${msg_erro}
    Should Be Equal As Strings    ${RES.json()}[status]     error