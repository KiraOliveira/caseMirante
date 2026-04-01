*** Settings ***
Resource        ../resources/resourceAPI.robot
Suite Setup     Criar Sessao DogAPI

*** Test Cases ***

Cenário 1: Listar todas as raças de cães com sucesso
    [Tags]    listar_todas
    Dado que a API Dog está disponível
    Quando eu solicitar a lista de todas as raças
    Então o status code deve ser 200
    E a resposta deve conter a lista de raças com o status "success"

Cenário 2: Buscar imagens de uma raça específica
    [Tags]    listar_apenas_uma
    Dado que eu queira visualizar fotos da raça "husky"
    Quando eu consultar as imagens desta raça
    Então o status code deve ser 200
    E a lista de imagens não deve estar vazia

Cenário 3: Obter uma imagem aleatória de qualquer cão
    [Tags]    listar_aleatoria
    Dado que eu solicite uma imagem aleatória de um cão
    Quando a requisição for processada
    Então o status code deve ser 200
    E o campo "message" deve conter a URL de uma imagem válida

Cenário 4: Validar erro ao buscar raça inexistente
    [Tags]    inexistente
    Dado que eu consulte a raça inexistente "poodle_azul"
    Quando a consulta for realizada
    Então o status code deve ser 404
    E a mensagem de erro deve ser "Breed not found (main breed does not exist)"