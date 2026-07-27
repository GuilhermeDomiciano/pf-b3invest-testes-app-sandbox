*** Settings ***
Documentation    Noticias — convertido de "Casos de teste sprint 10.pdf", PFSAPP-542 (Notícia - Listagem)

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

*** Test Cases ***
Validar layout do topo da tela de noticias
    [Documentation]    PFSAPP-542 - Notícia - Listagem - Caso de teste 01: Validação do layout do topo da tela
    [Tags]    noticias    regressivo

    Given O Usuario Esta Logado E Na Home
    When O Usuario Acessa A Tela De Noticias
    Then O Topo Da Tela Deve Exibir Botao Voltar E Titulo Noticias
