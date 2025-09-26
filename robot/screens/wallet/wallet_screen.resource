*** Settings ***
Documentation    Home Screen

Library          AppiumLibrary

Resource    ../../../resource/utils/element_utils.resource

Variables    ../../elements/wallet.yaml
Variables    ../../elements/class.yaml
Variables    ../../elements/institute.yaml
Variables    ../../elements/product.yaml

*** Keywords ***
Navigate To My Wallet From Home Screen Wallet
    [Documentation]    Navigate from home screen to My Wallet screen using wallet button
    
    Wait Until Element Is Visible    locator=${NAV_MY_WALLET}    timeout=10
    Click Element    locator=${NAV_MY_WALLET}
    Sleep    2s    # Wait for navigation to complete
    Wait Until Page Contains Element    locator=${TITLE_WALLET_ALLOCATION}    timeout=15
    Log To Console    message=[B3] Navigated to My Wallet screen from Home\n

Click Access All Products Button Screen Wallet
    [Documentation]    Click on 'Acessar todos os produtos' button in wallet screen
    
    Scroll Element Into View In Page    locator=${TXT_WALLET_TITLE_ACESSO_RAPIDO}
    Wait Until Page Contains Element    locator=${BTN_WALLET_ACCESS_ALL_PRODUCTS}    timeout=10
    
    Log To Console    message=[B3] Clicked 'Acessar todos os produtos' button\n

Validate Toggle Visibility Screen Wallet
    [Documentation]    Validate Toggle Visibility

    Wait Until Page Contains Element    locator=${BTN_WALLET_TOGGLE_VISIBILITY}    timeout=10
    Log To Console    message=[B3] Validate Session Toggle Visibility\n

Validate My Wallet Screen Wallet
    [Documentation]    Validate My Wallet

    Scroll Element Into View In Page    locator=${TXT_WALLET_TITLE_MY_WALLET}
    Wait Until Element Is Visible    locator=${TXT_WALLET_TITLE_MY_WALLET}    timeout=10
    Log To Console    message=[B3] Validate Session My Wallet\n

Validate Allocation Title Screen Wallet
    [Documentation]    Validate the presence of Allocation title in wallet screen
    
    Scroll Element Into View In Page    locator=${TITLE_WALLET_ALLOCATION}
    Wait Until Element Is Visible    locator=${TITLE_WALLET_ALLOCATION}    timeout=10
    Element Should Be Visible    locator=${TITLE_WALLET_ALLOCATION}
    Log To Console    message=[B3] Validate Allocation Title is present\n

Validate Provents Title Screen Wallet
    [Documentation]    Validate the presence of Provent title in wallet screen

    # Scroll to Provents Received section
    Scroll Element Into View In Page    locator=${BTN_WALLET_PROVENT_RECEIVED}
    Wait Until Element Is Visible    locator=${BTN_WALLET_PROVENT_RECEIVED}    timeout=10
    Element Should Be Visible    locator=${BTN_WALLET_PROVENT_RECEIVED}
    Click Element    locator=${BTN_WALLET_PROVENT_RECEIVED}
    Wait Until Element Is Visible    locator=${CHECK_WALLET_PROVENTS_RECEIVED}    timeout=10
    Element Should Be Visible    locator=${CHECK_WALLET_PROVENTS_RECEIVED}
    Log To Console    message=[B3] Validate Provent Received Button is present\n

    # Scroll to Provents To Receive section
    Scroll Element Into View In Page    locator=${BTN_WALLET_PROVENT_TO_RECEIVE}
    Wait Until Element Is Visible    locator=${BTN_WALLET_PROVENT_TO_RECEIVE}    timeout=10
    Element Should Be Visible    locator=${BTN_WALLET_PROVENT_TO_RECEIVE}
    Click Element    locator=${BTN_WALLET_PROVENT_TO_RECEIVE}
    Wait Until Element Is Visible    locator=${CHECK_WALLET_PROVENTS_TO_RECEIVE}    timeout=10
    Element Should Be Visible    locator=${CHECK_WALLET_PROVENTS_TO_RECEIVE}
    Log To Console    message=[B3] Validate Provent To Receive Button is present\n

