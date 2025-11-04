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
    Validate Access All Products Institutions Button Section Screen Wallet
    Click On Back Button Screen Wallet Filters

Validate Ballance Inside All Product Screen
    [Documentation]    PFSAPP-250-CA02 - Validate the balance displayed inside the all products screen
    [Tags]    saldo_todos_produtos

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Access All Products Institutions Button Section Screen Wallet
    Validate Ballance Filters Institutions

Validate All Products Screen Information
    [Documentation]    PFSAPP-250-CA03, PFSAPP-250-CA04, PFSAPP-250-CA05, PFSAPP-250-CA06 and PFSAPP-250-CA07 - Validate the title 'All Products', the quantity of products in the wallet, the display of profitability over the last 30 days, and the display of the number of assets and institutions
    [Tags]    todos_produtos_informacoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Access All Products Institutions Button Section Screen Wallet
    Validate All Contents Inside Filters    produto

Validate Load More Button When Accessibility On
    [Documentation]    PFSAPP-250-CA10 - Validate the Load More button when accessibility is enabled
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
