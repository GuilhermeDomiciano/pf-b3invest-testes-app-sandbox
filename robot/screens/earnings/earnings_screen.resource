*** Settings ***
Documentation    Proventos Screen - Validações de elementos dos proventos
Library    AppiumLibrary
Library    OperatingSystem
Library    ../../../.venv/lib/python3.9/site-packages/robot/libraries/XML.py
Resource    ../../../resource/utils/element_utils.resource
Resource    ../../base.resource
Resource    ../walkthrough/walkthrough_screen.resource
Resource    ../home/home_screen.resource
Resource    ../../../config/settings.resource
Variables    ../../elements/earnings.yaml
Variables    ../../elements/home.yaml

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
    Click Element    locator=${ENTENDA_O_QUE_E_DIVIDEND_YIELD}
    Wait Until Element Is Visible    locator=${TEXT_DIVIDEND_YIELD}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_TITLE_DIVIDEND_YIELD}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_DIVIDEND_YIELD}    timeout=10
    Click Element    locator=${BTN_CLOSE_RADAR_PROVENTOS}
    # Wait Until Element Is Visible    locator=${SUB_TITLE_PROVENTOS_RECEIVED_LAST_12_MONTHS}    timeout=10

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

Validate Earnings Hide Graph Item 
    [Documentation]    Valida os elementos do gráfico de proventos.
    # Scroll Screen Up
    # Click Element    locator=${JUNE_2025_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${JUNE_2025}    timeout=10
    Click Element    locator=${JUNE_2025_SELECTED}
    Scroll Until Element Not Found   locator_1=${JUNE_2025}    locator_2=${JUNE_2025_NOT_SELECTED}



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
# ? Validações relacionadas a tela de proventos a receber
Navigate To Receive Proventos
    [Documentation]    Navega para a tela de proventos a receber.
    Sleep    2s
    Wait Until Element Is Visible    locator=${TAB_PROVENTOS_NOT_SELECT_TWO}    timeout=10
    Click Element    locator=${TAB_PROVENTOS_NOT_SELECT_TWO}

Validate Proventos To Receive Header
    [Documentation]    Valida os elementos principais do cabeçalho dos proventos a receber.
    Wait Until Element Is Visible    locator=${TITLE_PROVENTOS_RECEIVE}    timeout=10
    Wait Until Element Is Visible    locator=${TAB_PROVENTOS_SELECT_TWO}    timeout=10
    Wait Until Element Is Visible    locator=${SUB_TITLE_PROVENTOS_TO_RECEIVED}    timeout=10
    # Wait Until Element Is Visible    locator=${DIVIDEND_YIELD}    timeout=10
    # Wait Until Element Is Visible    locator=${ENTENDA_O_QUE_E_DIVIDEND_YIELD}    timeout=10
    Wait Until Element Is Visible    locator=${HIDE_VALUES}    timeout=10
    Wait Until Element Is Visible    locator=${SUB_TITLE_PROVENTOS_TO_RECEIVED}    timeout=10

