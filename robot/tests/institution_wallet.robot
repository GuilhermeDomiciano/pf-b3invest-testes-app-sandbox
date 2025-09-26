*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    institution_wallet

*** Test Cases ***
Validate Back Button Inside Filter Institutions
    [Documentation]    PFSAPP-251-CA01 - Validate the back button functionality inside the institutions screen
    [Tags]    botao_voltar_instituicoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Back Button Screen Wallet Filter Institutions

Validate Ballance Inside Institutions Screen
    [Documentation]    PFSAPP-251-CA02 - Validate the balance displayed inside the institutions screen
    [Tags]    saldo_todas_as_instituicoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    institution_functions.Validate Access All Products Button Section Screen Wallet
    institution_functions.Validate Ballance Filters

Validate Institutions Screen Information
    [Documentation]    PFSAPP-251-CA03, PFSAPP-251-CA04 and PFSAPP-251-CA05 - Validate the title 'All Institutions', the quantity of products in the wallet, the display of profitability over the last 30 days, and the display of the number of assets and institutions
    [Tags]    todos_produtos_informacoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    institution_functions.Validate All Contents Inside Filters    instituicao
