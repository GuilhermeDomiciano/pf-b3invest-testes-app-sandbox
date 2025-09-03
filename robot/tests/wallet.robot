*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    wallet

*** Test Cases ***
Validar secao my wallet
    [Documentation]    Validar secao my wallet na carteira
    [Tags]    resumo_patrimonio

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Wallet Items