Validate Earnings To Receive Graph
    [Documentation]    Valida os elementos do gráfico de proventos a receber.
    Scroll Element Into View In Page    locator=${GRAPH_DESCRIPTION_TO_RECEIVE}
    Wait Until Element Is Visible    locator=${GRAPH_DESCRIPTION_TO_RECEIVE}    timeout=10
    Wait Until Element Is Visible    locator=${JUNE_2026_NOT_SELECTED}    timeout=10
    Click Element    locator=${JUNE_2026_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${JUNE_2026_SELECTED}    timeout=10

Validate Earnings To Receive Hide Graph Item 
    [Documentation]    Valida os elementos do gráfico de proventos a receber.
    # Scroll Screen Up
    # Click Element    locator=${JUNE_2025_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${JUNE_2026}    timeout=10
    Click Element    locator=${JUNE_2026_SELECTED}
    Scroll Until Element Not Found   locator_1=${JUNE_2026}    locator_2=${JUNE_2026_NOT_SELECTED}


# ? Validações relacionadas a tela de radar de proventos
Navigate To Radar Proventos
    [Documentation]    Navega para a tela de radar de proventos.
    Wait Until Element Is Visible    locator=${SUB_TITLE_PROVENTOS_RECEIVED_LAST_12_MONTHS}    timeout=25
    Wait Until Element Is Visible    locator=${TAB_PROVENTOS_NOT_SELECT_THREE}    timeout=10
    Click Element    locator=${TAB_PROVENTOS_NOT_SELECT_THREE}

Validate Popup Text Radar Proventos Close To Understand
    [Documentation]    Valida se existe o campo TEXT_RADAR_PROVENTOS na tela de radar.
   
    Wait Until Element Is Visible    locator=${BTN_CLOSE_RADAR_PROVENTOS}    timeout=10
    Element Should Be Visible    locator=${BTN_CLOSE_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${BTN_CLOSE_RADAR_PROVENTOS}    timeout=10
    Element Should Be Visible    locator=${BTN_CLOSE_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${TEXT_RADAR_PROVENTOS}    timeout=10
    Element Should Be Visible    locator=${TEXT_RADAR_PROVENTOS}
    Click Element    locator=${BTN_ENTENDI_RADAR_PROVENTOS}
    Element Should Be Visible    locator=${TAB_PROVENTOS_SELECT_THREE}    
    Element Should Be Visible    locator=${TEXT_RADAR_PROVENTOS_DESCRIPTION}

Validate Popup Text Radar Proventos Close To Close Icon
    [Documentation]    Valida se existe o campo TEXT_RADAR_PROVENTOS na tela de radar.
   
    Wait Until Element Is Visible    locator=${BTN_CLOSE_RADAR_PROVENTOS}    timeout=10
    Element Should Be Visible    locator=${BTN_CLOSE_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${BTN_CLOSE_RADAR_PROVENTOS}    timeout=10
    Element Should Be Visible    locator=${BTN_CLOSE_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${TEXT_RADAR_PROVENTOS}    timeout=10
    Element Should Be Visible    locator=${TEXT_RADAR_PROVENTOS}
    Click Element    locator=${BTN_CLOSE_RADAR_PROVENTOS}
    Element Should Be Visible    locator=${TAB_PROVENTOS_SELECT_THREE}    
    Element Should Be Visible    locator=${TEXT_RADAR_PROVENTOS_DESCRIPTION}


Return To Login Keeping Session
    [Documentation]    Retorna à tela de login mantendo a sessão do app aberta usando diferentes estratégias.
    Wait Until Element Is Visible    locator=${BOTTOM_NAV_HOME}    timeout=10
    Click Element    locator=${BOTTOM_NAV_HOME}
    Sleep    2s
    
    # Abrir menu
    Wait Until Element Is Visible    locator=${BOTTOM_NAV_MENU}    timeout=10
    Click Element    locator=${BOTTOM_NAV_MENU}
    Sleep    2s
    
    # Tentar "Sair do aplicativo"
    Scroll Element Into View In Page    locator=${SCREEN_MENU}
    Wait Until Element Is Visible    locator=${SCREEN_MENU}    timeout=10
    Scroll Screen
    Click Element    locator=${SCREEN_MENU}

Validate Text Radar Proventos
    [Documentation]    Valida se o texto de descrição do radar de proventos é exibido corretamente.
    Wait Until Element Is Visible    locator=${TEXT_RADAR_PROVENTOS_DESCRIPTION}    timeout=10
    Element Should Be Visible    locator=${TEXT_RADAR_PROVENTOS_DESCRIPTION}
    Wait Until Element Is Visible    locator=${UNDERSTAND_MORE_ABOUT_RADAR_PROVENTOS}    timeout=10
    Element Should Be Visible    locator=${UNDERSTAND_MORE_ABOUT_RADAR_PROVENTOS}


Validate Text Bottom Sheet Radar Proventos
    [Documentation]    Valida se o texto do bottom sheet do radar de proventos é exibido corretamente.
    Element Should Be Visible    locator=${UNDERSTAND_MORE_ABOUT_RADAR_PROVENTOS}
    Click Element    locator=${UNDERSTAND_MORE_ABOUT_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${BOTTOM_SHEET_RADAR_PROVENTOS_TITLE}    timeout=10
    Element Should Be Visible    locator=${BOTTOM_SHEET_RADAR_PROVENTOS_TITLE}
    Wait Until Element Is Visible    locator=${BOTTOM_SHEET_RADAR_PROVENTOS_DESCRIPTION}    timeout=10
    Element Should Be Visible    locator=${BOTTOM_SHEET_RADAR_PROVENTOS_DESCRIPTION}
    Wait Until Element Is Visible    locator=${BOTTOM_SHEET_RADAR_PROVENTOS_DETAILS}    timeout=10
    Element Should Be Visible    locator=${BOTTOM_SHEET_RADAR_PROVENTOS_DETAILS}

Validate Close Bottom Sheet Radar Proventos
    [Documentation]    Valida se é possível fechar o bottom sheet do radar de proventos.
    Element Should Be Visible    locator=${BACKGROUND_BOTTOM_SHEET_RADAR_PROVENTOS}
    Click Element    locator=${BACKGROUND_BOTTOM_SHEET_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${TITLE_PROVENTOS_RECEIVE}    timeout=10
    Click Element    locator=${UNDERSTAND_MORE_ABOUT_RADAR_PROVENTOS}
    Click Element    locator=${BTN_CLOSE_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${TITLE_PROVENTOS_RECEIVE}    timeout=10


Validate Scroll To close Icon Bottom Sheet Radar Proventos
    [Documentation]    Valida se é possível fechar o bottom sheet do radar de proventos clicando no ícone de fechar.
    Click Element    locator=${UNDERSTAND_MORE_ABOUT_RADAR_PROVENTOS}
    Element Should Be Visible    locator=${BACKGROUND_BOTTOM_SHEET_RADAR_PROVENTOS}
    ${location}=    Get Element Location    locator=${BOTTOM_SHEET_RADAR_PROVENTOS_TITLE}
    ${start_x}=    Set Variable    ${location}[x]
    ${start_y}=    Set Variable    ${location}[y]
    ${end_x}=    Set Variable    ${start_x}
    ${end_y}=    Evaluate    ${start_y} + 700
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    Wait Until Element Is Visible    locator=${TITLE_PROVENTOS_RECEIVE}    timeout=10

Validate Radar Proventos Filter And Download
    [Documentation]    Valida os campos de filtro e download do radar de proventos e o bottom sheet de exportação.
    Wait Until Element Is Visible    locator=${TITLE_FILTER_RADAR}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_DL_RADAR}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_FILTER_RADAR}    timeout=10
    Click Element    locator=${BTN_FILTER_RADAR}
    Scroll Element Into View In Page    locator=${DONT_HAVE_PROVENTOS_TO_RECEIVE_SUBTITLE}
    Wait Until Element Is Visible    locator=${DONT_HAVE_PROVENTOS_TO_RECEIVE_TITLE}    timeout=10
    Wait Until Element Is Visible    locator=${DONT_HAVE_PROVENTOS_TO_RECEIVE_SUBTITLE}    timeout=10
    Click Element    locator=${BTN_DL_RADAR}
    Wait Until Element Is Visible    locator=${TITLE_BOTTOM_SHEET_DL_RADAR}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_BOTTOM_SHEET_DL_RADAR_ACTIVE_FILTER}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_BOTTOM_SHEET_DL_RADAR_ACTIVE_FILTER_EXPLAIN}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_TIPE_DL}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_CSV}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_CANCEL_DL_RADAR}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_CONFIRM_DL_RADAR}    timeout=10
    Click Element    locator=${BTN_CANCEL_DL_RADAR}
    Wait Until Element Is Visible    locator=${DONT_HAVE_PROVENTOS_TO_RECEIVE_SUBTITLE}    timeout=10
    Wait Until Page Does Not Contain Element    locator=${TEXT_BOTTOM_SHEET_DL_RADAR_ACTIVE_FILTER_EXPLAIN}    timeout=10

