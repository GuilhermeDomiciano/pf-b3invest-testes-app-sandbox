*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    product_wallet

*** Test Cases ***
Validate Back Button Inside All Products
    [Documentation]    PFSAPP-250-CA01 - Validate the back button functionality inside the all products screen
    [Tags]    botao_voltar

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Access All Products Filter Button Section Screen Wallet
    Click On Back Button Screen Wallet Filters

Validate Ballance Inside All Product Screen
    [Documentation]    PFSAPP-250-CA02, PFSAPP-250-CA03, PFSAPP-250-CA04, PFSAPP-250-CA05  - Validates balance, title, x Products in your wallet and validates 30 days text
    [Tags]    saldo_todos_produtos

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Access All Products Filter Button Section Screen Wallet
    Validate Ballance Filters Products

Validate All Products Screen Information
    [Documentation]    PFSAPP-250-CA06, PFSAPP-250-CA07 - Validates title, x assets in y institutions displayed on all products screen and product cards
    [Tags]    todos_produtos_informacoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Access All Products Filter Button Section Screen Wallet
    Validate All Contents Inside Filters    produto

Validate Load More Button When Accessibility On
    [Documentation]    PFSAPP-250-CA11 - Validate the Load More button when accessibility is enabled
    [Tags]    acessibilidade

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Access All Products Button Section Screen Product Wallet
    Enable TalkBack
    Validate Load More Button When Accessibility On
    Disable TalkBack

Validate Order of Product Cards Inside All Products Screen
    [Documentation]    There is no associated test case - Validate the order of product cards inside the all products screen
    [Tags]    ordem_cards_produtos

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Access All Products Filter Button Section Screen Wallet
    Validate Card Order Classes Inside All Products

# Validate Error Api Class Screen
#     [Documentation]    PFSAPP-250-CA13 - Validate the error message displayed when the API fails to load class data.
#     [Tags]    erro_api_todos_produtos

#     Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#     ...             PASSWORD=${users['user_cc_cpf']['password']}
#     No Accept Permissions
#     Skip Profile
#     Navigation To My Wallet
#     Validate Access All Products Filter Button Section Screen Wallet
#     Validate Error Api Products Function Screen

#08, 09, 10, 12 fazer no de widgets