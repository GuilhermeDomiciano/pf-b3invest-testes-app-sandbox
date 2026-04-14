*** Settings ***
Documentation    Statement Screen - Validações de elementos do extrato
Library    AppiumLibrary
Library    OperatingSystem
Resource    ../../../resource/utils/element_utils.resource
Resource    ../../functions/wallet/wallet_functions.resource
Variables    ../../elements/statement.yaml

*** Keywords ***

Validate Statement Header
    [Documentation]    Valida os elementos principais do cabeçalho do extrato.
    Sleep    1s
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_STATEMENT}    timeout=20
    Wait Until Element Is Visible    locator=${STATEMENT_HIDE_STATEMENT}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_UPDATED}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_TOTAL_VALUE}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_APPRECIATED}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_VARIATION}    timeout=10

Validate Statement Navigation Bar
    [Documentation]    Valida os botões de navegação inferiores do extrato.
    Wait Until Element Is Visible    locator=${STATEMENT_BTN_NAV_HOME}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_BTN_NAV_WALLET}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_BTN_NAV_EARNINGS}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_BTN_NAV_STATEMENT}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_BTN_NAV_MENU}    timeout=10

Validate Statement Values Section
    [Documentation]    Valida os valores principais do extrato.
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_TOTAL_VALUE}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_APPRECIATED}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_VARIATION}    timeout=10

Validate Statement Future Transactions Section
    [Documentation]    Valida a seção de lançamentos futuros.
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_FUTURE_ENTRIES}    timeout=10
    Click Element    locator=${STATEMENT_ACS_FUTURE_ENTRIES}
    Wait Until Element Is Visible    locator=${EMPTY_STATEMENT_MESSAGE}    timeout=10

Validate Statement Last Transactions Section
    [Documentation]    Valida a seção de últimos lançamentos.
    Scroll Element Into View In Page    locator=${STATEMENT_ACS_LAST_ENTRIES}
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_LAST_ENTRIES}    timeout=10
    Scroll Element Into View In Page    locator=${STATEMENT_ACS_ENTRY_DATE}
    Scroll Element Into View In Page     locator=${STATEMENT_PARTICIPANT}
    Wait Until Element Is Visible    locator=${STATEMENT_PARTICIPANT}    timeout=10

Validate Statement Empty Section
    [Documentation]    Valida campo com - quando extrato está vazio.
    Wait Until Element Is Visible     locator=${STATEMENT_HIDE_STATEMENT}   timeout=10s
    Wait Until Element Is Visible     locator=${STATEMENT_ACS_ENTRY_DATE}   timeout=10
    Scroll Element Into View In Page    locator=${STATEMENT_ACS_LAST_ENTRIES}
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_LAST_ENTRIES}    timeout=10
    Scroll Element Into View In Page    locator=${EMPTY_VALUE}
    Wait Until Element Is Visible    locator=${EMPTY_VALUE}    timeout=10
    Scroll Element Into View In Page     locator=${LOAD_MORE}
    Scroll Screen
    Click Element    locator=${LOAD_MORE}
    Scroll Element Into View In Page    locator=${GO_TO_DETAILS}
    Click Element    locator=${GO_TO_DETAILS}
    Wait Until Element Is Visible    locator=${NEGOTIATION_CODE}    timeout=10
    Click Element    locator=${BACK_BUTTON}
    
Validate Statement Empty Message
    [Documentation]    Valida a mensagem de extrato vazio.
    Wait Until Element Is Visible    locator=${EMPTY_STATEMENT_MESSAGE}    timeout=10

Validate Full Statement Screen
    [Documentation]    Validação agrupada da tela completa do extrato.
    Validate Statement Header
    Validate Statement Navigation Bar
    Validate Statement Values Section
    Validate Statement Future Transactions Section
    Validate Statement Last Transactions Section
    Validate Statement Empty Section
    Log To Console    message=[B3] Tela completa de extrato validada.\n

Navigation Screen Home Statement
    [Documentation]    Navega para a tela de extrato após login
    # Exemplo: clicar no botão de navegação ou usar keyword já existente
    # Wait Until Element Is Visible    locator=${STATEMENT_BTN_NAV_STATEMENT}    timeout=10
    # Click Element    locator=${STATEMENT_BTN_NAV_STATEMENT}
    # Wait Until Element Is Visible    locator=${STATEMENT_ACS_STATEMENT}    timeout=10
    Wait Until Element Is Visible    locator=${STATEMENT_BTN_NAV_WALLET}    timeout=10
    Click Element    locator=${STATEMENT_BTN_NAV_WALLET}
    Scroll Element Into View In Page    locator=${BTN_WALLET_EVOLUÇÃO_PATRIMONIAL}
    Wait Until Element Is Visible    locator=${BTN_WALLET_EXTRATO}    timeout=10
    Click Element    locator=${BTN_WALLET_EXTRATO}

