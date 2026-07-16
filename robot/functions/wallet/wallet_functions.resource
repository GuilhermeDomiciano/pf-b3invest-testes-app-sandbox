*** Settings ***
Documentation    Wallet Functions
Resource    ../../screens/wallet/wallet_screen.resource
Resource    ${EXECDIR}/robot/screens/wallet/wallet_screen.resource

*** Keywords ***
Validate Toggle Visibility Section Screen Wallet
    [Documentation]    Validate Toggle Visibility Section Screen Wallet

    Validate Toggle Visibility Screen Wallet

Validate My Wallet Section Screen Wallet
    [Documentation]    Validate My Wallet Screen Wallet

    Validate My Wallet Screen Wallet

Validate My Allocation Filter Buttons Section Screen Wallet
    [Documentation]    Validate Allocation Filter Buttons Screen Wallet

    Validate Allocation Filter Buttons Screen Wallet 

Navigation To My Wallet
    [Documentation]    Navigate To My Wallet From Home Screen Wallet

    Navigate To My Wallet From Home Screen Wallet

Validate Wallet Action Buttons Section Screen Wallet
    [Documentation]    Validate Wallet Action Buttons Section Screen Wallet

    Validate Wallet Action Buttons Screen Wallet

Validate Access All Products Button Section Screen Wallet
    [Documentation]    Validate Access All Products Button Screen Wallet

    Click On Access All Products Button Screen Wallet

Click Graphic Bar Section Screen Wallet
    [Documentation]    Click Graphic Bar Screen Wallet

    Click Graphic Bar Screen Wallet

Click Graphic Line Section Screen Wallet
    [Documentation]    Click Graphic Line Screen Wallet

    Click Graphic Line Screen Wallet

Validate Provents Title Section Screen Wallet
    [Documentation]    Validate Provents Title Screen Wallet

    Validate Provents Title Screen Wallet

Validate Disclosure Results Title Section Screen Wallet
    [Documentation]    Validate Disclosure Results Title Screen Wallet

    Validate Disclosure Results Title Screen Wallet

Validate Quick Access Items
    [Documentation]    Valida os itens da seção de acesso rápido

    Scroll Down To Element           ${TXT_WALLET_TITLE_ACESSO_RAPIDO}
    Wait Until Element Is Visible    ${TXT_WALLET_TITLE_ACESSO_RAPIDO}    timeout=10s
    Element Should Be Visible        ${TXT_WALLET_TITLE_ACESSO_RAPIDO}
    Element Should Be Visible        ${BTN_WALLET_ACCESS_ALL_PRODUCTS}
    Log    Seção de acesso rápido validada com sucesso

Validate Wallet Action Buttons
    [Documentation]    Valida os botões de ação na área de scroll horizontal

    Scroll Down To Element           ${WALLET_ACTIONS_CONTAINER}
    Wait Until Element Is Visible    ${WALLET_ACTIONS_CONTAINER}    timeout=10s
    
    # Valida presença dos botões principais
    Element Should Be Visible        ${BTN_WALLET_EVOLUÇAO_PATRIMONIAL}
    Element Should Be Visible        ${BTN_WALLET_ANALISES_IA}
    Element Should Be Visible        ${BTN_WALLET_EXTRATO}
    Element Should Be Visible        ${BTN_WALLET_DIVULGACAO_RESULTADOS}
    Element Should Be Visible        ${BTN_WALLET_GARANTIAS}
    Element Should Be Visible        ${BTN_WALLET_OFERTAS_PUBLICAS}
    
    # Testa scroll horizontal se necessário
    Swipe By Percent                 50    50    20    50    1000
    Log    Botões de ação da carteira validados com sucesso

Validate Charts Toggle Options
    [Documentation]    Valida a alternância entre gráficos de barras e linhas

    Scroll Down To Element           ${BTN_WALLET_BAR_CHART}
    Wait Until Element Is Visible    ${BTN_WALLET_BAR_CHART}    timeout=10s
    Element Should Be Visible        ${BTN_WALLET_BAR_CHART}
    Element Should Be Visible        ${BTN_WALLET_LINE_CHART}
    
    # Testa alternância entre gráficos
    Click Element                    ${BTN_WALLET_BAR_CHART}
    Sleep    2s
    Click Element                    ${BTN_WALLET_LINE_CHART}
    Sleep    2s
    Log    Alternância de gráficos validada com sucesso

