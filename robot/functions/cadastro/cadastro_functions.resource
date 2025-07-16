*** Settings ***
Documentation    Cadastro Functions

Resource    ${EXECDIR}/robot/screens/cadastro/cadastro_screen.resource

*** Keywords ***
Should Be Message No Access
    [Documentation]    Should Be Message No Access

    Validate Contains Message No Access

Select Email Token
    [Documentation]    Select List Email

    Click Select List Email

Go To Lost Access
    [Documentation]    Go To Lost Access

    Click Lost Access

Should Be Help Center
    [Documentation]    Should Be Help Center

    Validate Contains Button Help Center

Send Token User
    [Documentation]    Send Token
    [Arguments]    ${TOKEN}

    Send Token One    token=${token[0]}
    Send Token Two    token=${token[1]}
    Send Token Three  token=${token[2]}
    Send Token Four   token=${token[3]}
    Send Token Five   token=${token[4]}
    Send Token Six    token=${token[5]}

Create Password User
    [Documentation]    Create Password User
    [Arguments]    ${PASSWORD}

    Send Create Password    PASSWORD=${PASSWORD}
    Send Confirm Password    PASSWORD=${PASSWORD}
    Click Confirm Password
