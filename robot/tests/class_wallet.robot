*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    class_wallet

*** Test Cases ***
Validate Back Button Inside Filter Classes
    [Documentation]    PFSAPP-251-CA01 - Validate the back button functionality inside the classes screen
    [Tags]    botao_voltar_classes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Back Button Screen Wallet Filter Classes

Validate Ballance Inside Classe Screen
    [Documentation]    PFSAPP-251-CA02 - Validate the balance displayed inside the classes screen
    [Tags]    saldo_todas_as_classes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    institution_functions.Validate Ballance Filters

Validate Classes Screen Information
    [Documentation]    PFSAPP-251-CA03, PFSAPP-251-CA04 and PFSAPP-251-CA05 - Validate the title 'All Classes', the quantity of classes in the wallet, the display of profitability over the last 30 days, and the display of the number of assets and institutions
    [Tags]    todas_as_classes_informacoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    institution_functions.Validate All Contents Inside Filters    classe

Validate All Titles Inside Class Filter
    [Documentation]    PFSAPP-251-CA06 - Validates that all expected product titles are present inside the class filter screen.
    [Tags]    filtro_classe_titulos

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Products Inside Class Filter

Validate Arrows Inside Class Filter
    [Documentation]    PFSAPP-251-CA07 - Validate the presence of arrows inside the class filter screen
    [Tags]    filtro_classe_setas

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Arrow Inside Filter Classes
    