# ! Detalhe dos proventos a receber
Validate Access Details Asset Button Proventos To Receive Item
    [Documentation]    Valida se o botão de acessar detalhes do ativo na tela de proventos a receber está visível e funcional.
    Scroll Element Into View In Page    locator=${BTN_ACCESS_DETAILS_ASSET_FIRST}
    Scroll Screen
    Click Element    locator=${BTN_ACCESS_DETAILS_ASSET_FIRST}

Validate Details Head Page Proventos To Receive Item
    [Documentation]    Valida se as informações do cabeçalho nos detalhes do item de proventos a receber estão corretas.
    Wait Until Element Is Visible    locator=${TITLE_DETAILS_EARNINGS}    timeout=10
    Wait Until Element Is Visible    locator=${SUBTITLE_DETAILS_EARNINGS}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_BACK_TO_EARNINGS}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_HIDE_VALUES}    timeout=10
    Wait Until Element Is Visible    locator=${VALUE_NET}    timeout=10
    Wait Until Element Is Visible    locator=${VALUE_NET_AMOUNT}    timeout=10
    Wait Until Element Is Visible    locator=${VALUE_DIVIDEND}    timeout=10

Validate Details Active Proventos To Receive Item
    [Documentation]    Valida se as informações do ativo nos detalhes do item de proventos a receber estão corretas.
    Scroll Element Into View In Page    locator=${DETAILS_ASSET}
    Wait Until Element Is Visible    locator=${DETAILS_ASSET}    timeout=10
    Scroll Element Into View In Page    locator=${COMPANY_DETAILS}
    Wait Until Element Is Visible    locator=${COMPANY_DETAILS}    timeout=10
    Scroll Element Into View In Page    locator=${CODE_ISIN_DISTRIBUTION}
    Wait Until Element Is Visible    locator=${CODE_ISIN_DISTRIBUTION}    timeout=10
    Scroll Element Into View In Page    locator=${CODE_TRADING}
    Wait Until Element Is Visible    locator=${CODE_TRADING}    timeout=10
    Scroll Element Into View In Page    locator=${TYPE_ASSET}
    Wait Until Element Is Visible    locator=${TYPE_ASSET}    timeout=10
    Scroll Element Into View In Page    locator=${SCRIBER_DETAILS}
    Wait Until Element Is Visible    locator=${SCRIBER_DETAILS}    timeout=10