Validate Disclosure Results Title Screen Wallet
    [Documentation]    Validate the presence of Disclosure Results title in wallet screen

    # Scroll to Disclosure section
    Scroll Element Into View In Page    locator=${TITLE_WALLET_DISCLOSURE_RESULTS}
    Wait Until Element Is Visible    locator=${TITLE_WALLET_DISCLOSURE_RESULTS}    timeout=10
    Element Should Be Visible    locator=${TITLE_WALLET_DISCLOSURE_RESULTS}
    Log To Console    message=[B3] Validate Disclosure Results Title is present\n

Validate Allocation Filter Buttons Screen Wallet
    [Documentation]    Validate the presence of Produto, Classe and Instituição filter buttons
    
    # Scroll to allocation section
    Scroll Element Into View In Page    locator=${TITLE_WALLET_ALLOCATION}

    # Validate Produto button
    Wait Until Element Is Visible    locator=${BTN_WALLET_FILTER_PRODUTO}    timeout=10
    Element Should Be Visible    locator=${BTN_WALLET_FILTER_PRODUTO}
    Click Element    locator=${BTN_WALLET_FILTER_PRODUTO}

    # Validate Classe button
    Wait Until Element Is Visible    locator=${BTN_WALLET_FILTER_CLASSE}    timeout=10
    Element Should Be Visible    locator=${BTN_WALLET_FILTER_CLASSE}
    Click Element    locator=${BTN_WALLET_FILTER_CLASSE}

    # Validate Instituição button
    Wait Until Element Is Visible    locator=${BTN_WALLET_FILTER_INSTITUICAO}    timeout=10
    Element Should Be Visible    locator=${BTN_WALLET_FILTER_INSTITUICAO}
    Click Element    locator=${BTN_WALLET_FILTER_INSTITUICAO}

    Log To Console    message=[B3] Allocation filter buttons are present\n

Validate Specific Filter Content Screen Wallet
    [Documentation]    Validate specific content for each filter type
    [Arguments]    ${filter_type}
    
    IF    '${filter_type}' == 'produto'
        Wait Until Page Contains    text=Todos os produtos    timeout=10s
        Element Should Be Visible    ${ALL_PRODUCTS_QUANTITY}
        Wait Until Page Contains    text=em 30 dias    timeout=10s
        Element Should Be Visible    ${ALL_PRODUCTS_ASSETS_COUNT}
        Element Should Be Visible    ${ALL_PRODUCTS_INSTITUTIONS_COUNT}

        Log To Console    message=[B3] Produto allocation content is displayed\n
        
    ELSE IF    '${filter_type}' == 'classe'
        Wait Until Page Contains    text=Produtos por classe    timeout=10s
        Element Should Be Visible    ${ALL_CLASSES_QUANTITY}
        Wait Until Page Contains    text=em 30 dias    timeout=10s
        Element Should Be Visible    ${ALL_CLASSES_ASSETS_COUNT}
        Element Should Be Visible    ${ALL_CLASSES_INSTITUTIONS_COUNT}

        Log To Console    message=[B3] Classe allocation content is displayed\n
        
    ELSE IF    '${filter_type}' == 'instituicao'
        Wait Until Page Contains    text=Produtos por instituição    timeout=10s
        Element Should Be Visible    ${ALL_INSTITUTIONS_QUANTITY}
        Wait Until Page Contains    text=em 30 dias    timeout=10s
        Element Should Be Visible    ${ALL_INSTITUTIONS_ASSETS_COUNT}
        Element Should Be Visible    ${ALL_INSTITUTIONS_INSTITUTIONS_COUNT}

        Log To Console    message=[B3] Instituição allocation content is displayed\n
    END

Click Graphic Bar Screen Wallet
    [Documentation]    Click Graphic Bar

    Scroll Element Into View In Page    locator=${BTN_WALLET_BAR_CHART}
    Scroll Screen
    Wait Until Element Is Visible    locator=${BTN_WALLET_BAR_CHART}    timeout=10
    Log To Console    message=[B3] Validate Session Graphic Bar\n

