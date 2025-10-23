*** Settings ***
Documentation    Wallet Functions

Resource    ${EXECDIR}/robot/screens/wallet/institution_screen.resource

*** Keywords ***
Validate Back Button Screen Wallet Filter Institutions
    [Documentation]    Valida o funcionamento do botão de voltar dentro da tela de instituições
    
    Click On Institution Button Screen Wallet
    Click On Back Button Screen Wallet Filters

Validate Access All Products Button Section Screen Wallet
    [Documentation]    Validate Access All Products Button Screen Wallet

    Click On Access All Products Button Screen Wallet  

Validate Ballance Filters
    [Documentation]    Valida o saldo exibido dentro da tela de todos os produtos

    #Validate Access All Products Button Screen Wallet
    Wait Until Element Is Visible    ${ALL_PRODUCTS_BALANCE}    timeout=10s
    Element Should Be Visible        ${ALL_PRODUCTS_BALANCE}
    Element Should Be Visible        ${ALL_PRODUCTS_INSTITUTIONS_COUNT_FIXED}
    ${balance}=    Get Text    ${ALL_PRODUCTS_BALANCE}
    Log To Console    message=[B3] Saldo exibido na tela de todos os produtos: ${balance}\n

Validate All Institutes Button Screen Wallet
    [Documentation]    Valida o botão de todas as instituições na tela de todos os produtos

    Click On Institution Button Screen Wallet

Validate All Contents Inside Filters
    [Documentation]    Valida os conteúdos exibidos dentro dos filtros de produto, classe e instituição
    [Arguments]    ${filter_type}

    Validate Specific Filter Content Screen Wallet    ${filter_type}
