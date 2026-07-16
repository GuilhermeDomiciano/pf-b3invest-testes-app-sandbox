*** Settings ***
Documentation    Stock Market Functions

Resource    ../../screens/stock/stock_market_screen.resource

*** Keywords ***
Navigate To Stock Market
    [Documentation]    Navega para a tela de mercado de ações.
    [Tags]    navigation
    Navigate To Stock Market Screen
    
Validate Stock Market Title
    [Documentation]    Valida o título do card do Ibovespa (Ibovespa B3).

    Validate Stock Market Title Screen

Validate Stock Market Status
    [Documentation]    Valida se o status do mercado (aberto ou fechado) é exibido.

    Validate Stock Market Status Screen

Validate Stock Market Update Subtitle
    [Documentation]    Valida o subtítulo com a data/hora da última atualização.

    Validate Stock Market Update Subtitle Screen

Validate Stock Market Index Points
    [Documentation]    Valida a pontuação do índice Ibovespa.

    Validate Stock Market Index Points Screen

Validate Stock Market Minimum Points
    [Documentation]    Valida a pontuação mínima do dia.

    Validate Stock Market Minimum Points Screen

Validate Stock Market Maximum Points
    [Documentation]    Valida a pontuação máxima do dia.

    Validate Stock Market Maximum Points Screen

Click Stock Market More Info Button
    [Documentation]    Clica no botão de informações complementares do card do Ibovespa.

    Click Stock Market More Info Button Screen

Validate Stock Market Card
    [Documentation]    Valida todos os campos do card do Ibovespa na home.

    Validate Stock Market Title
    Validate Stock Market Status
    Validate Stock Market Update Subtitle
    Validate Stock Market Index Points
    Validate Stock Market Minimum Points
    Validate Stock Market Maximum Points

Validate Stock Market Overview Title
    [Documentation]    Valida o título da tela de informações complementares do Ibovespa (Visão Geral).

    Validate Stock Market Overview Title Screen
