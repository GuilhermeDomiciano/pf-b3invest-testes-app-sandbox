*** Settings ***
Documentation    Login Screen

Library          AppiumLibrary

Variables        ${EXECDIR}/robot/elements/login.yaml

*** Keywords ***
Send Keys Document
    [Documentation]    Send Keys Document
    [Arguments]    ${DOCUMENT}

    Wait Until Element Is Visible    locator=${INPT_CPF_CNPJ}    timeout=15
    Click Element    locator=${INPT_CPF_CNPJ}
    Input Text    locator=${INPT_CPF_CNPJ}    text=${DOCUMENT}

Click Button Continue Document
    [Documentation]    Click Button Continue Document

    Click Element    locator=${BTN_CONTINUE_DOCUMENT}

Send Keys Password
    [Documentation]    Send Keys Password
    [Arguments]    ${PASSWORD}

    Sleep    8
    Wait Until Element Is Visible    locator=${INPT_PASSWORD}    timeout=15
    Click Element    locator=${INPT_PASSWORD}
    Input Text    locator=${INPT_PASSWORD}    text=${PASSWORD}

Click Button Continue Password
    [Documentation]    Click Button Continue Password

    Click Element    locator=${BTN_CONTINUE_PASSWORD}

Click Button No Accept Touch Id
    [Documentation]    Click Button No Accept Touch Id

    Run Keyword And Ignore Error  Wait Until Element Is Visible    locator=${BTN_AGORA_NAO_TOUCH_ID}    timeout=10
    Run Keyword And Ignore Error  Click Element    locator=${BTN_AGORA_NAO_TOUCH_ID}

Click Button No Accept Notify
    [Documentation]    Click Button No Accept Notify

    Run Keyword And Ignore Error  Wait Until Element Is Visible    locator=${BTN_AGORA_NAO_NOTIFY}    timeout=10
    Run Keyword And Ignore Error  Click Element    locator=${BTN_AGORA_NAO_NOTIFY}

Click Button No Accept Discover Profile
    [Documentation]    Click Button No Accept Discover Profile 
    Run Keyword And Ignore Error  Wait Until Element Is Visible    locator=${BTN_SKIP_PROFILE}    timeout=10
    Run Keyword And Ignore Error  Click Element    locator=${BTN_SKIP_PROFILE}
    Wait Until Element Is Visible    locator=${HIDE_VALUE}    timeout=10
    Click Element    locator=${BTN_SHOW_VALUE}

Validate Contains Text Home Page
    [Documentation]    Validate Contains Text Home Page

    Wait Until Element Is Visible    locator=${TXT_HOME}    timeout=20

Click Button Forgot Password
    [Documentation]    Click Button Forgot Password

    Wait Until Element Is Visible    locator=${BTN_FORGOR_PASSWORD}    timeout=10
    Click Element    locator=${BTN_FORGOR_PASSWORD}
