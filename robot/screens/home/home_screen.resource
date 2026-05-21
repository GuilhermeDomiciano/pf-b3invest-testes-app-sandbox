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
    Wait Until Element Is Visible    locator=${TXT_TITLE_RECIVE_VALUE}    timeout=10
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

Validate Home Screen Before Customization Screen   
    [Documentation]    Validate Home Screen Before Customization Screen
    [Arguments]    ${ID_CARD}   

    Scroll Element Into View In Page    locator=${ID_CARD}
    Wait Until Element Is Visible    locator=${ID_CARD}    timeout=10
    Log To Console    message=[B3] Validate Home Screen Before Customization Screen\n

Validate Home Screen After Customization Screen   
    [Documentation]    Validate Home Screen After Customization Screen
    [Arguments]    ${ID_CARD}   

    Scroll Element Into View Top In Page     locator=${BTN_TOGGLE_VISIBILITY}
    Scroll Until Element Not Found    locator_1=${ID_CARD}    locator_2=${BTN_CUSTOMIZE_SCREEN}
 
Navigation To My Wallet From Card
    [Documentation]    Navigate To My Wallet From Card

    Scroll Element Into View In Page    locator=${TITLE_WALLET}
    Wait Until Element Is Visible    locator=${TITLE_WALLET}    timeout=10
    Click Element    locator=${TITLE_WALLET}
    Wait Until Element Is Visible    locator=${MY_WALLET_LOCATION}    timeout=10
    Wait Until Element Is Visible    locator=${BOTTOM_NAV_HOME}    timeout=10
    Click Element    locator=${BOTTOM_NAV_HOME}
    Log To Console    message=[B3] Navigation To My Wallet From Card\n

Graphic Donut Section Screen Wallet
    [Documentation]    Graphic Donut Section Screen Wallet

    Scroll Element Into View In Page    locator=${ALL_INVESTIMENT}
    Wait Until Element Is Visible    locator=${ALL_INVESTIMENT}    timeout=10
    Scroll Element Into View In Page    locator=${30_DAYS}
    Wait Until Page Contains Element    locator=${30_DAYS}
    Scroll Element Into View In Page   locator=${DONUT_GRAFIG}
    Wait Until Element Is Visible    locator=${DONUT_GRAFIG}    timeout=10
    Scroll Element Into View In Page   locator=${TIPE_PRODUCT_ALOCATION}
    Wait Until Element Is Visible    locator=${TIPE_PRODUCT_ALOCATION}    timeout=10
    Click Element    locator=${TIPE_PRODUCT_ALOCATION}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_DA_CARTEIRA}    timeout=10
    Click Element    locator=${BTN_BACK_INVESTIMENT}
    Log To Console    message=[B3] Graphic Donut Section Screen Wallet\n

Graphic Evolution Section Screen Wallet
    [Documentation]    Graphic Evolution Section Screen Wallet

    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EM_12_MESES}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EM_YEARS}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_EM_YEARS}
    # Wait Until Element Is Visible    locator=${YEAR}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EM_7_DIAS}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_EM_7_DIAS}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EM_49_DIAS}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_EM_49_DIAS}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EM_6_MESES}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_EM_6_MESES}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EM_12_MESES_NAO_SELECIONADO}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_EM_12_MESES_NAO_SELECIONADO}
    Log To Console    message=[B3] Graphic Evolution Section Screen Wallet\n

Navigation To My Wallet From Bottom Nav Bar
    [Documentation]    Navigate To My Wallet From Bottom Nav Bar

    Wait Until Element Is Visible    locator=${BOTTOM_NAV_WALLET}    timeout=10
    Click Element    locator=${BOTTOM_NAV_WALLET}
    Sleep    2s
    Wait Until Element Is Visible    locator=${TITLE_WALLET}    timeout=10
    Click Element    locator=${BTN_NAV_PROVENTOS}
    Wait Until Element Is Visible    locator=${SCREEN_PROVENTS}    timeout=10
    # Click Element    locator=${BOTTOM_NAV_EXTRACT}
    # Wait Until Element Is Visible    locator=${SCREEN_EXTRACT}    timeout=10
    Click Element    locator=${BTN_NAV_MENU}
    Scroll Element Into View In Page    locator=${SCREEN_MENU}
    Wait Until Element Is Visible    locator=${SCREEN_MENU}    timeout=10
    Click Element    locator=${BOTTOM_NAV_HOME}
    Log To Console    message=[B3] Navigation To My Wallet From Bottom Nav Bar\n

Validate Events Section Screen Home
    [Documentation]    Validate Events Section Screen Home

    Scroll Element Into View In Page    locator=${TITLE_EVENTOS}
    Scroll Screen 
    Wait Until Element Is Visible    locator=${TITLE_EVENTOS}    timeout=10
    Click Element    locator=${TITLE_EVENTOS}
    Wait Until Element Is Visible    locator=${BTN_WALLET_BACK}    timeout=10
    Click Element    locator=${BTN_WALLET_BACK}
    # Scroll Element Into View In Page    locator=${EVENT_1_3}
    # Scroll Horizontal Long
    # Wait Until Element Is Visible    locator=${EVENT_2_3}    timeout=10
    # Scroll Horizontal Long
    # Wait Until Element Is Visible    locator=${EVENT_3_3}    timeout=10
    Scroll Element Into View In Page    locator=${BTN_CUSTOMIZE_SCREEN}
    Log To Console    message=[B3] Validate Events Section Screen Home\n    

Validate News Section Screen Home
    [Documentation]    Validate News Section Screen Home

    Scroll Element Into View In Page    locator=${TITLE_NOTICIAS}
    Wait Until Element Is Visible    locator=${TITLE_NOTICIAS}    timeout=10
    Click Element    locator=${TITLE_NOTICIAS}
    Wait Until Element Is Visible    locator=${BTN_WALLET_BACK}    timeout=10
    Click Element    locator=${BTN_WALLET_BACK}
    Log To Console    message=[B3] Validate News Section Screen Home\n