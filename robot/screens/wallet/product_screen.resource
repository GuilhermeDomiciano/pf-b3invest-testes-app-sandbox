*** Settings ***
Documentation    Home Screen

Library          AppiumLibrary

Resource    ../../../resource/utils/element_utils.resource

*** Keywords ***
Click On Load More When TalkBack Enabled
    [Documentation]    Click on 'Carregar mais' button when TalkBack is enabled

    Scroll Element Into View In Page    locator=${BTN_LOAD_MORE}
    Wait Until Page Contains Element    locator=${BTN_LOAD_MORE}    timeout=15s
    Click Element    locator=${BTN_LOAD_MORE}
    Log To Console    message=[B3] Clicked 'Carregar mais' button with TalkBack enabled\n

Click On Access All Products Button Screen Wallet
    [Documentation]    Validate the presence of 'Acessar todos os produtos' button

    Scroll Element Into View In Page    locator=${TXT_WALLET_TITLE_ACESSO_RAPIDO}
    Wait Until Page Contains    text=Acessar todos os produtos    timeout=10s
    Click Element    locator=${BTN_WALLET_ACCESS_ALL_PRODUCTS}
    Log To Console    message=[B3] Clicked 'Acessar todos os produtos' button\n

Validate Error Api Products Function Screen
    [Documentation]    Valida a mensagem de erro exibida quando a API falha ao carregar os dados da classe.

    Validate Error Api Products Function 
    
    