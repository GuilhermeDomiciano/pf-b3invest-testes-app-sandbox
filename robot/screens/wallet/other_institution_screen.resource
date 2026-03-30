*** Settings ***
Documentation    Home Screen

Library          AppiumLibrary

Resource    ../../../resource/utils/element_utils.resource

Variables    ../../elements/wallet.yaml
Variables    ../../elements/detail_classe.yaml
Variables    ../../elements/other_institution.yaml

*** Keywords ***
Click Other Institution Button Screen Wallet Screen
    [Documentation]    Click on the Institution filter button in the wallet allocation section

    Wait Until Page Contains Element    locator=${BTN_WALLET_FILTER_INSTITUICAO}    timeout=10
    Click Element    locator=${BTN_WALLET_FILTER_INSTITUICAO}
    Scroll Element Into View In Page    locator=${BTN_WALLET_ACCESS_ALL_INSTITUTIONS}
    Wait Until Page Contains    text=Acessar todas as instituições    timeout=10s
    Click Element    locator=${NAV_OTHER_INSTITUTIONS}

    Log To Console    message=[B3] Clicked Instituição filter button in wallet allocation section\n

Validate Other Institutions Screen Information TopBar Screen
    [Documentation]    Valida as informações do topo da tela de outras instituições
    
    Wait Until Element Is Visible    ${BTN_BACK_OTHER_INSTITUTIONS}  timeout=10s
    Wait Until Element Is Visible   ${TXT_OTHER_INSTITUTIONS_QUANTITY}    timeout=15s
    Element Should Be Visible        ${TITLE_OTHER_INSTITUTIONS}
    Element Should Be Visible        ${PERCENT_ID}
    Element Should Be Visible        ${WALLET_OTHER_INSTITUTIONS_TOPBAR}
    Element Should Be Visible        ${TXT_OTHER_INSTITUTIONS_QUANTITY}  
    Element Should Be Visible        ${OTHER_INSTITUTIONS_TOTAL_VALUE}  
    Element Should Be Visible        ${OTHER_INSTITUTIONS_APPRECIATED}
    Element Should Be Visible        ${OTHER_INSTITUTIONS_30_DAYS_ACS_VARIATION}
    Log To Console    message=[B3] Validate head screen others institutions

Validate Button Institution Screen
    [Documentation]     Valida o botao de instituicao e seus textos

    Scroll Element Into View In Page        locator=${PRODUCT_INSTITUTION_NUMBER}
    Element Should Be Visible       ${PRODUCT_INSTITUTION_NUMBER}
    Element Should Be Visible       ${BTN_GO_TO_INSTITUTION_PAGE}
    Log To Console    message=[B3] Validate Button Institution\n

Validate Card Institution Screen
    [Documentation]     Valida o card da instituição e seus textos

    Scroll Element Into View In Page        locator=${CARD_OTHER_INSTITUTION_VALUE}
    Element Should Be Visible       ${CARD_OTHER_INSTITUTION_VALUE}
    Log To Console    message=[B3] Validate Card Institution\n
  
Navigate To Institution Page From Other Institutions Screen
    [Documentation]    Navega para a página da instituição a partir da tela de outras instituições
    
    Scroll Element Into View In Page        locator=${BTN_GO_TO_INSTITUTION_PAGE}
    Click Element    locator=${BTN_GO_TO_INSTITUTION_PAGE}
    Log To Console    message=[B3] Navigated to Institution Page from Other Institutions Screen\n

Back Navigation From Other Institutions Screen
    [Documentation]    Realiza a navegação de volta a partir da tela de outras instituições

    Wait Until Element Is Visible    ${BTN_BACK_OTHER_INSTITUTIONS}   timeout=10s
    Wait Until Element Is Visible   ${PERCENT_ID}    timeout=10s
    Element Should Be Visible  ${OTHER_INSTITUTIONS_TOTAL_VALUE}    
    Element Should Be Visible  ${OTHER_INSTITUTIONS_30_DAYS_ACS_VARIATION}   
    Click Element    locator=${BTN_BACK_OTHER_INSTITUTIONS}
    Element Should Be Visible       ${PRODUCT_INSTITUTION_NUMBER}
    Element Should Be Visible       ${BTN_GO_TO_INSTITUTION_PAGE}
    Log To Console    message=[B3] Back Navigation from Other Institutions Screen\n
    
