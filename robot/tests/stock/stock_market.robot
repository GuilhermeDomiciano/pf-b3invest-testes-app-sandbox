*** Settings ***
Documentation    Stock Market

Resource    ${EXECDIR}/robot/base.resource
Resource    ../../functions/stock/stock_market_functions.resource
Resource    ../../functions/login/login_functions.resource
Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    stock_market

*** Test Cases ***
Validar Card Do Ibovespa Bolsa
    [Documentation]    Valida os campos do card do Ibovespa (título, status, atualização, pontos, mínima e máxima) na home.
    [Tags]    ibovespa_home

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigate To Stock Market 
    Validate Stock Market Card
    
Validar botão de informações complementares do Ibovespa Bolsa
    [Documentation]    Valida se é possível clicar no botão de informações complementares do card do Ibovespa.
    [Tags]    ibovespa_home

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigate To Stock Market
    Validate Stock Market Title
    Click Stock Market More Info Button
    
Validar gráfico do Ibovespa Bolsa
    [Documentation]    Valida se é possível visualizar o gráfico do Ibovespa na home.
    [Tags]    ibovespa_home

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigate To Stock Market
    Validate Stock Market Overview Title
