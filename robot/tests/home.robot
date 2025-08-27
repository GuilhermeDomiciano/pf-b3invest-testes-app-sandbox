*** Settings ***
Documentation    Home

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    home

*** Test Cases ***
Validar secao resumo do patrimonio na home
    [Documentation]    Validar secao resumo do patrimonio na home
    [Tags]    resumo_patrimonio

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Validate Home Login

#Validar secao minha carteira na home
#    [Documentation]    Validar secao minha carteira na home
#    [Tags]    minha_carteira
#
#    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#    ...             PASSWORD=${users['user_cc_cpf']['password']}
#    No Accept Permissions
#    Skip Profile
#    Validate Home Login
#
#Validar secao evolucao patrimonial na home
#    [Documentation]    Validar secao evolucao patrimonial na home
#    [Tags]    evolucao_patrimonial
#
#    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#    ...             PASSWORD=${users['user_cc_cpf']['password']}
#    No Accept Permissions
#    Skip Profile
#    Validate Home Login
#
#Validar secao open finance na home
#    [Documentation]    Validar secao open finance na home
#    [Tags]    open_finance
#
#    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#    ...             PASSWORD=${users['user_cc_cpf']['password']}
#    No Accept Permissions
#    Skip Profile
#    Validate Home Login
#
#Validar botao de personalização na home
#    [Documentation]    Validar botao de personalização na home
#    [Tags]    custom_home
#    
#    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#    ...             PASSWORD=${users['user_cc_cpf']['password']}
#    No Accept Permissions
#    Skip Profile
#    Validate Button Customize Home Screen
#
#Validar ocultação da minha carteira na home
#    [Documentation]    Validar ocultação da minha carteira na home
#    [Tags]    minha_carteira
#
#    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#    ...             PASSWORD=${users['user_cc_cpf']['password']}
#    No Accept Permissions
#    Skip Profile
#    Validate Button Customize Home Screen
#    Hide My Wallet
#    Scroll Until Element Not Found    locator_1=${TXT_TITLE_MY_WALLET}    locator_2=${BTN_CUSTOMIZE_SCREEN}
#
#Validar ocultação da evolução patrimonial na home
#    [Documentation]    Validar ocultação da evolução patrimonial na home
#    [Tags]    evolução_patrimonial
#
#    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#    ...             PASSWORD=${users['user_cc_cpf']['password']}
#    No Accept Permissions
#    Skip Profile
#    Validate Button Customize Home Screen
#    Hide Asset Evoluation
#    Scroll Until Element Not Found    locator_1=${TITLE_ASSET_EVOLUTION}    locator_2=${BTN_CUSTOMIZE_SCREEN}
#
#Validar ocultação do Openfinance na home
#    [Documentation]    Validar ocultação do Openfinance na home
#    [Tags]    openfinance
#
#    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#    ...             PASSWORD=${users['user_cc_cpf']['password']}
#    No Accept Permissions
#    Skip Profile
#    Validate Button Customize Home Screen
#    Hide Openfinance
#    Scroll Until Element Not Found    locator_1=${TITLE_OPENFINANCE}    locator_2=${BTN_CUSTOMIZE_SCREEN}
#
#Validar ocultação de Eventos na home
#    [Documentation]    Validar ocultação de Eventos na home
#    [Tags]    eventos
#
#    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#    ...             PASSWORD=${users['user_cc_cpf']['password']}
#    No Accept Permissions
#    Skip Profile
#    Validate Button Customize Home Screen
#    Hide Eventos
#    Scroll Until Element Not Found    locator_1=${TITLE_EVENTOS}    locator_2=${BTN_CUSTOMIZE_SCREEN}
#
#Validar ocultação de Notícias na home
#    [Documentation]    Validar ocultação de Notícias na home
#    [Tags]    noticias
#
#    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#    ...             PASSWORD=${users['user_cc_cpf']['password']}
#    No Accept Permissions
#    Skip Profile
#    Validate Button Customize Home Screen
#    Hide Noticias
#    Scroll Until Element Not Found    locator_1=${TITLE_NOTICIAS}    locator_2=${BTN_CUSTOMIZE_SCREEN}
