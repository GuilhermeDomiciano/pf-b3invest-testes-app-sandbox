*** Settings ***
Documentation    Wallet Details - Navegação e validação do botão Voltar na tela de detalhe da classe

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    wallet_details

*** Test Cases ***
Validate Back Button In Class Detail Screen, Check Elements header And Title Start List And Name Filter
    [Documentation]    PFSAPP-254-CA01, PFSAPP-254-CA02, PFSAPP-254-CA03, PFSAPP-254-CA04.1
    [Tags]    back button, header page, title start list and name filter
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Validate Class Detail Overview
    Validate Class Detail Products Counters Wrapper
    Wait Until Element Is Visible    ${CLASS_DETAIL_BTN_VOLTAR}    timeout=10s
    Back Navigation From Class Detail
    Log    Validação do botão voltar na tela de detalhe concluída

Validate List Components In Class Detail Screen
    [Documentation]    PFSAPP-254-CA05
    [Tags]    back button, header page and title start list
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Validate Class Detail Card Ativos Components

Validate Elementes Orders And Pagination In Class Detail Screen Renda Fixa
    [Documentation]    PFSAPP-254-CA06, PFSAPP-254-CA07
    [Tags]    back button, header page and title start list
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Validate Class Detail Pagination Components    screen=renda fixa
    Log    Validação dos componentes da lista de produtos na tela de detalhe concluída

#8, 9, 10 e caso de erro

Validate Elementes Orders And Pagination In Class Detail Screen Internacional
    [Documentation]    PFSAPP-254-CA06, PFSAPP-254-CA07
    [Tags]    back button, header page and title start list
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Internacional Wrapper
    Validate Class Detail Pagination Components    screen=internacional
    Log    Validação dos componentes da lista de produtos na tela de detalhe concluída

Validate Elementes Orders And Pagination In Class Detail Screen Renda Variável
    [Documentation]    PFSAPP-254-CA06, PFSAPP-254-CA07
    [Tags]    back button, header page and title start list
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Variável Wrapper
    Validate Class Detail Pagination Components    screen=renda variável
    Log    Validação dos componentes da lista de produtos na tela de detalhe concluída

Validate Card Products, Evolution And Donut
    [Documentation]    PFSAPP-254-CA08, 09, 10
    [Tags]    Chart Evolution, chart Donut and Products cards
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Validate Card Products, Evolution And Donut Components
    Log    Validação completa da tela de detalhe da classe concluída

Open Institution Filter Bottom Sheet (Draft)
    [Documentation]    PFSAPP-254-CA05
    [Tags]    back button, header page and title start list
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
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
    [Documentation]    PFSAPP-254-CA01 - Validate the back button functionality inside the all products screen
    [Tags]    botao_voltar
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Fixa Wrapper
    Open Product Filter Wrapper
    Log    Bottom sheet Produto aberto (placeholder)

# Apply Single Institution Filter
#     [Documentation]    PFSAPP-254-CA01 - Validate the back button functionality inside the all products screen
#     [Tags]    botao_voltar
#     Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#     ...             PASSWORD=${users['user_cc_cpf']['password']}
#     No Accept Permissions
#     Skip Profile
#     Navigation To My Wallet
#     Validate All Classes Button Screen Wallet
#     Open Class Detail Renda Fixa Wrapper
#     Open Institution Filter Wrapper
#     Select Institution Item By Index Wrapper    1
#     Assert Institution Apply Enabled Wrapper
#     Apply Institution Filters Wrapper
#     Wait Institution Bottom Sheet Closed Wrapper
#     Assert Institution Chip Visible Wrapper
#     Assert Institution One Selected Item Wrapper
#     Log    Filtro de Instituição aplicado com uma seleção.

# Apply Multiple Institution Filters
#     [Documentation]    PFSAPP-254-CA01 - Validate the back button functionality inside the all products screen
#     [Tags]    filter    instituicao    multi
#     Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#     ...             PASSWORD=${users['user_cc_cpf']['password']}
#     No Accept Permissions
#     Skip Profile
#     Navigation To My Wallet
#     Validate All Classes Button Screen Wallet
#     Open Class Detail Renda Fixa Wrapper
#     Open Institution Filter Wrapper
#     Select Multiple Institution Items Wrapper     1    2
#     Assert Institution Apply Enabled Wrapper
#     Apply Institution Filters Wrapper
#     Wait Institution Bottom Sheet Closed Wrapper
#     Assert Institution Chip Visible Wrapper
#     Assert Institution Two Selected Items Wrapper
#     Log    Filtro de Instituição aplicado com múltiplas seleções.

# #BOTAO TODOS ESTA SENDO ENCOBERTO PRECISA TESTAR NA PROXIMA VERSAO
# Select All And Apply Institution Filters
#     [Documentation]    PFSAPP-254-CA01 - Validate the back button functionality inside the all products screen
#     [Tags]    filter    instituicao    select_all
#     Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
#     ...             PASSWORD=${users['user_cc_cpf']['password']}
#     No Accept Permissions
#     Skip Profile
#     Navigation To My Wallet
#     Validate All Classes Button Screen Wallet
#     Open Class Detail Renda Fixa Wrapper
#     Open Institution Filter Wrapper
#     Select All Institution Items Wrapper
#     Select Multiple Institution Items Wrapper    1    2
#     Apply Institution Filters Wrapper
#     Wait Institution Bottom Sheet Closed Wrapper
#     Assert Institution Chip Visible Wrapper
#     Log    Filtro de Instituição aplicado com Selecionar Todos.

# Select All Then Clear Institution Filters
#     [Documentation]    PFSAPP-254-CA01 - Validate the back button functionality inside the all products screen
#     [Tags]    filter    instituicao    clear
#     Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
#     ...             PASSWORD=${users['user_cc_cpf']['password']}
#     No Accept Permissions
#     Skip Profile
#     Navigation To My Wallet
#     Validate All Classes Button Screen Wallet
#     Open Class Detail Renda Fixa Wrapper
#     Open Institution Filter Wrapper
#     Select Multiple Institution Items Wrapper    1    2
#     Apply Institution Filters Wrapper
#     Clear Institution Filter Selection Wrapper
#     Open Institution Filter Wrapper
#     Select Multiple Institution Items Wrapper    1    2
#     Apply Institution Filters Wrapper
#     Open Filter Two Item Selection Wrapper
#     Clear Institution Filters Wrapper
#     Open Institution Filter Wrapper
#     Select Institution Item By Index Wrapper    1
#     Apply Institution Filters Wrapper
#     Wait Institution Bottom Sheet Closed Wrapper
#     Assert Institution Chip Visible Wrapper
#     Assert Institution One Selected Item Wrapper
#     Log    Cenário de limpar e aplicar novamente concluído.


# Validate Elementes In Class Detail Screen
#     [Documentation]    PFSAPP-254-CA01 - Validate the back button functionality inside the all products screen
#     [Tags]    back_button_detail_class    smoke
#     Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
#     ...             PASSWORD=${users['user_cc_cpf']['password']}
#     No Accept Permissions
#     Skip Profile
#     Navigation To My Wallet
#     Validate All Classes Button Screen Wallet
#     Open Class Detail Renda Fixa Wrapper
#     Validate Class Detail Overview
#     # Validate Class Detail Products Counters Wrapper desnecessário aqui
#     Validate Class Detail Products List Wrapper
#     Validate Class Detail Evolution    
#     Select Class Detail Period Wrapper
#     Validate Class Detail Donut Allocation
