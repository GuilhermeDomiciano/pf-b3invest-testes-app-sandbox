*** Settings ***
Documentation    Cadastro Screen

Library          AppiumLibrary

Variables    ${EXECDIR}/robot/elements/cadastro.yaml

*** Keywords ***
Validate Contains Message No Access
    [Documentation]    Validate Contains Message No Access

    Wait Until Page Contains Element    locator=${TXT_NO_ACCESS}    timeout=15

Click Select List Email
    [Documentation]    Click Select List Email

    Wait Until Element Is Visible    locator=${BTN_EMAIL_SELECT}    timeout=15
    Click Element    locator=${BTN_EMAIL_SELECT}

Click Lost Access
    [Documentation]    Click Lost Access

    Wait Until Element Is Visible    locator=${BTN_LOST_ACCESS}    timeout=15
    Click Element    locator=${BTN_LOST_ACCESS}

Validate Contains Button Help Center
    [Documentation]    Validate Contains Button Help Center

    Wait Until Page Contains Element    locator=${BTN_HELP_CENTER}    timeout=15

Send Token One
    [Documentation]    Send Token One
    [Arguments]    ${token}

    Wait Until Element Is Visible    locator=${INPT_TOKEN_ONE}
    Click Element    locator=${INPT_TOKEN_ONE}
    Input Text    locator=${INPT_TOKEN_ONE}    text=${token}

Send Token Two
    [Documentation]    Send Token Two
    [Arguments]    ${token}

    Wait Until Element Is Visible    locator=${INPT_TOKEN_TWO}
    Click Element    locator=${INPT_TOKEN_TWO}
    Input Text    locator=${INPT_TOKEN_TWO}    text=${token}

Send Token Three
    [Documentation]    Send Token Three
    [Arguments]    ${token}

    Wait Until Element Is Visible    locator=${INPT_TOKEN_THREE}
    Click Element    locator=${INPT_TOKEN_THREE}
    Input Text    locator=${INPT_TOKEN_THREE}    text=${token}

Send Token Four
    [Documentation]    Send Token Four
    [Arguments]    ${token}

    Wait Until Element Is Visible    locator=${INPT_TOKEN_FOUR}
    Click Element    locator=${INPT_TOKEN_FOUR}
    Input Text    locator=${INPT_TOKEN_FOUR}    text=${token}

Send Token Five
    [Documentation]    Send Token Five
    [Arguments]    ${token}

    Wait Until Element Is Visible    locator=${INPT_TOKEN_FIVE}
    Click Element    locator=${INPT_TOKEN_FIVE}
    Input Text    locator=${INPT_TOKEN_FIVE}    text=${token}

Send Token Six
    [Documentation]    Send Token Six
    [Arguments]    ${token}

    Wait Until Element Is Visible    locator=${INPT_TOKEN_SIX}
    Click Element    locator=${INPT_TOKEN_SIX}
    Input Text    locator=${INPT_TOKEN_SIX}    text=${token}

Send Create Password
    [Documentation]    Send Create Password
    [Arguments]    ${PASSWORD}

    Wait Until Element Is Visible    locator=${INPT_CREATE_PASSWORD}    timeout=15
    Click Element    locator=${INPT_CREATE_PASSWORD}
    Input Text    locator=${INPT_CREATE_PASSWORD}    text=${PASSWORD}

Send Confirm Password
    [Documentation]    Send Confirm Password
    [Arguments]    ${PASSWORD}

    Wait Until Element Is Visible    locator=${INPT_CONFIRM_PASSWORD}    timeout=15
    Click Element    locator=${INPT_CONFIRM_PASSWORD}
    Input Text    locator=${INPT_CONFIRM_PASSWORD}    text=${PASSWORD}

Click Confirm Password
    [Documentation]    Click Confirm Password

    Wait Until Element Is Visible    locator=${BTN_CREATE_CONTINUE_PASSWORD}
    Click Element    locator=${BTN_CREATE_CONTINUE_PASSWORD}
