*** Settings ***
Documentation    Home Screen

Library          AppiumLibrary

Resource    ${EXECDIR}/resource/utils/element_utils.resource

Variables    ${EXECDIR}/robot/elements/home.yaml

*** Keywords ***
Validate Toggle Visibility
    [Documentation]    Validate Toggle Visibility

    Wait Until Element Is Visible    locator=${BTN_TOGGLE_VISIBILITY}    timeout=10
    Log To Console    message=[B3] Validate Session Toggle Visibility\n

Validate Heritage Summary
    [Documentation]    Validate Heritage Summary

    Wait Until Element Is Visible    locator=${TXT_HERITAGE_SUMMARY}    timeout=10
    Log To Console    message=[B3] Validate Session Heritage Summary\n

Validate My Wallet
    [Documentation]    Validate My Wallet

    Scroll Element Into View In Page    locator=${TXT_TITLE_MY_WALLET}
    Wait Until Element Is Visible    locator=${TXT_TITLE_MY_WALLET}    timeout=10
    Log To Console    message=[B3] Validate Session My Wallet\n

Click Graphic Bar
    [Documentation]    Click Graphic Bar

    Scroll Element Into View In Page    locator=${BTN_BAR_CHART}
    Scroll Screen
    Wait Until Element Is Visible    locator=${BTN_BAR_CHART}    timeout=10
    Click Element    locator=${BTN_BAR_CHART}
    Log To Console    message=[B3] Validate Session Graphic Bar\n

Validate Asset Evoluation
    [Documentation]    Validate Asset Evoluation

    Scroll Element Into View In Page    locator=${TEXT_VALUE_RESULT}
    Scroll Screen
    Wait Until Element Is Visible    locator=${TEXT_VALUE_RESULT}    timeout=10
    Log To Console    message=[B3] Validate Session Asset Evolution\n

Click Graphic Line
    [Documentation]    Click Graphic Line

    Scroll Element Into View In Page    locator=${BTN_LINE_CHART}
    Wait Until Element Is Visible    locator=${BTN_LINE_CHART}    timeout=10
    Click Element    locator=${BTN_LINE_CHART}
    Log To Console    message=[B3] Validate Session Graphic Line\n

Click Customize Home Screen Button
    [Documentation]    Click Customize Home Screen Button

    Scroll Element Into View In Page    locator=${BTN_CUSTOMIZE_SCREEN}
    Wait Until Element Is Visible    locator=${BTN_CUSTOMIZE_SCREEN}
    Scroll Screen
    Click Element    locator=${BTN_CUSTOMIZE_SCREEN}
    Log To Console    message= [B3] Validate Customize Home Screen Button\n

Validate Open Finance
    [Documentation]    Validate Open Finance

    Scroll Element Into View In Page    locator=${ICN_OPEN_FINANCE}
    Scroll Screen
    Wait Until Element Is Visible    locator=${ICN_OPEN_FINANCE}    timeout=10
    Log To Console    message=[B3] Validate Session Open Finance\n

Click Button Customize Home Screen
    [Documentation]    Click Button Customize Home Screen

    Wait Until Element Is Visible        locator=${BTN_CUSTOMIZE_SCREEN}
    Click Element    locator=${BTN_CUSTOMIZE_SCREEN}

Click Button My Wallet
    [Documentation]    Click Button My Wallet validando posição central
    
    Wait Until Element Is Visible    locator=${STW_MY_WALLET}    timeout=10
    Click Element    locator=${STW_MY_WALLET}
    Log To Console    message=[B3] My Wallet button clicked after center validation\n

Click Button Asset Evolution
    [Documentation]    Click Button Asset Evolution

    Wait Until Element Is Visible        locator=${STW_ASSET_EVOLUTION}
    Click Element    locator=${STW_ASSET_EVOLUTION}
    Log To Console    message= [B3] Hide Asset Evolution\n

Click Button Open Finance
    [Documentation]    Click Button Open Finance

    Wait Until Element Is Visible        locator=${STW_MY_WALLET}
    Click Element    locator=${STW_MY_WALLET}

Click Button Events
    [Documentation]    Click Button Events

    Wait Until Element Is Visible        locator=${STW_MY_WALLET}
    Click Element    locator=${STW_MY_WALLET}

Click Button News
    [Documentation]    Click Button News

    Wait Until Element Is Visible        locator=${STW_MY_WALLET}
    Click Element    locator=${STW_MY_WALLET}

Click Save Button
    [Documentation]    Click Button Customize Home Screen

    Wait Until Element Is Visible        locator=${BTN_SAVE}
    Click Element    locator=${BTN_SAVE}

Click Default
    [Documentation]    Click Button Customize Home Screen

    Wait Until Element Is Visible        locator=${BTN_SAVE}
    Click Element    locator=${BTN_SAVE}
