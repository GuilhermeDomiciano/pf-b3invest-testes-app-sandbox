*** Settings ***
Documentation    Wallet Functions

Resource    ${EXECDIR}/robot/screens/wallet/product_screen.resource
Library      ${EXECDIR}/resource/utils/regex_money_utils.py

*** Keywords ***
Validate Load More Button When Accessibility On
    [Documentation]    Validate Load More Button When Accessibility On

    Click On Load More When TalkBack Enabled

Validate Access All Products Button Section Screen Product Wallet
    [Documentation]    Validate Access All Products Button Screen Product Wallet

    Click On Access All Products Button Screen Wallet 

Validate Access All Products Filter Button Section Screen Wallet
    [Documentation]    Validate Access All Products Institutions Button Screen Wallet

    Click On Access All Products Button Screen Wallet

Validate Ballance Filters Products
    [Documentation]    Valida o saldo exibido dentro da tela de todos os produtos

    #Validate Access All Products Button Screen Wallet
    Wait Until Element Is Visible    ${ALL_PRODUCTS_QUANTITY}
    Element Should Be Visible        ${ALL_PRODUCTS_QUANTITY}
    Wait Until Element Is Visible    ${ALL_PRODUCTS_ASSETS_COUNT}    timeout=10s
    Element Should Be Visible        ${ALL_PRODUCTS_ASSETS_COUNT}

    Wait Until Element Is Visible    ${ALL_PRODUCTS_BALANCE}    timeout=10s
    Element Should Be Visible        ${ALL_PRODUCTS_BALANCE}
    ${balance}=    Get Text    ${ALL_PRODUCTS_BALANCE}

    Wait Until Element Is Visible    ${PERIOD}    timeout=10s
    Element Should Be Visible    ${PERIOD}
    Find Elements Until Specific Element Found   ${PERIOD}

    Log To Console    message=[B3] Saldo exibido na tela de todos os produtos: ${balance}\n

Validate Card Order Classes Inside All Products
    [Documentation]    Valida os cards das classes na tela de todos os produtos.

    Wait Until Element Is Visible     locator=${CARD_RENDA_FIXA_RESOURCE_ID}   timeout=10s
    Log To Console    message=[B3] Validate Card Order Classes Products in Wallet Screen\n
    Pick Card To Check Order    ${CARD_RENDA_FIXA_RESOURCE_ID}    ${CARD_RENDA_FIXA_RESOURCE_ID}   True

Validate Error Api Products Function 
    [Documentation]    Valida a mensagem de erro exibida quando a API falha ao carregar os dados da classe todos os produtos.
    
    Disable Android Internet
    Wait Until Page Contains    text=Todos os produtos   timeout=10s
    Element Should Be Visible    ${ALL_PRODUCT_QUANTITY}
    Wait Until Element Is Visible    ${BTN_WALLET_BACK}    timeout=10s
    Element Should Be Visible        ${BTN_WALLET_BACK}
    Wait Until Element Is Visible    locator=${TXT_ERROR_API_CLASS_TITLE}    timeout=10s
    Element Should Be Visible        locator=${TXT_ERROR_API_CLASS_TITLE}
    Element Should Be Visible        locator=${TXT_ERROR_API_CLASS_SUB_TITLE}
    Element Should Be Visible        locator=${BTN_RETRY_API_CLASS}
    Enable Android Internet
    Click Element    locator=${BTN_RETRY_API_CLASS}
    Scroll Element Into View In Page    locator=${CARD_RENDA_FIXA}
    Wait Until Element Is Visible     locator=${CARD_RENDA_FIXA}   timeout=10s