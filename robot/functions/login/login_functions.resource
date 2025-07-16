*** Settings ***
Documentation    Login Functions

Resource    ${EXECDIR}/robot/screens/walkthrough/walkthrough_screen.resource
Resource    ${EXECDIR}/robot/screens/login/login_screen.resource

*** Keywords ***
Simple Login
    [Documentation]    Simple Login
    [Arguments]    ${DOCUMENT}    ${PASSWORD}

    Click Button Start Using

    Log To Console    \n[B3] Login - Document: (${DOCUMENT}) - Password: (${PASSWORD})

    Send Keys Document    DOCUMENT=${DOCUMENT}
    Click Button Continue Document

    Send Keys Password    PASSWORD=${PASSWORD}
    Click Button Continue Password

    Log To Console    \n[B3] Simple Login Successful...

Document Login
    [Documentation]    Simple Login
    [Arguments]    ${DOCUMENT}

    Click Button Start Using

    Log To Console    \n[B3] Login - Document: (${DOCUMENT})

    Send Keys Document    DOCUMENT=${DOCUMENT}
    Click Button Continue Document

Should Be Home Page
    [Documentation]    Should Be Home Page

    Click Button No Accept Touch Id
    Click Button No Accept Notify
    # Validate Contains Text Home Page

Forgot Password User
    [Documentation]    Forgot Password User

    Click Button Forgot Password
