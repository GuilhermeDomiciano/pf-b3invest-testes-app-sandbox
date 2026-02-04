*** Settings ***
Documentation    Wallet Functions

Resource    ${EXECDIR}/robot/screens/wallet/institution_screen.resource

*** Keywords ***
Validate Back Button Screen Wallet Filter Institutions
    [Documentation]    Valida o funcionamento do botão de voltar dentro da tela de instituições
    
    Click On Institution Button Screen Wallet
    Click On Back Button Screen Wallet Filters

Navigation Other Institution Button Screen Wallet
    [Documentation]    Navega para a tela de outras instituições a partir do filtro de instituições

    Click Other Institution Button Screen Wallet
    
Validate Access All Products Institutions Button Section Screen Wallet
    [Documentation]    Validate Access All Products Institutions Button Screen Wallet

    Click On Access All Products Button Screen Wallet  

Validate Ballance Filters Institutions
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

Validate And Navigate To Institutions Products And Button Load More
    [Documentation]    Valida e navega para as duas primeiras instituições encontradas na tela, voltando pelo botão de voltar do topo
    # Aguarda os cards de instituição aparecerem usando o regex dinâmico
    Validate And Navigate To Institutions Products And Button Load More Screen Wallet Institution


Validate Card Order Classes Institutions
    [Documentation]    Valida os cards das classes na tela de todas as instituições.

    Wait Until Element Is Visible     locator=${CARD_RENDA_FIXA_RESOURCE_ID}   timeout=10s
    Scroll Element Into View In Page    locator=${BTN_LOAD_MORE_3}
    Click Element    locator=${BTN_LOAD_MORE_3}
    Sleep    2s  
    Log To Console    message=[B3] Validate Card Order Classes Institutions in Wallet Screen\n
    Pick Card To Check Order    ${CARD_RENDA_FIXA_RESOURCE_ID}    ${CARD_RENDA_FIXA_RESOURCE_ID}   True

Validate Voice Over Button Institutions
    [Documentation]    Valida o funcionamento do botão de Voice Over dentro da tela de instituições

    Enable TalkBack
    Scroll Element Into View In Page    locator=${CARD_LOAD_MORE_INSTITUTIONS}
    Wait Until Element Is Visible     locator=${CARD_LOAD_MORE_INSTITUTIONS}   timeout=10s
    Click Element    locator=${CARD_LOAD_MORE_INSTITUTIONS}
    Disable TalkBack
    Sleep    2s

Validate Error Api Institution Screen
    [Documentation]    Valida a mensagem de erro exibida quando a API falha ao carregar os dados da classe.
    
    Click On Institution Button Screen Wallet
    Disable Android Internet
    Wait Until Page Contains    text=Instituições   timeout=10s
    Element Should Be Visible    ${ALL_INSTITUTIONS_QUANTITY}
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

Navigation To Wallet Details Institutions
    [Documentation]    Navega para a tela de detalhes da instituição a partir da tela de todas as instituições

    Click On Institution Element Screen Wallet Institutions
    