Validate Details Event Proventos To Receive Item
    [Documentation]    Valida se as informações do evento nos detalhes do item de proventos a receber estão corretas.
    Scroll Element Into View In Page    locator=${DETAILS_EVENT}
    Wait Until Element Is Visible    locator=${DETAILS_EVENT}    timeout=10
    Scroll Element Into View In Page    locator=${PAYMENT_FORECAST}
    Wait Until Element Is Visible    locator=${PAYMENT_FORECAST}    timeout=10
    Scroll Element Into View In Page    locator=${APPROVAL_DATE}
    Wait Until Element Is Visible    locator=${APPROVAL_DATE}    timeout=10
    Scroll Element Into View In Page    locator=${UPDATE_DATE}
    Wait Until Element Is Visible    locator=${UPDATE_DATE}    timeout=10
    Scroll Element Into View In Page    locator=${EX_DATE}
    Wait Until Element Is Visible    locator=${EX_DATE}    timeout=10
    Scroll Element Into View In Page    locator=${IR_VALUE}
    Wait Until Element Is Visible    locator=${IR_VALUE}    timeout=10
    Scroll Element Into View In Page    locator=${IR_RATE}
    Wait Until Element Is Visible    locator=${IR_RATE}    timeout=10
    Scroll Element Into View In Page    locator=${UNIT_VALUE}
    Wait Until Element Is Visible    locator=${UNIT_VALUE}    timeout=10
    Scroll Element Into View In Page    locator=${GROSS_VALUE}
    Wait Until Element Is Visible    locator=${GROSS_VALUE}    timeout=10
    Scroll Element Into View In Page    locator=${QUANTITY}
    Wait Until Element Is Visible    locator=${QUANTITY}    timeout=10

#! Detalhe de proventos recebidos 
Validate Access Details Asset Button Proventos Received Item
    [Documentation]    Valida se o botão de acessar detalhes do ativo na tela de proventos recebidos está visível e funcional.
    Scroll Element Into View In Page    locator=${BTN_CARD_EARNINGS_RECEIVED}
    Scroll Screen
    Click Element    locator=${BTN_CARD_EARNINGS_RECEIVED}

Validate Details Proventos Received Item
    [Documentation]    Valida se as informações do cabeçalho nos detalhes do item de proventos recebidos estão corretas.
    Wait Until Element Is Visible    locator=${BTN_BACK_TO_EARNINGS}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_BACK_TO_EARNINGS}    timeout=10
    Wait Until Element Is Visible    locator=${BTN_HIDE_VALUES}    timeout=10
    Wait Until Element Is Visible    locator=${TITLE_CARD_EARNINGS_RECEIVED}    timeout=10
    Wait Until Element Is Visible    locator=${SUBTITLE_CARD_EARNINGS_RECEIVED}    timeout=10
    Wait Until Element Is Visible    locator=${VALUE_TYPE_TITLE_EARNINGS_RECEIVED}    timeout=10
    Wait Until Element Is Visible    locator=${VALUE_TYPE_EARNINGS_RECEIVED}    timeout=10
    Scroll Element Into View In Page    locator=${DETAILS_EVENT_EARNINGS_RECEIVED}
    Wait Until Element Is Visible    locator=${DETAILS_EVENT_EARNINGS_RECEIVED}    timeout=10
    Scroll Element Into View In Page    locator=${DATE_PAYMENT_EARNINGS_RECEIVED}
    Wait Until Element Is Visible    locator=${DATE_PAYMENT_EARNINGS_RECEIVED}    timeout=10
    Scroll Element Into View In Page    locator=${QUANTITY_EARNINGS_RECEIVED}
    Wait Until Element Is Visible    locator=${QUANTITY_EARNINGS_RECEIVED}    timeout=10
    Scroll Element Into View In Page    locator=${UNIT_VALUE_EARNINGS_RECEIVED}
    Wait Until Element Is Visible    locator=${UNIT_VALUE_EARNINGS_RECEIVED}    timeout=10