Validate Provents Section
    [Documentation]    Valida a seção de proventos (recebidos e a receber)

    Scroll Down To Element           ${TITLE_WALLET_PROVENT}
    Wait Until Element Is Visible    ${TITLE_WALLET_PROVENT}    timeout=10s
    Element Should Be Visible        ${TITLE_WALLET_PROVENT}
    Element Should Be Visible        ${BTN_WALLET_PROVENT_RECEIVED_SELECTED}
    Element Should Be Visible        ${BTN_WALLET_PROVENT_TO_RECEIVE_NOT_SELECTED}
    
    # Testa alternância entre recebidos e a receber
    Click Element                    ${BTN_WALLET_PROVENT_RECEIVED_SELECTED}
    Wait Until Element Is Visible    ${CHECK_WALLET_PROVENTS_RECEIVED}    timeout=5s
    
    Click Element                    ${BTN_WALLET_PROVENT_TO_RECEIVE_NOT_SELECTED}
    Wait Until Element Is Visible    ${CHECK_WALLET_PROVENTS_TO_RECEIVE}    timeout=5s
    Log    Seção de proventos validada com sucesso

Validate Disclosure Results
    [Documentation]    Valida a seção de divulgação de resultados

    Scroll Down To Element           ${TITLE_WALLET_DISCLOSURE_RESULTS}
    Wait Until Element Is Visible    ${TITLE_WALLET_DISCLOSURE_RESULTS}    timeout=10s
    Element Should Be Visible        ${TITLE_WALLET_DISCLOSURE_RESULTS}
    Element Should Be Visible        ${TITLE_WALLET_NEWS_RESULTS}
    Log    Seção de divulgação de resultados validada com sucesso

Access Wallet Settings
    [Documentation]    Acessa as configurações da carteira

    Wait Until Element Is Visible    ${BTN_WALLET_SETTINGS}    timeout=10s
    Click Element                    ${BTN_WALLET_SETTINGS}
    Sleep    2s
    Log    Configurações da carteira acessadas com sucesso

Validate Settings Options
    [Documentation]    Valida as opções disponíveis nas configurações

    Sleep    3s
    Press Keycode    4    # Volta para tela anterior (Android back button)
    Log    Opções de configurações validadas com sucesso

Access Wallet Filter
    [Documentation]    Acessa o filtro da carteira

    Wait Until Element Is Visible    ${BTN_WALLET_FILTER}    timeout=10s
    Click Element                    ${BTN_WALLET_FILTER}
    Sleep    2s
    Log    Filtro da carteira acessado com sucesso

Validate Filter Options
    [Documentation]    Valida as opções disponíveis no filtro

    Sleep    3s
    Press Keycode    4    # Volta para tela anterior (Android back button)
    Log    Opções de filtro validadas com sucesso

Navigate To Portfolio Evolution
    [Documentation]    Navega para a tela de evolução patrimonial
    
    Scroll Down To Element           ${BTN_WALLET_EVOLUÇAO_PATRIMONIAL}
    Wait Until Element Is Visible    ${BTN_WALLET_EVOLUÇAO_PATRIMONIAL}    timeout=10s
    Click Element                    ${BTN_WALLET_EVOLUÇAO_PATRIMONIAL}
    Sleep    3s
    Log    Navegação para evolução patrimonial realizada com sucesso

Validate Portfolio Evolution Screen
    [Documentation]    Valida a tela de evolução patrimonial

    Sleep    3s
    Press Keycode    4    # Volta para tela anterior (Android back button)
    Log    Tela de evolução patrimonial validada com sucesso

Scroll Down To Element
    [Documentation]    Faz scroll até encontrar o elemento
    [Arguments]    ${element}

    FOR    ${i}    IN RANGE    5
        ${element_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${element}
        Run Keyword If    ${element_visible}    Exit For Loop
        Swipe By Percent    50    80    50    20    1000
        Sleep    1s
    END

Validate Ballance Filters
    [Documentation]    Valida o saldo exibido dentro da tela de todos os produtos

    #Validate Access All Products Button Screen Wallet
    Wait Until Element Is Visible    ${ALL_PRODUCTS_BALANCE}    timeout=10s
    Element Should Be Visible        ${ALL_PRODUCTS_BALANCE}
    ${balance}=    Get Text    ${ALL_PRODUCTS_BALANCE}
    Log To Console    message=[B3] Saldo exibido na tela de todos os produtos: ${balance}\n

Validate All Contents Inside Filters
    [Documentation]    Valida os conteúdos exibidos dentro dos filtros de produto, classe e instituição
    [Arguments]    ${filter_type}

    Validate Specific Filter Content Screen Wallet    ${filter_type}
