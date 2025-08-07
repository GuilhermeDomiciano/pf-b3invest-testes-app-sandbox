*** Settings ***
Documentation    Home

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    home

*** Test Cases ***
Validar secao resumo do patrimonio na home
    [Documentation]    Validar secao resumo do patrimonio na home
    [Tags]    resumo_patrimonio

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    Validate Home Login

Validar secao minha carteira na home
    [Documentation]    Validar secao minha carteira na home
    [Tags]    minha_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    Validate Home Login

Validar secao evolucao patrimonial na home
    [Documentation]    Validar secao evolucao patrimonial na home
    [Tags]    evolucao_patrimonial

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    Validate Home Login

Validar secao open finance na home
    [Documentation]    Validar secao open finance na home
    [Tags]    open_finance

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    Validate Home Login
