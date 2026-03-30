*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    wallet

*** Test Cases ***
Navegar para Minha Carteira
    [Documentation]    Navigate to My Wallet from the home screen
    [Tags]    navegacao_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet

Validar secao my wallet
    [Documentation]    Validate 'my wallet' section in the wallet
    [Tags]    resumo_patrimonio

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate My Wallet Section Screen Wallet

Validate Toggle Visibility Screen Wallet
    [Documentation]    Validate value hiding in the 'my wallet' section
    [Tags]    resumo_patrimonio

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Toggle Visibility Section Screen Wallet

Validate Allocation Filters
    [Documentation]    Validate allocation section filters (Product, Class, Institution)
    [Tags]    alocacao_filtros

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate My Allocation Filter Buttons Section Screen Wallet

Validate Quick Access Section
    [Documentation]    Validate quick access section in the wallet
    [Tags]    acesso_rapido

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    wallet_functions.Validate Access All Products Button Section Screen Wallet

Validate Wallet Action Buttons
    [Documentation]    Validate action buttons in the horizontal scroll area
    [Tags]    acoes_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    # todo: saiu do MVP vai voltar. Validate Wallet Action Buttons Section Screen Wallet

Validate Charts Toggle Bar
    [Documentation]    Validate selection of bar chart
    [Tags]    graficos_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Click Graphic Bar Section Screen Wallet

Validate Charts Toggle Line
    [Documentation]    Validate selection of line chart
    [Tags]    graficos_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Click Graphic Line Section Screen Wallet

Validate Provents Section
    [Documentation]    Validate provents section (received and to receive)
    [Tags]    proventos_carteira

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Provents Title Section Screen Wallet

Validate Disclosure Results Section
    [Documentation]    Validate disclosure results section
    [Tags]    divulgacao_resultados

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    # TODO: difulgacao de resultados saiu do mvp validar quando voltar
    # Validate Disclosure Results Title Section Screen Wallet
