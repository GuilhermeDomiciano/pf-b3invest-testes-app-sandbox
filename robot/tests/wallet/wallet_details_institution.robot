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

Validate Institutions Screen Information TopBar
    [Documentation]   PFSAPP-259-CA01, PFSAPP-259-CA02, PFSAPP-259-CA03 and PFSAPP-259-CA04 - Validate the title 'All Institutions', the quantity of products in the wallet, the display of profitability over the last 30 days, and the display of the number of assets and institutions
    [Tags]    todos_produtos_informacoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Navigation To Wallet Details Institutions
    Validate Class Detail Overview Institutions
    Validate Class Detail Products Counters Wrapper   screen=Institutions
    Wait Until Element Is Visible    ${CLASS_DETAIL_BTN_VOLTAR}    timeout=10s
    Back Navigation From Class Detail Institutions
    Navigation To Wallet Details Institutions
    Log    Validação do botão voltar na tela de detalhe concluída

Validate List Components In Class Detail Screen Institutions
    [Documentation]    PFSAPP-259-CA05
    [Tags]    back button, header page and title start list
     Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Navigation To Wallet Details Institutions
    Validate Class Detail Card Ativos Components Institutions


#8, 9, 10 e caso de erro

Validate Elementes Orders And Pagination In Class Detail Screen Institutions
    [Documentation]    PFSAPP-259-CA06, PFSAPP-259-CA07
    [Tags]    back button, header page and title start list
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Navigation To Wallet Details Institutions
    Validate Class Detail Pagination Components    screen=institutions
    Log    Validação dos componentes da lista de produtos na tela de detalhe concluída

Validate Card Products, Evolution And Donut Institutions
    [Documentation]    PFSAPP-259-CA08, 09, 10
    [Tags]    Chart Evolution, chart Donut and Products cards
     Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Navigation To Wallet Details Institutions
    Validate Card Products, Evolution And Donut Components Institutions
    Log    Validação completa da tela de detalhe da classe concluída


#!filtros
Open Institution Filter Bottom Sheet Two Institution Select And Clear Institutions
    [Documentation]    PFSAPP-259-CA02, CA06
    [Tags]    botao_voltar
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Navigation To Wallet Details Institutions
    Open Classe Filter Bottom Sheet Institution
    Log    Bottom sheet Produto aberto (placeholder)

Open Product Filter Bottom Sheet One Product Select And Clear Institutions
    [Documentation]    PFSAPP-259-CA07, 08, 12
    [Tags]    back button, header page and title start list
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Navigation To Wallet Details Institutions
    Open Product Filter Wrapper
    Filter Institution Screen Products
    Apply Product Filters Wrapper
    Clear Product Filters Institution Wrapper
    Open Product Filter Wrapper
    Filter Institution Screen Products
    Apply Product Filters Wrapper
    Clear Institution Product Filters Inside Bottom Sheet Wrapper 
    Log    Bottom sheet Produto aberto (placeholder)

# #TODO: Ajustar numero da tarefa e codigo flutter nao esta visivel para click o filtro
Open Product Filter Bottom Sheet Two Product Select And Clear Institutions
    [Documentation]    PFSAPP-259-CA09, 10, 11
    [Tags]    botao_voltar
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Navigation To Wallet Details Institutions
    Open Product Filter Wrapper
    Filter Institution Screen Products
    Select Other Product Filters Wrapper
    Apply Product Filters Wrapper
    Clear Product Filters Institution Wrapper
    Log    Bottom sheet Produto aberto (placeholder)