Click Graphic Line Screen Wallet
    [Documentation]    Click Graphic Line

    Scroll Element Into View In Page    locator=${BTN_LINE_CHART}
    Wait Until Element Is Visible    locator=${BTN_LINE_CHART}    timeout=10
    Click Element    locator=${BTN_LINE_CHART}
    Log To Console    message=[B3] Validate Session Graphic Line\n

Validate Wallet Action Buttons Screen Wallet
    [Documentation]    Validate the presence of all wallet action buttons
    
    # First scroll to the buttons section
    Scroll Element Into View In Page    locator=${BTN_WALLET_EVOLUÇAO_PATRIMONIAL}
    
    # Validate Análises com IA button
    Scroll Horizontally Until Element Found    ${BTN_WALLET_ANALISES_IA}
    Wait Until Element Is Visible    locator=${BTN_WALLET_ANALISES_IA}    timeout=10
    Element Should Be Visible    locator=${BTN_WALLET_ANALISES_IA}
    Log To Console    message=[B3] 'Análises com IA' button is present\n
    
    # Validate Extrato button
    Scroll Horizontally Until Element Found    ${BTN_WALLET_EXTRATO}
    Wait Until Element Is Visible    locator=${BTN_WALLET_EXTRATO}    timeout=10
    Element Should Be Visible    locator=${BTN_WALLET_EXTRATO}
    Log To Console    message=[B3] 'Extrato' button is present\n
    
    # Validate Divulgação de resultados button
    Scroll Horizontally Until Element Found    ${BTN_WALLET_DIVULGACAO_RESULTADOS}
    Wait Until Element Is Visible    locator=${BTN_WALLET_DIVULGACAO_RESULTADOS}    timeout=10
    Element Should Be Visible    locator=${BTN_WALLET_DIVULGACAO_RESULTADOS}
    Log To Console    message=[B3] 'Divulgação de resultados' button is present\n
    
    # Validate Garantias button
    Scroll Horizontally Until Element Found    ${BTN_WALLET_GARANTIAS}
    Wait Until Element Is Visible    locator=${BTN_WALLET_GARANTIAS}    timeout=10
    Element Should Be Visible    locator=${BTN_WALLET_GARANTIAS}
    Log To Console    message=[B3] 'Garantias' button is present\n
    
    # Validate Ofertas públicas button
    Scroll Horizontally Until Element Found    ${BTN_WALLET_OFERTAS_PUBLICAS}
    Wait Until Element Is Visible    locator=${BTN_WALLET_OFERTAS_PUBLICAS}    timeout=10
    Element Should Be Visible    locator=${BTN_WALLET_OFERTAS_PUBLICAS}
    Log To Console    message=[B3] 'Ofertas públicas' button is present\n

Validate Individual Wallet Button Screen Wallet
    [Documentation]    Validate a specific wallet action button
    [Arguments]    ${button_locator}    ${button_name}
    
    Scroll Horizontally Until Element Found    ${button_locator}
    Wait Until Element Is Visible    locator=${button_locator}    timeout=10
    Element Should Be Visible    locator=${button_locator}
    Element Text Should Be    locator=${button_locator}    expected=${button_name}
    Log To Console    message=[B3] '${button_name}' button validated successfully\n

Click Wallet Action Button Screen Wallet
    [Documentation]    Click on a specific wallet action button
    [Arguments]    ${button_locator}    ${button_name}
    
    Scroll Horizontally Until Element Found    ${button_locator}
    Wait Until Element Is Visible    locator=${button_locator}    timeout=10
    Click Element    locator=${button_locator}
    Log To Console    message=[B3] Clicked '${button_name}' button\n

Click On Back Button Screen Wallet Filters
    [Documentation]    Validate the back button functionality on the wallet screen filter classe

    # Wait for back button to be visible
    Wait Until Element Is Visible    ${BTN_WALLET_BACK}    timeout=10s
    Element Should Be Visible        ${BTN_WALLET_BACK}
    # Click the back button
    Click Element                    ${BTN_WALLET_BACK}
    # Validate navigation to previous screen (e.g., home)
    Wait Until Element Is Visible    ${HOME_SCREEN_IDENTIFIER}    timeout=10s
    Element Should Be Visible        ${HOME_SCREEN_IDENTIFIER}

    Log    Back button on wallet screen filter classe validated successfully
