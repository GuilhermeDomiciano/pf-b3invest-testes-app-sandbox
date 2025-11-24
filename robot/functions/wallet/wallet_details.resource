*** Settings ***
Documentation    Wallet Details Functions

# Screen keywords (atenção: arquivo de screen possui nome 'wallet_details_screnn.resource')
Resource    ${EXECDIR}/robot/screens/wallet/wallet_details_screnn.resource
# Opcional: reutilizar navegação já existente
Resource    ${EXECDIR}/robot/screens/wallet/wallet_screen.resource

*** Keywords ***
Validate Class Detail Overview
    [Documentation]    Wrapper para validar cabeçalho/overview da classe.
    Validate Class Detail Overview Section
    Validate Ballance Filters Products Renda Fixa

Validate Class Detail Products Counters Wrapper
    [Documentation]    Wrapper para validar contadores de produtos/instituições.
    Validate Class Detail Products Counters

Validate Class Detail Evolution
    [Documentation]    Wrapper para validar seção de evolução e algumas barras.
    Validate Class Detail Evolution Section
    Validate Class Detail Evolution Bars

Validate Class Detail Donut Allocation
    [Documentation]    Wrapper para validar seção de alocação (gráfico donut).
    Validate Class Detail Donut Allocation Section

Validate Class Detail Products List Wrapper
    [Documentation]    Wrapper para validar itens principais da lista de produtos.
    Validate Class Detail Products List

Select Class Detail Period Wrapper
    [Documentation]    Seleciona período (7 d, 49 d, 6 m, 12 m) na seção de evolução.
    Select Class Detail Period    7 s   
    Select Class Detail Period    6 m 
    Select Class Detail Period    7 d
    

Open Class Detail Renda Fixa Wrapper
    [Documentation]    Abre a tela de detalhe da classe 'Renda Fixa'.
    Open Class Detail Products Screen    renda fixa

Open Class Detail Internacional Wrapper
    [Documentation]    Abre a tela de detalhe da classe 'Internacional'.
    Open Class Detail Products Screen    internacional

Open Class Detail Renda Variável Wrapper
    [Documentation]    Abre a tela de detalhe da classe 'Renda Variável'.
    Open Class Detail Products Screen    renda variável

Validate Complete Class Detail
    [Documentation]    Executa validação completa agrupada da tela de detalhe de classe.
    Validate Full Class Detail Screen

Validate Class Detail With Period
    [Documentation]    Executa validação completa e depois seleciona um período específico.
    [Arguments]    ${period}=7_d
    Validate Full Class Detail Screen
    Select Class Detail Period    ${period}

Back Navigation From Class Detail
    [Documentation]    Realiza navegação de volta (back) a partir da tela de detalhe da classe.
    Validate Class Detail Back Button Section
    

Open Institution Filter Wrapper
    [Documentation]    Wrapper para abrir bottom sheet de filtro Instituição (placeholders).
    Open Institution Filter Bottom Sheet

Open Product Filter Wrapper
    [Documentation]    Wrapper para abrir bottom sheet de filtro Produto (placeholders).
    Open Product Filter Bottom Sheet

Apply Institution Filters Wrapper
    [Documentation]    Wrapper para aplicar filtros de Instituição.
    Apply Institution Filters

Clear Institution Filters Wrapper
    [Documentation]    Wrapper para limpar filtros de Instituição.
    Clear Institution Filters

Select Institution Item By Index Wrapper
    [Documentation]    Wrapper para selecionar/toggle item único de Instituição.
    [Arguments]    ${index}
    Select Institution Filter Item By Index    ${index}

Select Multiple Institution Items Wrapper
    [Documentation]    Wrapper para selecionar múltiplos itens de Instituição.
    [Arguments]    @{indices}
    FOR    ${idx}    IN    @{indices}
        Select Institution Filter Item By Index    ${idx}
    END

Select All Institution Items Wrapper
    [Documentation]    Wrapper para acionar Selecionar Todos das Instituições.
    Select All Institution Filter Items

Assert Institution Apply Enabled Wrapper
    [Documentation]    Wrapper para validar botão Aplicar habilitado (heurístico).
    Assert Institution Apply Button Enabled

Assert Institution Apply Disabled Wrapper
    [Documentation]    Wrapper para validar botão Aplicar desabilitado (placeholder).
    Assert Institution Apply Button Disabled

Wait Institution Bottom Sheet Closed Wrapper
    [Documentation]    Wrapper para aguardar fechamento do bottom sheet Instituição.
    Wait Institution Filter Bottom Sheet Closed

Assert Institution Chip Visible Wrapper
    [Documentation]    Wrapper para validar chip de Instituição visível após aplicar filtros.
    Assert Institution Filter Chip Visible

Reopen Institution Filter Wrapper
    [Documentation]    Wrapper para reabrir bottom sheet de Instituição se necessário.
    Reopen Institution Filter (If Closed)

Assert Institution One Selected Item Wrapper
    [Documentation]    Wrapper para validar chip de Instituição com 1 item selecionado.
    Assert Institution One Selected Item

Assert Institution Two Selected Items Wrapper
    [Documentation]    Wrapper para validar chip de Instituição com 2 itens selecionados.
    Assert Institution Two Selected Items

Clear Institution Filter Selection Wrapper
    [Documentation]    Wrapper para limpar todas seleções no bottom sheet de Instituição.
    Clear Institution Filter Selection

Open Filter Two Item Selection Wrapper
    [Documentation]    Abre bottom sheet de filtro de Instituição e seleciona dois itens.
    Open Filter Two Item Selection

Validate Class Detail Card Ativos Components
    [Documentation]    Wrapper para validar componentes do card de ativos na tela de detalhe da classe.
    Validate Class Detail Card Ativos Components Screen

Validate Class Detail Pagination Components
    [Documentation]    Wrapper para validar componentes de paginação na tela de detalhe da classe.
    [Arguments]    ${screen}
    Validate Class Detail Pagination Components Screen    screen=${screen}

Validate Card Products, Evolution And Donut Components
    [Documentation]    Wrapper para validar cards de produtos, evolução, overview e paginação na tela de detalhe da classe.
    Validate Card Products
    Validate Class Detail Evolution Section
    Validate Class Detail Donut Allocation Section