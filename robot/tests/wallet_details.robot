*** Settings ***
Documentation    Wallet Details - Navegação e validação do botão Voltar na tela de detalhe da classe

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    wallet_details

*** Test Cases ***
Validate Back Button In Class Detail Screen
    [Documentation]    WD-001 - Navega até a tela de detalhe de classe e valida a existência do botão de voltar no topo.
    ...                Fluxo: Login simples -> Ignorar permissões -> Pular perfil -> Ir para carteira -> Abrir filtro Classe -> Abrir detalhe (primeira classe) -> Validar botão voltar.
    [Tags]    back_button_detail_class    smoke

    # Login e navegação até carteira
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Validate Class Detail Overview
    Wait Until Element Is Visible    ${CLASS_DETAIL_BTN_VOLTAR}    timeout=10s
    Back Navigation From Class Detail
    wallet_functions.Validate Ballance Filters
    Log    Validação do botão voltar na tela de detalhe concluída

Open Institution Filter Bottom Sheet (Draft)
    [Documentation]    FILTER-001 - Abre bottom sheet de filtro de Instituição (locators placeholders).
    [Tags]    filter    instituicao    draft
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Open Institution Filter Wrapper
    Apply Institution Filters Wrapper
    Clear Institution Filters Wrapper
    Log    Bottom sheet Instituição aberto (placeholder)

Open Product Filter Bottom Sheet (Draft)
    [Documentation]    FILTER-002 - Abre bottom sheet de filtro de Produto (locators placeholders).
    [Tags]    filter    produto    draft
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Open Product Filter Wrapper
    Log    Bottom sheet Produto aberto (placeholder)

Apply Single Institution Filter
    [Documentation]    FILTER-INST-001 - Seleciona uma única Instituição e aplica filtro.
    [Tags]    filter    instituicao    single
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Open Institution Filter Wrapper
    Select Institution Item By Index Wrapper    1
    Assert Institution Apply Enabled Wrapper
    Apply Institution Filters Wrapper
    Wait Institution Bottom Sheet Closed Wrapper
    Assert Institution Chip Visible Wrapper
    Assert Institution One Selected Item Wrapper
    Log    Filtro de Instituição aplicado com uma seleção.

Apply Multiple Institution Filters
    [Documentation]    FILTER-INST-002 - Seleciona múltiplas Instituições e aplica filtro.
    [Tags]    filter    instituicao    multi
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Open Institution Filter Wrapper
    Select Multiple Institution Items Wrapper     3    4
    Assert Institution Apply Enabled Wrapper
    Apply Institution Filters Wrapper
    Wait Institution Bottom Sheet Closed Wrapper
    Assert Institution Chip Visible Wrapper
    Assert Institution Two Selected Items Wrapper
    Log    Filtro de Instituição aplicado com múltiplas seleções.

#BOTAO TODOS ESTA SENDO ENCOBERTO PRECISA TESTAR NA PROXIMA VERSAO
Select All And Apply Institution Filters
    [Documentation]    FILTER-INST-003 - Usa Selecionar Todos e aplica filtro.
    [Tags]    filter    instituicao    select_all
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Open Institution Filter Wrapper
    Select All Institution Items Wrapper
    Select Multiple Institution Items Wrapper    3    4
    Apply Institution Filters Wrapper
    Wait Institution Bottom Sheet Closed Wrapper
    Assert Institution Chip Visible Wrapper
    Log    Filtro de Instituição aplicado com Selecionar Todos.

Select All Then Clear Institution Filters
    [Documentation]    FILTER-INST-004 - Seleciona mais de um item e limpa lista pelo botao instituicao e limpar dentro do filtro.
    [Tags]    filter    instituicao    clear
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Open Institution Filter Wrapper
    Select Multiple Institution Items Wrapper    3    4
    Apply Institution Filters Wrapper
    Clear Institution Filter Selection Wrapper
    Open Institution Filter Wrapper
    Select Multiple Institution Items Wrapper    3    4
    Apply Institution Filters Wrapper
    Open Filter Two Item Selection Wrapper
    Clear Institution Filters Wrapper
    Open Institution Filter Wrapper
    Select Institution Item By Index Wrapper    1
    Apply Institution Filters Wrapper
    Wait Institution Bottom Sheet Closed Wrapper
    Assert Institution Chip Visible Wrapper
    Assert Institution One Selected Item Wrapper
    Log    Cenário de limpar e aplicar novamente concluído.


Validate Elementes In Class Detail Screen
    [Documentation]    WD-001 - Navega até a tela de detalhe de classe e valida a existência do botão de voltar no topo.
    ...                Fluxo: Login simples -> Ignorar permissões -> Pular perfil -> Ir para carteira -> Abrir filtro Classe -> Abrir detalhe (primeira classe) -> Validar botão voltar.
    [Tags]    back_button_detail_class    smoke
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Validate Class Detail Overview
    Validate Class Detail Products Counters Wrapper
    Validate Class Detail Products List Wrapper
    Validate Class Detail Evolution    
    Select Class Detail Period Wrapper
    Validate Class Detail Donut Allocation
