*** Settings ***
Documentation    Stock Market Screen

Library          AppiumLibrary

Resource    ../../../resource/utils/element_utils.resource

Variables    ../../../robot/elements/stock_market.yaml

*** Keywords ***
Navigate To Stock Market Screen
    [Documentation]    Navega para a tela de mercado de ações.
    [Tags]    navigation
    Wait Until Element Is Visible    locator=${BTN_STOCK_MARKET}    timeout=10
    Click Element    locator=${BTN_STOCK_MARKET}
    Log To Console    message=[B3] Navigate To Stock Market Screen\n

Validate Stock Market Title Screen
    [Documentation]    Validate Stock Market Title Screen
    Wait Until Element Is Visible    locator=${TITLE_STOCK}    timeout=10
    Log To Console    message=[B3] Validate Stock Market Title\n

Validate Stock Market Status Screen
    [Documentation]    Validate Stock Market Status Screen (Mercado aberto ou Mercado fechado)

    ${is_open}=    Run Keyword And Return Status    Wait Until Element Is Visible    locator=${OPEN_STOCK}    timeout=5
    IF    ${is_open}
        Log To Console    message=[B3] Validate Stock Market Status - Mercado aberto\n
    ELSE
        Wait Until Element Is Visible    locator=${CLOSE_STOCK}    timeout=10
        Log To Console    message=[B3] Validate Stock Market Status - Mercado fechado\n
    END

Validate Stock Market Update Subtitle Screen
    [Documentation]    Validate Stock Market Update Subtitle Screen

    Wait Until Element Is Visible    locator=${SUB_TITLE_UPDATED}    timeout=10
    Log To Console    message=[B3] Validate Stock Market Update Subtitle\n

Validate Stock Market Index Points Screen
    [Documentation]    Validate Stock Market Index Points Screen

    Wait Until Element Is Visible    locator=${INDEX_POINTS}    timeout=10
    Log To Console    message=[B3] Validate Stock Market Index Points\n

Validate Stock Market Minimum Points Screen
    [Documentation]    Validate Stock Market Minimum Points Screen

    Wait Until Element Is Visible    locator=${MINIMUM_POINTS}    timeout=10
    Log To Console    message=[B3] Validate Stock Market Minimum Points\n

Validate Stock Market Maximum Points Screen
    [Documentation]    Validate Stock Market Maximum Points Screen

    Wait Until Element Is Visible    locator=${MAXIMUM_POINTS}    timeout=10
    Log To Console    message=[B3] Validate Stock Market Maximum Points\n

Click Stock Market More Info Button Screen
    [Documentation]    Click Stock Market More Info Button Screen

    Scroll Element Into View In Page    locator=${BTN_MORE_INFO}
    Wait Until Element Is Visible    locator=${BTN_MORE_INFO}    timeout=10
    Click Element    locator=${BTN_MORE_INFO}
    Wait Until Element Is Visible    locator=${BOTTOM_SHEET_TITLE_COMPLEMENTARY_INFO}    timeout=10
    Wait Until Element Is Visible    locator=${BOTTOM_SHEET_TXT_COMPLEMENTARY_INFO}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_CLOSE}    timeout=10
    Click Element    locator=${BTN_CLOSE}
    Wait Until Element Is Visible    locator=${BTN_1_DAY_SELECTED}    timeout=10
    Log To Console    message=[B3] Click Stock Market More Info Button\n

Validate Stock Market Overview Title Screen
    [Documentation]    Validate Stock Market Overview Title Screen
    
    Wait Until Element Is Visible    locator=${BTN_1_DAY_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_7_DAYS_NOT_SELECTED}    timeout=10
    Click Element    locator=${BTN_7_DAYS_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${BTN_1_DAY_NOT_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_7_DAYS_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_1_MONTH_NOT_SELECTED}    timeout=10
    Click Element    locator=${BTN_1_MONTH_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${BTN_1_MONTH_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_6_MONTHS_NOT_SELECTED}    timeout=10
    Click Element    locator=${BTN_6_MONTHS_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${BTN_6_MONTHS_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_1_YEAR_NOT_SELECTED}    timeout=10
    Click Element    locator=${BTN_1_YEAR_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${BTN_1_YEAR_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_5_YEARS_NOT_SELECTED}    timeout=10
    Click Element    locator=${BTN_5_YEARS_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${BTN_5_YEARS_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_1_DAY_NOT_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_12_APR_2026_NOT_SELECTED}    timeout=10
    Click Element    locator=${BTN_12_APR_2026_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${BTN_12_APR_2026_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${DAY_GRAFIC_SELECTED}    timeout=10


    Wait Until Page Does Not Contain Element    locator=${MAXIMUM_POINTS}    timeout=10
    Wait Until Page Does Not Contain Element    locator=${MINIMUM_POINTS}    timeout=10

    Wait Until Element Is Visible    locator=${TITLE_MARKET_OVERVIEW}    timeout=10

    Scroll Element Into View In Page    locator=${TITLE_RANKING_OF_THE_DAY}
    Wait Until Element Is Visible   locator=${TITLE_RANKING_OF_THE_DAY}    timeout=1
    Wait Until Element Is Visible   locator=${MARKET_OVERVIEW_IFIX}    timeout=10
    Wait Until Element Is Visible   locator=${MARKET_OVERVIEW_IDIV}    timeout=10
    Log To Console    message=[B3] Validate Stock Market Overview Title\n