Check Money Value In Screen Details Proventos Received Item
    [Documentation]    Valida se o valor do provento recebido é exibido corretamente.
    @{LISTA_VALORES}=    Create List
    Scroll Element Into View In Page    locator=${VALUE_TYPE_TITLE_EARNINGS_RECEIVED}
    Wait Until Element Is Visible    locator=${VALUE_TYPE_TITLE_EARNINGS_RECEIVED}    timeout=10
    ${valor_texto}=    Get Element Attribute    ${UNIT_VALUE_EARNINGS_RECEIVED}    content-desc
    Log To Console    message=[B3] Valor extraído: ${valor_texto}
    Append To List    ${LISTA_VALORES}    ${valor_texto}
    ${qtd_valores}=    Get Length    ${LISTA_VALORES}
    Should Be Equal As Integers    ${qtd_valores}    1    Quantidade de valores esperada: 1. Quantidade encontrada: ${qtd_valores}.
    
    

#! Detalhe de radar de proventos
Validate Access Details Radar Proventos
    [Documentation]    Valida se o botão de acessar detalhes do radar de proventos está visível e funcional.
    Scroll Element Into View In Page    locator=${BUTTON_DATE_RADAR}
    Scroll Screen
    Click Element    locator=${BUTTON_DATE_RADAR}

Validate Details Radar Proventos
    [Documentation]    Valida se as informações do cabeçalho nos detalhes do radar de proventos estão corretas.
    Wait Until Element Is Visible    locator=${BTN_BACK_TO_EARNINGS}    timeout=10
    Wait Until Element Is Visible    locator=${TITLE_RADAR_PROVENTOS}    timeout=10
    Wait Until Element Is Visible    locator=${SUBTITLE_RADAR_PROVENTOS}    timeout=10
    Wait Until Element Is Visible    locator=${DETAILS_RADAR_PROVENTOS}    timeout=10
    Scroll Element Into View In Page    locator=${TYPE_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${TYPE_RADAR_PROVENTOS}    timeout=10
    Scroll Element Into View In Page    locator=${TYPE_EVENT_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${TYPE_EVENT_RADAR_PROVENTOS}    timeout=10
    Scroll Element Into View In Page    locator=${DATE_COM_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${DATE_COM_RADAR_PROVENTOS}    timeout=10
    Scroll Element Into View In Page    locator=${DATE_PAYMENT_RADAR_PROVENTOS}
    Wait Until Element Is Visible    locator=${DATE_PAYMENT_RADAR_PROVENTOS}    timeout=10
    Scroll Element Into View In Page    locator=${UNIT_PRICE_GROSS}
    Wait Until Element Is Visible    locator=${UNIT_PRICE_GROSS}    timeout=10
    Scroll Element Into View In Page    locator=${PRICE_CLOSING}
    Wait Until Element Is Visible    locator=${PRICE_CLOSING}    timeout=10
    Scroll Element Into View In Page    locator=${DY}
    Wait Until Element Is Visible    locator=${DY}    timeout=10
    Scroll Element Into View In Page    locator=${EXTERNAL_LINK}
    Wait Until Element Is Visible    locator=${EXTERNAL_LINK}    timeout=10


Back Screen Details Radar Proventos
    [Documentation]    Valida se é possível retornar da tela de detalhes do radar de proventos para a tela de radar de proventos.
    Wait Until Element Is Visible    locator=${BTN_BACK_TO_EARNINGS}    timeout=10
    Click Element    locator=${BTN_BACK_TO_EARNINGS}
    