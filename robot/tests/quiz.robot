*** Settings ***
Documentation    Quiz Tests

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    quiz

*** Test Cases ***
Validar perfil do usuario com base nas respostas do QUIZ
    [Documentation]    Validar perfil do usuario com base nas respostas do QUIZ
    [Tags]    CT-100

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions

Validar possibilidade de refazer o QUIZ
    [Documentation]    Validar possibilidade de refazer o QUIZ
    [Tags]    CT-101

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions

Validar possibilidade de mudar de perfil no QUIZ
    [Documentation]    Validar possibilidade de mudar de perfil no QUIZ
    [Tags]    CT-102

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
