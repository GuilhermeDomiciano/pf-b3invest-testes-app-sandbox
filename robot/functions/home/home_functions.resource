*** Settings ***
Documentation    Home Functions

Resource    ${EXECDIR}/robot/screens/home/home_screen.resource

*** Keywords ***
Validate Home Login
    [Documentation]    Validate Home Login

    Validate Toggle Visibility
    Validate Heritage Summary
    Validate My Wallet
    Validate Asset Evoluation
    # Click Graphic Line
    # Click Graphic Bar

Validate Button Customize Home Screen
    [Documentation]    Validate Button Customize Home Screen

    Click Customize Home Screen Button

Hide My Wallet
    [Documentation]    Hide My Wallet

    Click Button My Wallet
    Click Save Button

Hide Asset Evoluation
    [Documentation]    Hide Asset Evoluation
     
    Click Button Asset Evolution
    Click Save Button

Hide Open Finance
    [Documentation]    Hide Open Finance

    Click Button Open Finance
    Click Save Button

Hide Eventos
    [Documentation]    Oculta a seção de Eventos na home
    Click Element    ${BTN_EVENTS}
    Log To Console    message= [B3] Eventos ocultados
    Click Save Button

Hide Noticias
    [Documentation]    Oculta a seção de Notícias na home
    Click Element    ${BTN_NEWS}
    Log To Console    message= [B3] Notícias ocultadas
    Click Save Button

Validate Home Screen Before Customization
    [Documentation]    Validate Home Screen Before Customization
    [Arguments]    ${ID_CARD}   

    Validate Home Screen Before Customization Screen    ${ID_CARD}


Validate Home Screen After Customization
    [Documentation]    Validate Home Screen After Customization
    [Arguments]    ${ID_CARD}

    Validate Home Screen After Customization Screen    ${ID_CARD}