Validate Order Cards Institution Screen
    [Documentation]     Valida a ordem dos cards das instituições na tela de outras instituições
    @{LISTA_VALORES}=    Create List
    Navigate To Institution Page From Other Institutions Screen
    Wait Until Element Is Visible    ${PERCENT_VALUE}   timeout=10s
    ${valor_texto}=    Get Element Attribute    ${PERCENT_VALUE}    content-desc
    Log To Console    message=[B3] Valor extraído: ${valor_texto}
    Append To List    ${LISTA_VALORES}    ${valor_texto}
    Click Element    locator=${BTN_BACK_OTHER_INSTITUTIONS}

    Scroll Full Screen Dynamic
    Navigate To Institution Page From Other Institutions Screen
    Wait Until Element Is Visible    ${PERCENT_VALUE}   timeout=10s
    ${valor_texto}=    Get Element Attribute    ${PERCENT_VALUE}    content-desc
    Log To Console    message=[B3] Valor extraído: ${valor_texto}
    Append To List    ${LISTA_VALORES}    ${valor_texto}
    Click Element    locator=${BTN_BACK_OTHER_INSTITUTIONS}

    Scroll Full Screen Dynamic
    Navigate To Institution Page From Other Institutions Screen
    Wait Until Element Is Visible    ${PERCENT_VALUE}   timeout=10s
    ${valor_texto}=    Get Element Attribute    ${PERCENT_VALUE}    content-desc
    Log To Console    message=[B3] Valor extraído: ${valor_texto}
    Append To List    ${LISTA_VALORES}    ${valor_texto}
    Click Element    locator=${BTN_BACK_OTHER_INSTITUTIONS}

    Log To Console    message=[B3] Valor extraído: ${LISTA_VALORES}

    Validate Order List Descending    @{LISTA_VALORES}
 
Validate Order List Descending
    [Documentation]    Valida se uma lista está em ordem decrescente
    [Arguments]    @{input_list}

   @{sorted_values}=    Copy List    ${input_list}
    Sort List    ${sorted_values}
    Reverse List    ${sorted_values}
    Log To Console    message=[B3] Validando ordem DESCENDENTE
    Log To Console    message=[B3] Lista ordenada: ${sorted_values}
    Log To Console    message=[B3] Lista original: ${input_list}
    Should Be Equal   ${input_list}    ${sorted_values}
    

Validate Three Products Institution Screen
    [Documentation]    Realiza a ação de carregar mais produtos na tela de outras instituições
    
    Scroll Element Into View In Page        locator=${LOAD_MORE_PRODUCTS}
    Log To Console    message=[B3] comecando a validar
    Find Elements Until Specific Element Found    ${LOAD_MORE_PRODUCTS}    match_numbers_expected=3
    Log To Console    message=[B3] Load more products in Other Institutions Screen\n

Validate Load More Products In Other Institutions Screen
    [Documentation]    Valida se ao clicar em carregar mais produtos, mais produtos são exibidos na tela de outras instituições

    Click Element    locator=${LOAD_MORE_PRODUCTS}
    Sleep    2s
    Swipe    ${659}    ${1300}    ${659}    ${900}
    Scroll Screen
    # Scroll Element Into View In Page Small  locator=${PRODUCT_INSTITUTION_NUMBER}
    Find Elements Until Specific Element Found    ${PRODUCT_INSTITUTION_NUMBER}    match_numbers_expected=5
    Log To Console    message=[B3] Validated Load More Products in Other Institutions Screen\n

Validate Load More Products one and three In Other Institutions Screen
    [Documentation]    Valida a funcionalidade de carregar mais produtos na tela de outras instituições

    Scroll Element Into View In Page        locator=${LOAD_MORE_3_PRODUCTS}
    Click Element    locator=${LOAD_MORE_3_PRODUCTS}
    Sleep    2s
    Scroll Element Into View In Page        locator=${LOAD_MORE_3_PRODUCTS}
    Click Element    locator=${LOAD_MORE_3_PRODUCTS}
    Sleep    2s
    Scroll Element Into View In Page        locator=${LOAD_MORE_3_PRODUCTS}
    Click Element    locator=${LOAD_MORE_3_PRODUCTS}
    Sleep    2s
    Scroll Element Into View In Page        locator=${LOAD_MORE_1_PRODUCT}
    Click Element    locator=${LOAD_MORE_1_PRODUCT}

Validate Scroll Voice Over Enabled In Other Institutions Screen
    [Documentation]    Valida a funcionalidade de carregar mais instituições na tela de outras instituições
    
    Enable TalkBack
    Scroll Element Into View In Page        locator=${LOAD_MORE_INSTITUTIONS}
    Click Element    locator=${LOAD_MORE_INSTITUTIONS}
    Sleep    2s
    Scroll Element Into View In Page        locator=${LOAD_MORE_INSTITUTIONS}
    Click Element    locator=${LOAD_MORE_INSTITUTIONS}
    Disable TalkBack
    Sleep    2s