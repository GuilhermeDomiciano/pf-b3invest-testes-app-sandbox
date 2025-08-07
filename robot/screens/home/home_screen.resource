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
    Log To Console    message=[B3] Validate Session Graphic Bar\n

Click Graphic Line
    [Documentation]    Click Graphic Line

    Scroll Element Into View In Page    locator=${BTN_LINE_CHART}
    Wait Until Element Is Visible    locator=${BTN_LINE_CHART}    timeout=10
    Click Element    locator=${BTN_LINE_CHART}
    Log To Console    message=[B3] Validate Session Graphic Line\n

Validate Open Finance
    [Documentation]    Validate Open Finance

    Scroll Element Into View In Page    locator=${ICN_OPEN_FINANCE}
    Scroll Screen
    Wait Until Element Is Visible    locator=${ICN_OPEN_FINANCE}    timeout=10
    Log To Console    message=[B3] Validate Session Open Finance\n