Validate Card Pagination Statement
    [Documentation]    Valida a paginação dos lançamentos na tela de extrato.
    Sleep    2s
    Wait Until Element Is Visible     locator=${STATEMENT_HIDE_STATEMENT}   timeout=10s
    Enable TalkBack
    Click Element    locator=${STATEMENT_HIDE_STATEMENT}
    Wait Until Element Is Visible     locator=${STATEMENT_ACS_ENTRY_DATE}   timeout=10
    Scroll Element Into View In Page    locator=${STATEMENT_ACS_LAST_ENTRIES}
    Wait Until Element Is Visible    locator=${STATEMENT_ACS_LAST_ENTRIES}    timeout=10
    Scroll Element Into View In Page    locator=${STATEMENT_ACS_ENTRY_DATE}
    Scroll Element Into View In Page     locator=${STATEMENT_ACTIVE}
    ${count}=    Set Variable    0
    FOR    ${counter}    IN RANGE    0    15
        ${el}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOAD_MORE}    0.5
        @{elements}=    Get WebElements    locator=${HIDE_VALUES}
        ${countLoop}=    Get Length    ${elements}
        ${count}=    Evaluate    ${count} + ${countLoop}
        Log To Console     Quantidade de elementos HIDE_VALUES Comeco na tela: ${count}
        Log To Console     Quantidade de elementos HIDE_VALUES LOOP na tela: ${countLoop}
        Run Keyword If     ${el}     Exit For Loop
        Log To Console     Quantidade de elementos HIDE_VALUES SOMA na tela: ${count}
        # Scroll do tamanho da tela do celular (dinâmico via ADB) essa soma ta estranha
        Scroll Element Into View In Page     locator=${LOAD_MORE}
        # Swipe    500    1000    500    800    500
        ${counter}=    Set Variable    ${counter}+1
        ${countLoop}=    Set Variable    0
     
    END
    Log To Console    message=[B3] Total de elementos HIDE_VALUES encontrados: ${count}\n
    Should Be True    ${count} >= 4    Quantidade de elementos HIDE_VALUES encontrada (${count}) é menor que 2.
    # Click Element    locator=${LOAD_MORE}        
    # Scroll Element Into View In Page    locator=${LOAD_MORE}
    Disable TalkBack
    Log To Console    message=[B3] Paginação dos lançamentos do extrato validada.\n

Validate Statement Order Date Statement
    [Documentation]    Faz scroll até achar o primeiro campo de data, armazena o id em uma variável.
    Wait Until Element Is Visible     locator=${STATEMENT_ACS_LAST_ENTRIES}   timeout=20s
    Scroll Element Into View In Page    locator=${STATEMENT_ACS_ENTRY_DATE}
    ${date_element}=    Get WebElement    locator=${STATEMENT_ACS_ENTRY_DATE}
    ${date_accessibility_id1}=    Run Keyword And Ignore Error    Get Element Attribute    ${date_element}    content-desc
    Scroll Element Into View In Page     locator=${LOAD_MORE}
    Scroll Screen
    Click Element    locator=${LOAD_MORE}
    Sleep    2s
    Scroll Element Into View In Page     locator=${LOAD_MORE}
    Scroll Screen
    Click Element    locator=${LOAD_MORE}
    Sleep    2s
    Scroll Element Into View In Page    locator=${STATEMENT_ACS_ENTRY_DATE}
    ${date_element2}=    Get WebElement    locator=${STATEMENT_ACS_ENTRY_DATE}
    ${date_accessibility_id2}=    Run Keyword And Ignore Error    Get Element Attribute    ${date_element2}    content-desc
    Log To Console    message=[B3] id extraído 1: ${date_accessibility_id1}[1], id extraído 2: ${date_accessibility_id2}[1]

    ${dateShouldBe}=  Compare Dates From Strings    ${date_accessibility_id1}[1]   ${date_accessibility_id2}[1]

    Log To Console    message=[B3] Resultado da comparação: ${dateShouldBe}
    Should Be Equal As Integers    ${dateShouldBe}    0    O primeiro id (${date_accessibility_id1}) é maior que o segundo (${date_accessibility_id2})!
    
    