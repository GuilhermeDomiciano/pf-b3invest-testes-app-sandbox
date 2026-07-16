*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource
Resource    ../../functions/wallet/institution_functions.resource
Resource    ../../functions/login/login_functions.resource
Resource    ../../functions/wallet/other_institution_functions.resource
Resource    ../../functions/wallet/wallet_functions.resource
Resource    ../../functions/wallet/other_product_functions.resource
Resource    ../../screens/wallet/wallet_screen.resource
Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    other_product_wallet
# 6 cenarios de teste relacionados a tela outros produtos.
*** Test Cases ***
Validate Back Button Inside Other Products And Header Information
    [Documentation]    PFSAPP-628 - PFSAPP-629
    [Tags]    PFSAPP-628 - PFSAPP-629

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Navigate To Other Products Screen From Institution Page
    Validate Header Other Products
    Click On Back Button Screen Wallet Filters
    Log    Validação head da tela e do botão de voltar na tela de outros produtos concluída

Validate Back Button Inside Other Products
    [Documentation]    PFSAPP-630
    [Tags]    PFSAPP-630

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Navigate To Other Products Screen From Institution Page
    Validate Header Other Products
    Navigate To Inside Other Product Card
    Click On Back Button Screen Wallet Filters
    Log    Validação head da tela e do botão de voltar na tela de outros produtos concluída


Validate Order of Product Cards And Infinite Scroll and Talk Back Inside Other Products Screen
    [Documentation]    PFSAPP-631, PFSAPP-632, PFSAPP-633
    [Tags]    PFSAPP-631, PFSAPP-632, PFSAPP-633

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Navigate To Other Products Screen From Institution Page
    Enable TalkBack
    Validate Card Order Classes Other Products
    Validate Button Load More Other Products
    Disable TalkBack
    Sleep    2s
    