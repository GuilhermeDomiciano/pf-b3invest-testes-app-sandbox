*** Settings ***
Documentation    Wallet Details - Navegação e validação do botão Voltar na tela de detalhe da classe

Resource    ${EXECDIR}/robot/base.resource
Resource    ../../functions/wallet/institution_functions.resource
Resource    ../../functions/login/login_functions.resource
Resource    ../../functions/wallet/class_functions.resource
Resource    ../../functions/wallet/wallet_details.resource
Resource    ../../functions/wallet/wallet_functions.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    wallet_details
# 15 cenarios de teste relacionados a tela de detalhes da carteira
*** Test Cases ***
Validate Back Button In Class Detail Screen, Check Elements header And Title Start List And Name Filter Renda Variável
    [Documentation]    PFSAPP-253-CA01, PFSAPP-253-CA02, PFSAPP-253-CA03, PFSAPP-253-CA04.1
    [Tags]    back button, header page, title start list and name filter
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Variável Wrapper
    Validate Class Detail Overview Renda Variável
    Validate Class Detail Products Counters Wrapper   screen=renda variável
    Wait Until Element Is Visible    ${CLASS_DETAIL_BTN_VOLTAR}    timeout=10s
    Back Navigation From Class Detail Renda Variável
    Log    Validação do botão voltar na tela de detalhe concluída

Validate List Components In Class Detail Screen Renda Variável
    [Documentation]    PFSAPP-253-CA05
    [Tags]    back button, header page and title start list
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Variável Wrapper
    Validate Class Detail Card Ativos Components Renda Variavel


#8, 9, 10 e caso de erro

Validate Elementes Orders And Pagination In Class Detail Screen Renda Variável
    [Documentation]    PFSAPP-253-CA06, PFSAPP-253-CA07
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

Validate Card Products, Evolution And Donut Renda Variável
    [Documentation]    PFSAPP-253-CA08, 09, 10
    [Tags]    Chart Evolution, chart Donut and Products cards
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Variável Wrapper
    Validate Card Products, Evolution And Donut Components Renda Variavel
    Log    Validação completa da tela de detalhe da classe concluída

#! Filtros teste
Open Institution Filter Bottom Sheet One Institution Select And Clear Renda Variável
    [Documentation]    PFSAPP-386-CA01, CA04, CA05
    [Tags]    back button, header page and title start list
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Variável Wrapper
    Open Institution Filter Wrapper
    Apply Institution Filters Wrapper
    Clear Institution Filters Wrapper
    Open Institution Filter Wrapper
    Apply Institution Filters Wrapper
    Clear Institution Filters Inside Bottom Sheet Wrapper 
    Log    Bottom sheet Instituição aberto (placeholder)

# #TODO: Ajustar numero da tarefa e codigo flutter nao esta visivel para click o filtro
Open Institution Filter Bottom Sheet Two Institution Select And Clear Renda Variável
    [Documentation]    PFSAPP-386-CA02, CA06
    [Tags]    botao_voltar
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Variável Wrapper
    Open Institution Filter Wrapper
    Select Other Institution Filters Wrapper
    Apply Institution Filters Wrapper
    Clear Two Institution Filters Wrapper
    Log    Bottom sheet Produto aberto (placeholder)

Open Product Filter Bottom Sheet One Product Select And Clear Renda Variável
    [Documentation]    PFSAPP-386-CA07, 08, 12
    [Tags]    back button, header page and title start list
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Variável Wrapper
    Open Product Filter Wrapper
    Apply Product Filters Wrapper
    Clear Product Filters Wrapper
    Open Product Filter Wrapper
    Apply Product Filters Wrapper
    Clear Product Filters Inside Bottom Sheet Wrapper 
    Log    Bottom sheet Produto aberto (placeholder)

# #TODO: Ajustar numero da tarefa e codigo flutter nao esta visivel para click o filtro
Open Product Filter Bottom Sheet Two Product Select And Clear Renda Variável
    [Documentation]    PFSAPP-386-CA09, 10, 11
    [Tags]    botao_voltar
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Classes Button Screen Wallet
    Open Class Detail Renda Variável Wrapper
    Open Product Filter Wrapper
    Select Other Product Filters Wrapper
    Apply Product Filters Wrapper
    Clear Product Filters Wrapper
    Log    Bottom sheet Produto aberto (placeholder)