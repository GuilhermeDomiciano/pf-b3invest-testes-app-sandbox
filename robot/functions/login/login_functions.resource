*** Settings ***
Documentation    Login Functions

Resource    ${EXECDIR}/robot/screens/walkthrough/walkthrough_screen.resource
Resource    ${EXECDIR}/robot/screens/login/login_screen.resource
Library    ../../../.venv/lib/python3.9/site-packages/AppiumLibrary/__init__.py

*** Keywords ***
Simple Login
    [Documentation]    Simple Login
    [Arguments]    ${DOCUMENT}    ${PASSWORD}

    Click Button Start Using

    Log To Console    \n[B3] Login - Document: (${DOCUMENT}) - Password: (${PASSWORD})

    Send Keys Document    DOCUMENT=${DOCUMENT}
    Click Button Continue Document

    Wait Until Page Contains    text=Agora digite sua senha.   timeout=15s
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

    Validate Contains Text Home Page

Forgot Password User
    [Documentation]    Forgot Password User

    Click Button Forgot Password

No Accept Permissions
    [Documentation]    No Accept Permissions

    Click Button No Accept Touch Id
    Click Button No Accept Notify
    Click Button No Accept Location

Skip Profile
    [Documentation]    Skip Profile

    Click Button No Accept Discover Profile
