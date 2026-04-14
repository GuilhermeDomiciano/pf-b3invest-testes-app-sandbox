*** Settings ***
Documentation    Proventos Screen - Validações de elementos dos proventos
Library    AppiumLibrary
Library    OperatingSystem
Resource    ../../../resource/utils/element_utils.resource
Variables    ../../elements/earnings.yaml

*** Keywords ***
Navigation To My Earnings 
    [Documentation]    Navega para a tela de meus proventos.
    Wait Until Element Is Visible    locator=${B3_BOTTOM_NAV_BAR_ITEM_PROVENTOS}    timeout=20
    Click Element    locator=${B3_BOTTOM_NAV_BAR_ITEM_PROVENTOS}
Validate Proventos Header
    [Documentation]    Valida os elementos principais do cabeçalho dos proventos.
    Wait Until Element Is Visible    locator=${TITLE_PROVENTOS_RECEIVE}    timeout=10
    Wait Until Element Is Visible    locator=${TAB_PROVENTOS_SELECT_ONE}    timeout=10
    Wait Until Element Is Visible    locator=${SUB_TITLE_PROVENTOS_RECEIVED_LAST_12_MONTHS}    timeout=10
    # Wait Until Element Is Visible    locator=${DIVIDEND_YIELD}    timeout=10
    Wait Until Element Is Visible    locator=${ENTENDA_O_QUE_E_DIVIDEND_YIELD}    timeout=10
    Wait Until Element Is Visible    locator=${HIDE_VALUES}    timeout=10
    Wait Until Element Is Visible    locator=${SUB_TITLE_PROVENTOS_RECEIVED_LAST_12_MONTHS}    timeout=10

Validate Earnings Graph
    [Documentation]    Valida os elementos do gráfico de proventos.
    Scroll Element Into View In Page    locator=${GRAPH_DESCRIPTION}
    Wait Until Element Is Visible    locator=${GRAPH_DESCRIPTION}    timeout=10
    Wait Until Element Is Visible    locator=${JUNE_2025_NOT_SELECTED}    timeout=10
    Click Element    locator=${JUNE_2025_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${JUNE_2025_SELECTED}    timeout=10
    
   
Validate Proventos Received Item
    [Documentation]    Valida os elementos do gráfico de proventos a receber.
    Scroll Element Into View In Page    locator=${VALUE_LIST_EARNINGS}
    Wait Until Element Is Visible    locator=${VALUE_LIST_EARNINGS}    timeout=10
    Wait Until Element Is Visible    locator=${DATE_LIST_EARNINGS}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_ACCESS_DETAILS_ASSET_COUNT}    timeout=10


Validate Load More Button Proventos Received Item
    [Documentation]    Valida o botão de carregar mais itens na tela de proventos a receber.
    Scroll Element Into View In Page    locator=${LOAD_MORE}
    Scroll Screen
    Wait Until Element Is Visible    locator=${DATE_LIST_EARNINGS}    timeout=10
    Click Element    locator=${LOAD_MORE}
    Sleep    2s
    Disable TalkBack
    ${screen_width}=    Set Variable    1080
    ${screen_height}=    Set Variable    2340
        
    ${start_y}=    Evaluate    int(${screen_height} * 0.7)    # 2106
    ${end_y}=    Evaluate    int(${screen_height} * 0.2)     # 234
    ${center_x}=    Evaluate    int(${screen_width} / 2)     # 540
        
    Swipe    ${center_x}    ${start_y}    ${center_x}    ${end_y}
    
    Find Elements Until Specific Element Found Earnings    ${VALUE_LIST_EARNINGS}       match_numbers_expected=4
    ${screen_width}=    Set Variable    1080
    ${screen_height}=    Set Variable    2340
        
    ${start_y}=    Evaluate    int(${screen_height} * 0.85)    # 2106
    ${end_y}=    Evaluate    int(${screen_height} * 0.15)     # 234
    ${center_x}=    Evaluate    int(${screen_width} / 2)     # 540
        
    Swipe    ${center_x}    ${start_y}    ${center_x}    ${end_y}

    Find Elements Until Specific Element Found Earnings    ${LOAD_MORE}       match_numbers_expected=4
    Wait Until Element Is Visible    locator=${DATE_LIST_EARNINGS}    timeout=10

Validate Load More Updates Date List
    [Documentation]    Valida se o botão Load More atualiza a lista de datas dos proventos.
    # Encontra e guarda o ID inicial do elemento DATE_LIST_EARNINGS
    Scroll Element Into View In Page    locator=${DATE_LIST_EARNINGS}
    Wait Until Element Is Visible    locator=${DATE_LIST_EARNINGS}    timeout=10
    ${initial_date_id}=    Get Element Attribute    ${DATE_LIST_EARNINGS}    content-desc
    Log    ID inicial da data: ${initial_date_id}
    
    # Faz scroll até encontrar o botão LOAD_MORE
    Scroll Element Into View In Page    locator=${LOAD_MORE}
    Wait Until Element Is Visible    locator=${LOAD_MORE}    timeout=10
    Scroll Screen
    # Clica no botão LOAD_MORE
    Click Element    locator=${LOAD_MORE}
    Sleep    2s
    Disable TalkBack
    # Encontra o botão LOAD_MORE novamente após o carregamento
    Scroll Element Into View In Page    locator=${LOAD_MORE}
    Wait Until Element Is Visible    locator=${LOAD_MORE}    timeout=10
    
    # Busca novamente o elemento DATE_LIST_EARNINGS e guarda o novo ID
    Wait Until Element Is Visible    locator=${DATE_LIST_EARNINGS}    timeout=10
    ${new_date_id}=    Get Element Attribute    ${DATE_LIST_EARNINGS}    content-desc
    Log    ID após Load More: ${new_date_id}
    
    Log To Console    message =ID inicial da data: ${initial_date_id} data final: ${new_date_id}
    Should Not Be Equal    ${initial_date_id}    ${new_date_id}    
    ...    msg=Erro: O ID do elemento DATE_LIST_EARNINGS não foi atualizado após clicar em Load More

Validate Mis Date 
    [Documentation]    Valida se a data dos itens de proventos a receber é atualizada após clicar no botão de carregar mais.
    Scroll Element Into View Top In Page   locator=${TITLE_PROVENTOS_RECEIVE}
    # Validação: se encontrar DATE_LIST_EARNINGS, o teste falha; se não encontrar, passa
    ${element_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    locator=${DATE_LIST_EARNINGS}    timeout=5
    Run Keyword If    '${element_found}' == 'True'    Fail    Erro: DATE_LIST_EARNINGS foi encontrado quando não deveria estar presente
    Pass Execution    Teste passou: DATE_LIST_EARNINGS não foi encontrado conforme esperado

Validate Proventos Available Soon Text
    [Documentation]    Valida se o texto de proventos disponíveis em breve é exibido quando não há proventos gerados.
    Scroll Element Into View Top In Page   locator=${TEXT_PROVENTOS_AVAILABLE_SOON}
    Wait Until Element Is Visible    locator=${TEXT_PROVENTOS_AVAILABLE_SOON}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_PROVENTOS_NOT_GENERATED}    timeout=10