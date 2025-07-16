*** Settings ***
Documentation    Login

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

*** Test Cases ***
Validar acesso utilizando CPF
    [Documentation]    Validar acesso utilizando CPF
    [Tags]    acesso    regressivo

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    Should Be Home Page

Validar acesso utilizando CNPJ
    [Documentation]    Validar acesso utilizando CPF
    [Tags]    acesso    regressivo

    Simple Login    DOCUMENT=${users['user_cc_cnpj']['document']}
    ...             PASSWORD=${users['user_cc_cnpj']['password']}
    Should Be Home Page

Validar usuario sem investimento utilizando CPF
    [Documentation]    Validar usuário sem investimento utilizando CPF
    [Tags]    acesso    regressivo

    Document Login    DOCUMENT=${users['user_no_access_cpf']['document']}
    Should Be Message No Access

Validar usuario sem investimento utilizando CNPJ
    [Documentation]    Validar usuário sem investimento utilizando CNPJ
    [Tags]    acesso    regressivo

    Document Login    DOCUMENT=${users['user_no_access_cnpj']['document']}
    Should Be Message No Access

Validar esqueci minha senha utilizando CPF
    [Documentation]    Validar esqueci minha senha utilizando CPF
    [Tags]    acesso    esqueci_minha_senha    icaro

    Document Login    DOCUMENT=${users['user_cc_cpf']['document']}
    Forgot Password User
    ${TOKEN}=    Get Token Mailsac    EMAIL=${users['user_cc_cpf']['email']}
    Send Token User    TOKEN=${TOKEN}
    Create Password User    PASSWORD=${users['user_cc_cpf']['password']}
    Should Be Home Page

Validar esqueci minha senha utilizando CNPJ
    [Documentation]    Validar esqueci minha senha utilizando CNPJ
    [Tags]    acesso    esqueci_minha_senha

    Document Login    DOCUMENT=${users['user_cc_cnpj']['document']}
    Forgot Password User
    ${TOKEN}=    Get Token Mailsac    EMAIL=${users['user_cc_cnpj']['email']}
    Send Token User    TOKEN=${TOKEN}
    Create Password User    PASSWORD=${users['user_cc_cnpj']['password']}
    Should Be Home Page
