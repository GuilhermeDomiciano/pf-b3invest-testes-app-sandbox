*** Settings ***
Documentation    Cadastro Screen

Library          AppiumLibrary

Variables    ${EXECDIR}/robot/elements/cadastro.yaml

*** Keywords ***
Validate Password Requirements Section
    [Documentation]    Valida se todos os elementos de requisitos da senha estão visíveis na tela de criação de nova senha.
    ...    Elementos validados:
    ...    - ${TXT_PASSWORD_REQUIREMENTS_TITLE}
    ...    - ${TXT_REQ_MIN_8_CHARS}
    ...    - ${TXT_REQ_UPPERCASE}
    ...    - ${TXT_REQ_SPECIAL_CHAR}
    ...    - ${TXT_REQ_LOWERCASE}
    ...    - ${TXT_REQ_NUMBER}
    ...    - ${TXT_REQ_NO_SPACES}
    Wait Until Element Is Visible    locator=${TXT_PASSWORD_REQUIREMENTS_TITLE}    timeout=15
    Wait Until Element Is Visible    locator=${TXT_REQ_MIN_8_CHARS}    timeout=5
    Wait Until Element Is Visible    locator=${TXT_REQ_UPPERCASE}    timeout=5
    Wait Until Element Is Visible    locator=${TXT_REQ_SPECIAL_CHAR}    timeout=5
    Wait Until Element Is Visible    locator=${TXT_REQ_LOWERCASE}    timeout=5
    Wait Until Element Is Visible    locator=${TXT_REQ_NUMBER}    timeout=5
    Wait Until Element Is Visible    locator=${TXT_REQ_NO_SPACES}    timeout=5

Validate Password Requirements Section (Loop)
    [Documentation]    Alternativa usando loop para validar todos os elementos de requisitos de senha.
    ...    Facilita manutenção caso novos requisitos sejam adicionados no YAML.
    @{REQ_ITEMS}=    Create List    ${TXT_REQ_MIN_8_CHARS}    ${TXT_REQ_UPPERCASE}    ${TXT_REQ_SPECIAL_CHAR}    ${TXT_REQ_LOWERCASE}    ${TXT_REQ_NUMBER}    ${TXT_REQ_NO_SPACES}
    Wait Until Element Is Visible    locator=${TXT_PASSWORD_REQUIREMENTS_TITLE}    timeout=15
    FOR    ${item}    IN    @{REQ_ITEMS}
        Wait Until Element Is Visible    locator=${item}    timeout=5
    END

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

Click Continue
    [Documentation]    Click Continue

    Wait Until Element Is Visible    locator=${BTN_CONTINUE_OTP}
    Click Element    locator=${BTN_CONTINUE_OTP}

Send Create Password
    [Documentation]    Send Create Password
    [Arguments]    ${PASSWORD}

    Wait Until Element Is Visible    locator=${INPT_CREATE_PASSWORD}    timeout=15
    Click Element    locator=${INPT_CREATE_PASSWORD}
    Input Text    locator=${INPT_CREATE_PASSWORD}    text=${PASSWORD}

Send Confirm Password
    [Documentation]    Send Confirm Password
    [Arguments]    ${PASSWORD}

    # Wait Until Element Is Visible    locator=${INPT_CONFIRM_PASSWORD}    timeout=15
    Click Element    locator=${BTN_CONTINUE_CREATE_PASSWORD}
    # Input Text    locator=${INPT_CONFIRM_PASSWORD}    text=${PASSWORD}

Click Confirm Password
    [Documentation]    Click Confirm Password

    Wait Until Element Is Visible    locator=${BTN_CREATE_CONTINUE_PASSWORD}
    Click Element    locator=${BTN_CREATE_CONTINUE_PASSWORD}

Validate Register User
    [Documentation]    Validate Register User

    # Mudar locator
    Wait Until Element Is Visible    locator=${BTN_CREATE_CONTINUE_PASSWORD}

Confirm Password Change
    [Documentation]    Confirm Password Change
    Wait Until Element Is Visible    locator=${TXT_NOVA_SENHA_CRIADA}    timeout=15
    Wait Until Element Is Visible    locator=${TXT_SENHA_ATUALIZADA}    timeout=15
    Click Element   locator=${BTN_ACESSAR}
