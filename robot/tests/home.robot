*** Settings ***
Documentation    Home

Resource    ${EXECDIR}/robot/base.resource
Resource    ../functions/home/home_functions.resource
Resource    ../../robot/base.resource
Resource    ../functions/login/login_functions.resource
Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3


Test Tags    home

# 22 cenarios de teste relacionados a tela de home
*** Test Cases ***
Validar secao resumo do patrimonio na home
    [Documentation]    Validar secao resumo do patrimonio na home
    [Tags]    resumo_patrimonio

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Validate Home Login
Validar botao de personalização na home
    [Documentation]    Validar botao de personalização na home
    [Tags]    custom_home
    
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Validate Button Customize Home Screen

Validar ocultação da minha carteira na home
    [Documentation]    Validar ocultação da minha carteira na home
    [Tags]    minha_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Validate Home Screen Before Customization    ${TITLE_WALLET}
    Validate Button Customize Home Screen
    Hide My Wallet
    Validate Home Screen After Customization Screen    ${TITLE_WALLET}
Validar ocultação da evolução patrimonial na home
    [Documentation]    Validar ocultação da evolução patrimonial na home
    [Tags]    evolução_patrimonial

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
     Validate Home Screen Before Customization    ${TITLE_ASSET_EVOLUTION}
    Validate Button Customize Home Screen
    Hide Asset Evoluation
    Scroll Element Into View Top In Page     locator=${BTN_TOGGLE_VISIBILITY}
    Scroll Until Element Not Found    locator_1=${TITLE_ASSET_EVOLUTION}    locator_2=${BTN_CUSTOMIZE_SCREEN}

# Todo: fora do mvp
# Validar ocultação do Openfinance na home
#     [Documentation]    Validar ocultação do Openfinance na home
#     [Tags]    openfinance

#     Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#     ...             PASSWORD=${users['user_cc_cpf']['password']}
#     No Accept Permissions
#     Skip Profile
#     Validate Button Customize Home Screen
#     Hide Openfinance
#     Scroll Until Element Not Found    locator_1=${TITLE_OPENFINANCE}    locator_2=${BTN_CUSTOMIZE_SCREEN}

Validar ocultação de Eventos na home
    [Documentation]    Validar ocultação de Eventos na home
    [Tags]    eventos

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Validate Home Screen Before Customization    ${TITLE_EVENTOS}
    Validate Button Customize Home Screen
    Hide Eventos
    Validate Home Screen After Customization Screen    ${TITLE_EVENTOS}

Validar ocultação de Notícias na home
    [Documentation]    Validar ocultação de Notícias na home
    [Tags]    noticias

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Validate Home Screen Before Customization    ${TITLE_NOTICIAS}
    Validate Button Customize Home Screen
    Hide Noticias
    Validate Home Screen After Customization Screen    ${TITLE_NOTICIAS}

Validar Home Navigation, Evolution, Donuts
    [Documentation]    PFSAPP-220, 213, 212, tem uma validacao aqui de navegar para renda fixa, variavel e internacional
    [Tags]    navegacao_minha_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet From Card
    Graphic Donut Section Screen Wallet
    Graphic Evolution Section Screen Wallet

Validar Navigation Bar, News, Events
    [Documentation]    PFSAPP-215, 216, 217
    [Tags]    navegacao_minha_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet From Bottom Nav Bar
    Validate Events Section Screen Home
    Validate News Section Screen Home
    