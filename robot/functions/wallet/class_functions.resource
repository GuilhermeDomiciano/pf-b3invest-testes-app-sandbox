*** Settings ***
Library    String
Library    Collections
Documentation    Wallet Functions

Resource    ${EXECDIR}/robot/screens/wallet/class_screen.resource

*** Keywords ***
Validate Back Button Screen Wallet Filter Classes
    [Documentation]    Valida o funcionamento do botão de voltar dentro da tela de classes
    
    Click On Classe Button Screen Wallet
    Click On Back Button Screen Wallet Filters
    Wait Until Page Contains Element    locator=${BTN_WALLET_ACCESS_ALL_CLASSES}  timeout=10s
    Click Element    locator=${BTN_WALLET_ACCESS_ALL_CLASSES}

Validate All Classes Button Screen Wallet
    [Documentation]    Valida o botão de todas as classes na tela de todos os produtos

    Click On Classe Button Screen Wallet

Validate Products Inside Class Product And Navigate To Classes
    [Documentation]    Valida os títulos dos produtos dentro do filtro de classe: 'Renda Variável', 'Renda Fixa' e 'Internacional' e navega para as classes.
    Wait Until Page Contains    text=Produtos por classe    timeout=10s
    Element Should Be Visible    ${ALL_CLASSES_QUANTITY}
    Click On Classe Button Screen Wallet
    Scroll Element Into View In Page    locator=${BTN_RENDA_FIXA}
    Wait Until Element Is Visible   locator=${BTN_RENDA_FIXA}   timeout=10s
    Click Element    locator=${BTN_RENDA_FIXA}
    Click Element    locator=${BTN_WALLET_BACK}
    Scroll Element Into View In Page    locator=${BTN_INTERNACIONAL}        
    Wait Until Element Is Visible    locator=${BTN_INTERNACIONAL}   timeout=10s
    Click Element    locator=${BTN_INTERNACIONAL}
    Click Element    locator=${BTN_WALLET_BACK}
    Scroll Element Into View In Page    locator=${BTN_RENDA_VARIAVEL}
    Wait Until Element Is Visible     locator=${BTN_RENDA_VARIAVEL}   timeout=10s
    Click Element    locator=${BTN_RENDA_VARIAVEL}
    Click Element    locator=${BTN_WALLET_BACK}

Validate Card Classes Product
    [Documentation]    Valida os cards das classes na tela de todas as classes.

    Click On Classe Button Screen Wallet
    Scroll Element Into View In Page    locator=${CARD_RENDA_FIXA}
    Wait Until Element Is Visible     locator=${CARD_RENDA_FIXA}   timeout=10s
    Log To Console    message=[B3] Validate Card Classes in Wallet Screen\n

    Scroll Element Into View In Page    locator=${CARD_RENDA_FIXA_RESOURCE_ID}
    Wait Until Element Is Visible     locator=${CARD_RENDA_FIXA_RESOURCE_ID}   timeout=10s

Validate Card Order Classes Product
    [Documentation]    Valida os cards das classes na tela de todas as classes.

    Click On Classe Button Screen Wallet
    Sleep    2s
    Pick Card To Check Order    ${CARD_RENDA_FIXA_RESOURCE_ID}    ${BTN_LOAD_MORE_3}   True

Validate Error Api Class Screen
    [Documentation]    Valida a mensagem de erro exibida quando a API falha ao carregar os dados da classe.
    
    Click On Classe Button Screen Wallet
    Disable Android Internet
    Wait Until Page Contains    text=Produtos por classe    timeout=10s
    Element Should Be Visible    ${ALL_CLASSES_QUANTITY}
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

Check And Restart Emulator
    [Documentation]    Valida Wi-Fi e reinicia o emulador
    ${wifi_on}=    Check Android Wifi Enabled
    Log To Console    message=[B3] Wi-Fi está ativo: ${wifi_on}
    Restart Android Emulator