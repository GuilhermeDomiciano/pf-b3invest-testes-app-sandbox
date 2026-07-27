*** Settings ***
Documentation    Noticias Functions
Resource    ${EXECDIR}/robot/screens/noticias/noticias_screen.resource

*** Keywords ***
Given O Usuario Esta Logado E Na Home
    [Documentation]    Pré-condição: usuário autenticado e na tela inicial.
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile

When O Usuario Acessa A Tela De Noticias
    [Documentation]    Ação: navega da home até a listagem de notícias.
    Navigate To Noticias Screen

Then O Topo Da Tela Deve Exibir Botao Voltar E Titulo Noticias
    [Documentation]    Resultado esperado: botão de voltar à esquerda e título "Notícias".
    Validate Noticias Back Button
    Validate Noticias Title
