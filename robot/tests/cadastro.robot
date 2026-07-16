*** Settings ***
Documentation    Login

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

*** Test Cases ***
Validar cadastro utilizando CPF um email
    [Documentation]    Validar primeiro acesso utilizando CPF
    [Tags]    cadastro

    Document Login    DOCUMENT=${users['user_sc_cpf_one']['document']}
    ${TOKEN}=    Get Token Mailsac    EMAIL=${users['user_sc_cpf_one']['email']}
    Send Token User    TOKEN=${TOKEN}
    Create Password User    PASSWORD=${users['user_sc_cpf_one']['password']}
    Confirm Register User    EMAIL=${users['user_sc_cpf_one']['email']}
    ...                      PASSWORD=${users['user_sc_cpf_one']['password']}

Validar cadastro utilizando CNPJ um email
    [Documentation]    Validar primeiro acesso utilizando CNPJ
    [Tags]    cadastro

    Document Login    DOCUMENT=${users['user_sc_cnpj_one']['document']}
    ${TOKEN}=    Get Token Mailsac    EMAIL=${users['user_sc_cnpj_one']['email']}
    Send Token User    TOKEN=${TOKEN}
    Create Password User    PASSWORD=${users['user_sc_cnpj_one']['password']}
    Confirm Register User    EMAIL=${users['user_sc_cnpj_one']['email']}
    ...                      PASSWORD=${users['user_sc_cnpj_one']['password']}

Validar mensagem de erro para senha invalida utilizando CPF
    [Documentation]    Validar mensagem de erro para senha invalida utilizando CPF
    [Tags]    cadastro

    Document Login    DOCUMENT=${users['user_sc_cpf_one']['document']}
    ${TOKEN}=    Get Token Mailsac    EMAIL=${users['user_sc_cpf_one']['email']}
    Send Token User    TOKEN=${TOKEN}
    Create Password User    PASSWORD=${users['user_sc_cpf_one']['password']}
    Confirm Register User    EMAIL=${users['user_sc_cpf_one']['email']}
    ...                      PASSWORD=${users['user_sc_cpf_one']['password_error']}

Validar mensagem de erro para senha invalida utilizando CNPJ
    [Documentation]    Validar mensagem de erro para senha invalida utilizando CNPJ
    [Tags]    cadastro

    Document Login    DOCUMENT=${users['user_sc_cnpj_one']['document']}
    ${TOKEN}=    Get Token Mailsac    EMAIL=${users['user_sc_cnpj_one']['email']}
    Send Token User    TOKEN=${TOKEN}
    Create Password User    PASSWORD=${users['user_sc_cnpj_one']['password']}
    Confirm Register User    EMAIL=${users['user_sc_cnpj_one']['email']}
    ...                      PASSWORD=${users['user_sc_cnpj_one']['password_error']}

Validar mensagem de erro para token invalido utilizando CPF
    [Documentation]    Validar primeiro acesso utilizando CPF
    [Tags]    cadastro

    Document Login    DOCUMENT=${users['user_sc_cpf_one']['document']}
    ${TOKEN}=    Set Variable    123456
    Send Token User    TOKEN=${TOKEN}

Validar mensagem de erro para token invalido utilizando CNPJ
    [Documentation]    Validar mensagem de erro para token invalido utilizando CNPJ
    [Tags]    cadastro

    Document Login    DOCUMENT=${users['user_sc_cnpj_one']['document']}
    ${TOKEN}=    Set Variable    123456
    Send Token User    TOKEN=${TOKEN}

Validar cadastro utilizando CPF
    [Documentation]    Validar primeiro acesso utilizando CPF
    [Tags]    cadastro

    Document Login    DOCUMENT=${users['user_sc_cpf_two']['document']}
    Select Email Token
    ${TOKEN}=    Get Token Mailsac    EMAIL=${users['user_sc_cpf_two']['email']}
    Send Token User    TOKEN=${TOKEN}
    Create Password User    PASSWORD=${users['user_sc_cpf_two']['password']}
    Confirm Register User    EMAIL=${users['user_sc_cpf_two']['email']}
    ...                      PASSWORD=${users['user_sc_cpf_two']['password']}

Validar cadastro utilizando CNPJ
    [Documentation]    Validar primeiro acesso utilizando CNPJ
    [Tags]    cadastro

    Document Login    DOCUMENT=${users['user_sc_cnpj_two']['document']}
    Select Email Token
    ${TOKEN}=    Get Token Mailsac    EMAIL=${users['user_sc_cnpj_two']['email']}
    Send Token User    TOKEN=${TOKEN}
    Create Password User    PASSWORD=${users['user_sc_cnpj_two']['password']}
    Confirm Register User    EMAIL=${users['user_sc_cpf_two']['email']}
    ...                      PASSWORD=${users['user_sc_cpf_two']['password']}

Validar mensagem informativa quando usuario perder acesso ao email utilizando CPF
    [Documentation]    Validar mensagem informativa quando usuário perder acesso ao e-mail utilizando CPF
    [Tags]    cadastro

    Document Login    DOCUMENT=${users['user_sc_cpf_one']['document']}
    Go To Lost Access
    Should Be Help Center

Validar mensagem informativa quando usuario perder acesso ao email utilizando CNPJ
    [Documentation]    Validar mensagem informativa quando usuário perder acesso ao e-mail utilizando CNPJ
    [Tags]    cadastro

    Document Login    DOCUMENT=${users['user_sc_cnpj_one']['document']}
    Go To Lost Access
    Should Be Help Center
