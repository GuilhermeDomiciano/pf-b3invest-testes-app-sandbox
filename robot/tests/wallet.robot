*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    wallet

*** Test Cases ***
Navegar para Minha Carteira
    [Documentation]    Navegar para Minha Carteira a partir da tela inicial
    [Tags]    navegacao_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet

Validar secao my wallet
    [Documentation]    Validar secao my wallet na carteira
    [Tags]    resumo_patrimonio

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate My Wallet Section Screen Wallet

Validate Toggle Visibility Screen Wallet
    [Documentation]    Validar ocultação valores na secao minha carteira
    [Tags]    resumo_patrimonio

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Toggle Visibility Section Screen Wallet

Validate Allocation Section
    [Documentation]    Validar seção de alocação da carteira
    [Tags]    alocacao_patrimonio

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate My Allocation Filter Buttons Section Screen Wallet

Validate Allocation Filters
    [Documentation]    Validar filtros da seção de alocação (Produto, Classe, Instituição)
    [Tags]    alocacao_filtros

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate My Allocation Filter Buttons Section Screen Wallet

Validate Quick Access Section
    [Documentation]    Validar seção de acesso rápido na carteira
    [Tags]    acesso_rapido

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Access All Products Button Section Screen Wallet

Validate Wallet Action Buttons
    [Documentation]    Validar botões de ação na área de scroll horizontal
    [Tags]    acoes_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Wallet Action Buttons Section Screen Wallet

Validate Charts Toggle Bar
    [Documentation]    Validar seleção do gráfico de barras
    [Tags]    graficos_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Click Graphic Bar Section Screen Wallet

Validate Charts Toggle Line
    [Documentation]    Validar seleção do gráfico de linhas
    [Tags]    graficos_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Click Graphic Line Section Screen Wallet

Validate Provents Section
    [Documentation]    Validar seção de proventos (recebidos e a receber)
    [Tags]    proventos_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Provents Title Section Screen Wallet

Validate Disclosure Results Section
    [Documentation]    Validar seção de divulgação de resultados
    [Tags]    divulgacao_resultados

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Disclosure Results Title Section Screen Wallet
