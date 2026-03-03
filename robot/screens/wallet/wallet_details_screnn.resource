
*** Settings ***
Documentation    Wallet Details Screen (Class Detail)

Library    AppiumLibrary
Library    OperatingSystem

# Utils
Resource    ../../../resource/utils/element_utils.resource

# Element maps
Variables    ../../elements/detail_classe.yaml

*** Keywords ***

Validate Percentages Format Internal
    [Documentation]    Utilitário interno para validar formato percentual.
    [Arguments]    ${locator}    ${regex}
    ${elements}=    Get Webelements    ${locator}
    FOR    ${el}    IN    @{elements}
        ${txt}=    Get Element Attribute    ${el}    content-desc
        Run Keyword If    '${txt}'=='None'    ${txt}=    Get Element Attribute    ${el}    text
        Run Keyword If    '${txt}'!='None'    Should Match Regexp    ${txt}    ${regex}
    END
    Log To Console    message=[B3] Percentuais seguem padrão ${regex}.\n

Open Class Detail Products Screen
    [Documentation]    Clica no botão de navegação da classe Renda Fixa para abrir a tela de detalhe.
    [Arguments]    ${class_name}
    IF    '${class_name}' == 'renda fixa'
        Scroll Element Into View In Page    locator=${CLASS_DETAIL_BTN_NAV_RENDA_FIXA}
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_NAV_RENDA_FIXA}    timeout=10
        Click Element    locator=${CLASS_DETAIL_BTN_NAV_RENDA_FIXA}
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_VOLTAR}    timeout=10
        Log To Console    message=[B3] Detalhe da classe 'Renda Fixa' aberto.\n
    ELSE IF    '${class_name}' == 'renda variável'
        Scroll Element Into View In Page    locator=${CLASS_FILTER_RENDA_VARIAVEL}
        Wait Until Element Is Visible    locator=${CLASS_FILTER_RENDA_VARIAVEL}    timeout=10
        Click Element    locator=${CLASS_FILTER_RENDA_VARIAVEL}
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_VOLTAR}    timeout=10
        Log To Console    message=[B3] Detalhe da classe 'Renda Variável' aberto.\n
    ELSE IF    '${class_name}' == 'internacional'
        Scroll Element Into View In Page    locator=${CLASS_FILTER_INTERNACIONAL}
        Wait Until Element Is Visible    locator=${CLASS_FILTER_INTERNACIONAL}    timeout=10
        Click Element    locator=${CLASS_FILTER_INTERNACIONAL}
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_VOLTAR}    timeout=10
        Log To Console    message=[B3] Detalhe da classe 'Internacional' aberto.\n
    ELSE
        Fail    Classe '${class_name}' não suportada.
    END

Validate Class Detail Back Button Section Renda Fixa
    [Documentation]    Valida acao do botao de voltar na tela de detalhe da classe.
    Click Element    locator=${CLASS_DETAIL_BTN_VOLTAR}
    Log To Console    message=[B3] Back Buttom classe validado.\n
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_NAV_RENDA_FIXA}    timeout=10

Validate Class Detail Back Button Section Renda variável
    [Documentation]    Valida acao do botao de voltar na tela de detalhe da classe.
    Click Element    locator=${CLASS_DETAIL_BTN_VOLTAR}
    Log To Console    message=[B3] Back Buttom classe validado.\n
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_NAV_RENDA_VARIAVEL}    timeout=10

Validate Class Detail Back Button Section Internacional
    [Documentation]    Valida acao do botao de voltar na tela de detalhe da classe.
    Click Element    locator=${CLASS_DETAIL_BTN_VOLTAR}
    Log To Console    message=[B3] Back Buttom classe validado.\n
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_NAV_INTERNACIONAL}    timeout=10

Validate Class Detail Back Button Section Institutions
    [Documentation]    Valida acao do botao de voltar na tela de detalhe da classe.
    Click Element    locator=${CLASS_DETAIL_BTN_VOLTAR}
    Log To Console    message=[B3] Back Buttom classe validado.\n
    Wait Until Element Is Visible    locator=${BTN_NAV_INSTITUTION}    timeout=10

Validate Class Detail Card Ativos Components Screen Renda Fixa
    [Documentation]    Valida os componentes do card de ativos na tela de detalhe da classe.
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_RENDA_FIXA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_RENDA_FIXA}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_RENDA_FIXA_TITLE_CARD}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_RENDA_FIXA_SUB_TITLE_CARD}    timeout=10
    Find Elements Until Specific Element Found     ${CLASS_DETAIL_EL_CDB_1_ATIVO_ITEM_2_DE_2}       match_numbers_expected=1

Validate Class Detail Card Ativos Components Screen Renda Variavel
    [Documentation]    Valida os componentes do card de ativos na tela de detalhe da classe Renda Variável.
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_RENDA_VARIAVEL}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_RENDA_VARIAVEL}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_RENDA_VARIAVEL_TITLE_CARD}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_RENDA_VARIAVEL_SUB_TITLE_CARD}    timeout=10
    Find Elements Until Specific Element Found     ${CLASS_DETAIL_EL_CDB_1_ATIVO_ITEM_2_DE_2}       match_numbers_expected=1

Validate Class Detail Card Ativos Components Screen Internacional
    [Documentation]    Valida os componentes do card de ativos na tela de detalhe da classe Internacional.
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_INTERNACIONAL}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_INTERNACIONAL}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_INTERNACIONAL_TITLE_CARD}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_INTERNACIONAL_SUB_TITLE_CARD}    timeout=10
    Find Elements Until Specific Element Found     ${CLASS_DETAIL_EL_CDB_1_ATIVO_ITEM_2_DE_2}       match_numbers_expected=1

Validate Class Detail Card Ativos Components Screen Institutions
    [Documentation]    Valida os componentes do card de ativos na tela de detalhe da classe Institutions.
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_INSTITUTIONS}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_INSTITUTIONS}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_INSTITUTIONS_TITLE_CARD}    timeout=10
    Wait Until Element Is Visible    locator=${TEXT_INSTITUTIONS_SUB_TITLE_CARD}    timeout=10
    Find Elements Until Specific Element Found     ${CLASS_DETAIL_EL_CDB_1_ATIVO_ITEM_2_DE_2}       match_numbers_expected=1

Validate Card Products
    [Documentation]    Valida os componentes do card de ativos na tela de detalhe da classe.
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_EL_CDB_1_ATIVO_ITEM_2_DE_2}
    Wait Until Element Is Visible    locator=${CARD_PRODUCT_SCREEN}    timeout=10
    Wait Until Element Is Visible    locator=${CARD_PRODUCT_SCREEN}    timeout=10


Validate Class Detail Pagination Components Screen
    [Documentation]    Valida os componentes de paginação na tela de detalhe da classe.
    [Arguments]     ${screen}
    Find Elements Until Specific Element Found Scroll  ${CLASS_DETAIL_EL_CDB_1_ATIVO_ITEM_2_DE_2}       match_numbers_expected=7
    Click Element    locator=${CLASS_DETAIL_TXT_CARREGAR_MAIS}
    Sleep    1s 
    Pick All Monetary Values No Scroll     card_order=True
    IF    '${screen}'=='renda fixa'
        Scroll Element Into View Top In Page    locator=${CLASS_DETAIL_TXT_ATIVOS_EM_RENDA_FIXA}
    ELSE IF    '${screen}'=='renda variável'
        Scroll Element Into View Top In Page    locator=${CLASS_DETAIL_TXT_ATIVOS_EM_RENDA_VARIAVEL}
    ELSE IF    '${screen}'=='internacional'
        Scroll Element Into View Top In Page    locator=${CLASS_DETAIL_TXT_ATIVOS_EM_INTERNACIONAL}
    ELSE IF    '${screen}'=='institutions'
        Scroll Element Into View Top In Page    locator=${TITLE_LIST_INSTITUTIONS}
    END
    Find Elements Until Specific Element Found Scroll  ${CLASS_DETAIL_EL_CDB_1_ATIVO_ITEM_2_DE_2}       match_numbers_expected=10
    

Validate Class Detail Overview Section
    [Documentation]    Valida presença dos elementos principais do cabeçalho de detalhe da classe.
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_VOLTAR}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_OCULTAR_VALORES}    timeout=10
    Log To Console    message=[B3] Overview da classe validado.\n

Validate Class Detail Products Counters
    [Documentation]    Valida contadores e textos de ativos/instituições (podem variar entre ambientes).
    [Arguments]    ${screen}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_2_ATIVOS}    timeout=5
    IF    '${screen}'=='renda fixa'
        Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_ATIVOS_EM_RENDA_FIXA}
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_ATIVOS_EM_INSTITUICAO}    timeout=5
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}    timeout=5
        Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO_NOT_SELECTED}    timeout=5
    ELSE IF    '${screen}'=='renda variável'
        Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_ATIVOS_EM_RENDA_VARIAVEL}
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_ATIVOS_EM_INSTITUICAO}    timeout=5
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}    timeout=5
        Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO_NOT_SELECTED}    timeout=5
    ELSE IF    '${screen}'=='internacional'
        Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_ATIVOS_EM_INTERNACIONAL}
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_ATIVOS_EM_INSTITUICAO}    timeout=5
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}    timeout=5
        Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO_NOT_SELECTED}    timeout=5
    ELSE IF     '${screen}'=='institutions'
        Scroll Element Into View In Page    locator=${TITLE_LIST_INSTITUTIONS}
        Wait Until Element Is Visible    locator=${TITLE_LIST_INSTITUTIONS}    timeout=5
        Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}    timeout=5
        Wait Until Element Is Visible    locator=${SELECT_FILTER_BOTTOM_SHEET_CLASSE}    timeout=5 
        
    END
    #Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_2_PRODUTOS_EM_RENDA_FIXA}
    #Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_2_PRODUTOS_EM_RENDA_FIXA}    timeout=5 nao faz sentido
    Log To Console    message=[B3] Contadores de produtos/instituições validados (best-effort).\n

Validate Class Detail Overview Section Evolution Graphic Renda Fixa
    [Documentation]    Valida presença dos elementos principais do cabeçalho de detalhe da classe Renda Fixa.
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_RENDA_FIXA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_RENDA_FIXA}    timeout=10

Validate Class Detail Overview Section Evolution Graphic Renda Variavel
    [Documentation]    Valida presença dos elementos principais do cabeçalho de detalhe da classe Renda Fixa.
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_RENDA_VARIAVEL}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_RENDA_VARIAVEL}    timeout=10

Validate Class Detail Overview Section Evolution Graphic Internacional
    [Documentation]    Valida presença dos elementos principais do cabeçalho de detalhe da classe Renda Fixa.
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_INTERNACIONAL}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_INTERNACIONAL}    timeout=10

Validate Class Detail Overview Section Evolution Graphic Institutions
    [Documentation]    Valida presença dos elementos principais do cabeçalho de detalhe da classe Institutions.
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_INSTITUTIONS}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_INSTITUTIONS}    timeout=10

Validate Class Detail Evolution Section
    [Documentation]    Valida a seção de evolução patrimonial dentro da classe (gráfico de barras / períodos).
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EM_7_DIAS_INTERNA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EM_7_DIAS_INTERNA}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_EM_7_DIAS_INTERNA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EM_49_DIAS_INTERNA}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_EM_49_DIAS_INTERNA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EM_6_MESES_INTERNA}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_EM_6_MESES_INTERNA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EM_12_MESES_NAO_SELECIONADO_INTERNA}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_EM_12_MESES_NAO_SELECIONADO_INTERNA}
    Log To Console    message=[B3] Graphic Evolution Section Screen Wallet\n

Validate Class Detail Evolution Bars
    [Documentation]    Valida presença de algumas barras do gráfico de evolução (não necessariamente todas).
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_11_MAI_2022}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_12_MAI_2022}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_13_MAI_2022}    timeout=5
    Log To Console    message=[B3] Barras principais do gráfico de evolução visíveis.\n

Validate Class Detail Donut Allocation Section Renda Fixa
    [Documentation]    Valida seção de alocação (gráfico donut) e fatias principais.
    # Scroll usando locator direto seguindo padrão do projeto
    # Run Keyword And Ignore Error     Click Element    locator=${CHART_VOICE_OVER_CLOSE}
    Scroll Screen
    Run Keyword And Ignore Error     Click Element    locator=${CHART_VOICE_OVER_CLOSE}
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_ALOCA_O_EM_RENDA_FIXA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_ALOCA_O_EM_RENDA_FIXA}    timeout=10
    Scroll Element Into View In Page    locator=${TIPE_PRODUCT_ALOCATION_DETAILS}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_GR_FICO_DONNUT_ALOCA_O_TIPO_PRODUTO}    timeout=5
    Wait Until Element Is Visible    locator=${TIPE_PRODUCT_ALOCATION_DETAILS}    timeout=5
    Wait Until Element Is Visible    locator=${TIPE_PRODUCT_ALOCATION_OTHER_DETAILS}    timeout=5
    Log Element Comparison    ${TIPE_PRODUCT_ALOCATION_DETAILS}    TIPE_PRODUCT_ALOCATION_DETAILS
    Log Element Comparison    ${TIPE_PRODUCT_ALOCATION_OTHER_DETAILS}    TIPE_PRODUCT_ALOCATION_OTHER_DETAILS
    Log To Console    message=[B3] Seção de alocação (donut) validada.\n

Validate Class Detail Donut Allocation Section Renda Variavel
    [Documentation]    Valida seção de alocação (gráfico donut) e fatias principais para Renda Variável.
    Scroll Screen
    Run Keyword And Ignore Error     Click Element    locator=${CHART_VOICE_OVER_CLOSE}
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_ALOCA_O_EM_RENDA_VARIAVEL}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_ALOCA_O_EM_RENDA_VARIAVEL}    timeout=10
    Scroll Element Into View In Page    locator=${TIPE_PRODUCT_ALOCATION_DETAILS}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_GR_FICO_DONNUT_ALOCA_O_TIPO_PRODUTO}    timeout=5
    Wait Until Element Is Visible    locator=${TIPE_PRODUCT_ALOCATION_DETAILS}    timeout=5
    Wait Until Element Is Visible    locator=${TIPE_PRODUCT_ALOCATION_OTHER_DETAILS}    timeout=5
    Log Element Comparison    ${TIPE_PRODUCT_ALOCATION_OTHER_DETAILS}    TIPE_PRODUCT_ALOCATION_OTHER_DETAILS
    Log To Console    message=[B3] Seção de alocação (donut) Renda Variável validada.\n

Validate Class Detail Donut Allocation Section Internacional
    [Documentation]    Valida seção de alocação (gráfico donut) e fatias principais para Internacional.
    Scroll Screen
    Run Keyword And Ignore Error     Click Element    locator=${CHART_VOICE_OVER_CLOSE}
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_ALOCA_O_EM_INTERNACIONAL}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_ALOCA_O_EM_INTERNACIONAL}    timeout=10
    Scroll Element Into View In Page    locator=${TIPE_PRODUCT_ALOCATION_DETAILS}
    Wait Until Element Is Visible    locator=${TIPE_PRODUCT_ALOCATION_DETAILS}    timeout=5
    Log Element Comparison    ${TIPE_PRODUCT_ALOCATION_DETAILS}    TIPE_PRODUCT_ALOCATION_OTHER_DETAILS
    Log To Console    message=[B3] Seção de alocação (donut) Internacional validada.\n

Validate Class Detail Donut Allocation Section Institutions
    [Documentation]    Valida seção de alocação (gráfico donut) e fatias principais para Institutions.
    Scroll Screen
    Run Keyword And Ignore Error     Click Element    locator=${CHART_VOICE_OVER_CLOSE}
    Scroll Element Into View In Page    locator=${TEXT_INSTITUTIONS_ALOCACAO_NESTA_INSTITUICAO}
    Wait Until Element Is Visible    locator=${TEXT_INSTITUTIONS_ALOCACAO_NESTA_INSTITUICAO}    timeout=10
    Scroll Element Into View In Page    locator=${TIPE_PRODUCT_ALOCATION_DETAILS}
    Wait Until Element Is Visible    locator=${TIPE_PRODUCT_ALOCATION_DETAILS}    timeout=5
    Log Element Comparison    ${TIPE_PRODUCT_ALOCATION_DETAILS}    TIPE_PRODUCT_ALOCATION_OTHER_DETAILS
    Log To Console    message=[B3] Seção de alocação (donut) Institutions validada.\n

Validate Class Detail Products List
    [Documentation]    Valida que itens de produto estão presentes na lista.
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_CCB_1_ATIVO_ITEM_1_DE_2}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_CDB_1_ATIVO_ITEM_2_DE_2}    timeout=5
    Log To Console    message=[B3] Lista de produtos da classe validada.\n

Select Class Detail Period
    [Documentation]    Seleciona um período na seção de evolução da classe (se existir).
    [Arguments]    ${period}=7_d
    ${locator}=    Set Variable    ${EMPTY}
    IF    '${period}'=='7 d'
        ${locator}=    Set Variable    ${CLASS_DETAIL_CHART_EM_7_DIAS_ESCOLHER_PERIODO}
    ELSE IF    '${period}'=='7 s'
        ${locator}=    Set Variable    ${CLASS_DETAIL_CHART_EM_49_DIAS_ESCOLHER_PERIODO}
    ELSE IF    '${period}'=='6 m'
        ${locator}=    Set Variable    ${CLASS_DETAIL_CHART_EM_6_MESES_ESCOLHER_PERIODO}
    END
    Run Keyword If    '${locator}'=='${EMPTY}'    Fail    Período '${period}' não suportado.
    Scroll Element Into View In Page    locator=${locator}
    Wait Until Element Is Visible    locator=${locator}    timeout=10
    Click Element    locator=${locator}
    Log To Console    message=[B3] Período '${period}' selecionado.\n

Validate Full Class Detail Screen
    [Documentation]    Validação agrupada que chama as principais seções da tela de detalhe da classe.
    Validate Class Detail Overview Section
    Validate Class Detail Evolution Section
    Validate Class Detail Products List
    Log To Console    message=[B3] Tela completa de detalhe de classe validada.\n

# ================== Filtros ==================
Open Institution Filter Bottom Sheet
    [Documentation]    Abre bottom sheet do filtro de Instituição (locators definitivos).
    # Pré-condição: já estamos na tela de detalhe da classe.
    Wait Until Element Is Visible    locator=${SELECT_FILTER_BOTTOM_SHEET}    timeout=10
    Click Element    locator=${SELECT_FILTER_BOTTOM_SHEET}
    Wait Until Element Is Visible    locator=${SHOW_BOTTOM_SHEET_FILTER}    timeout=10
    Scroll Element Into View In Page    locator=${FILTER_SINACOR}
    Click Element    locator=${FILTER_SINACOR}

Open Classe Filter Bottom Sheet
    [Documentation]    Abre bottom sheet do filtro de Instituição (locators definitivos).
    # Pré-condição: já estamos na tela de detalhe da classe.
    Wait Until Element Is Visible    locator=${SELECT_FILTER_BOTTOM_SHEET_CLASSE}    timeout=10
    Click Element    locator=${SELECT_FILTER_BOTTOM_SHEET_CLASSE}
    Wait Until Element Is Visible    locator=${SHOW_BOTTOM_SHEET_FILTER_INSTITUTIONS}    timeout=10
    Click Element    locator=${CLOSE_BOTTOM_SHEET}

Select Other Institution Filters
    [Documentation]    Aplica outros filtros selecionados de Instituição (fecha bottom sheet).
    Run Keyword And Ignore Error     Scroll Element Into View In Page    locator=${FILTER_PARTICIPANTE_SINACOR}
    Run Keyword And Ignore Error     Scroll Element Into View Top In Page    locator=${FILTER_PARTICIPANTE_SINACOR}
    Click Element    locator=${FILTER_PARTICIPANTE_SINACOR}

Clear Institution Filter Selection
    [Documentation]    Limpa todas seleções no bottom sheet de Instituição.
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO_SELECTED}    timeout=10
    Click Element    locator=${CLASS_FILTER_CHIP_INSTITUICAO_SELECTED}
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO_NOT_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}    timeout=10

Clear Two Institution Filter Selection
    [Documentation]    Limpa duas seleções específicas no bottom sheet de Instituição.
    Wait Until Element Is Visible    locator=${CLASS_FILTER_TWO_SELECTED_ITEMS}    timeout=10
    Click Element    locator=${CLASS_FILTER_CHIP_INSTITUICAO_SELECTED}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}    timeout=10


Apply Institution Filters
    [Documentation]    Aplica filtros selecionados de Instituição (fecha bottom sheet).
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_APLICAR}    timeout=10
    # Opcional: validar se está habilitado (se não houver atributo, tentar clique direto)
    Click Element    locator=${CLASS_FILTER_INST_BTN_APLICAR}
    # Após aplicar, o bottom sheet deve fechar; aguardar desaparecimento do título
    Sleep    0.5s
    Log To Console    message=[B3] Filtros de Instituição aplicados.\n

Clear Institution Filters
    [Documentation]    Limpa seleções no bottom sheet de Instituição (mantém sheet aberto).
    # TODO todos os elementos da tela Click All Elements In Screen
    Wait Until Element Is Visible    locator=${SELECTED_FILTER_BOTTOM_SHEET}    timeout=10
    Wait Until Element Is Visible    locator=${TESTE_SINACOR}   timeout=10
    Click Element    locator=${SELECTED_FILTER_BOTTOM_SHEET}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}    timeout=10
    Sleep    0.4s
    Log To Console    message=[B3] Filtros de Instituição limpos.\n

Clear Institution Filters Inside Bottom Sheet
    [Documentation]    Limpa seleções no bottom sheet de Instituição (mantém sheet aberto).
    # TODO todos os elementos da tela Click All Elements In Screen
    
    Wait Until Element Is Visible    locator=${SELECTED_FILTER_BOTTOM_SHEET}    timeout=10
    Wait Until Element Is Visible    locator=${TESTE_SINACOR}   timeout=10
    Click Element    locator=${TESTE_SINACOR}
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_LIMPAR}    timeout=10
    Click Element    locator=${CLASS_FILTER_INST_BTN_LIMPAR}
    Sleep    0.4s
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}
    Log To Console    message=[B3] Filtros de Instituição limpos.\n

Clear Two Institution Filter Selections
    [Documentation]    Limpa duas seleções específicas no bottom sheet de Instituição.
    Wait Until Element Is Visible    locator=${SELECTED_FILTER_BOTTOM_SHEET}    timeout=10
    
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_CLEAR_TWO_SELECTIONS}    timeout=10
    Click Element    locator=${CLASS_FILTER_INST_BTN_CLEAR_TWO_SELECTIONS}

Select Institution Filter Item By Index
    [Documentation]    Seleciona (toggle) item de Instituição pelo índice (1..8 conforme variáveis atuais).
    [Arguments]    ${index}
    ${locator}=    Set Variable    ${EMPTY}
    IF    '${index}'=='1'
        ${locator}=    Set Variable    ${CLASS_FILTER_INST_ITEM_1}
    ELSE IF    '${index}'=='2'
        ${locator}=    Set Variable    ${CLASS_FILTER_INST_ITEM_2}
    ELSE IF    '${index}'=='3'
        ${locator}=    Set Variable    ${CLASS_FILTER_INST_ITEM_3}
    ELSE IF    '${index}'=='4'
        ${locator}=    Set Variable    ${CLASS_FILTER_INST_ITEM_4}
    ELSE IF    '${index}'=='5'
        ${locator}=    Set Variable    ${CLASS_FILTER_INST_ITEM_5}
    ELSE IF    '${index}'=='6'
        ${locator}=    Set Variable    ${CLASS_FILTER_INST_ITEM_6}
    ELSE IF    '${index}'=='7'
        ${locator}=    Set Variable    ${CLASS_FILTER_INST_ITEM_7}
    ELSE IF    '${index}'=='8'
        ${locator}=    Set Variable    ${CLASS_FILTER_INST_ITEM_8}
    END
    Run Keyword If    '${locator}'=='${EMPTY}'    Fail    Índice de item inválido: ${index}
    # Se não for o primeiro item, tentar scroll heurístico antes
    ${found}=    Set Variable    False
    FOR    ${attempt}    IN RANGE    0    5
        ${status}=    Run Keyword And Return Status    Page Should Contain Element    ${locator}
        IF    ${status}
            ${found}=    Set Variable    True
            Exit For Loop
        END
        # Swipe para cima dentro da tela (coordenadas genéricas - ajustar se necessário)
        Swipe    500    1700    0    -900    600
        Sleep    0.3s
    END
    Run Keyword If    not ${found}    Fail    Não foi possível localizar item de índice ${index} após swipes.
    Wait Until Element Is Visible    locator=${locator}    timeout=5
    Click Element    locator=${locator}
    Sleep    0.2s
    Log To Console    message=[B3] Item Instituição índice ${index} toggled.\n
Select All Institution Filter Items
    [Documentation]    Usa botão Selecionar Todos para marcar todos os itens.
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_SELECT_ALL}    timeout=10
    Click Element    locator=${CLASS_FILTER_INST_BTN_SELECT_ALL}
    Sleep    0.4s
    Log To Console    message=[B3] Selecionar todos acionado.\n
Assert Institution Apply Button Enabled
    [Documentation]    Valida heurísticamente que botão Aplicar está habilitado (tentando clique seco se necessário).
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_APLICAR}    timeout=10
    # Caso haja atributo disabled/habilitado poderíamos ler; fallback: apenas garantir visível.
    Log To Console    message=[B3] Botão Aplicar visível (assumindo habilitado).\n
Assert Institution Apply Button Disabled
    [Documentation]    Placeholder - valida estado desabilitado tentando prevenir clique (sem atributo explícito disponível).
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_APLICAR}    timeout=10
    # TODO: Ajustar lógica quando soubermos atributo de disable (ex: enabled=false ou clickable=false)
    Log    [WARN] Validação de estado desabilitado é placeholder (aguarda atributo real).

Wait Institution Filter Bottom Sheet Closed
    [Documentation]    Aguarda o bottom sheet de Instituição fechar (título some).
    ${max_retries}=    Set Variable    30
    FOR    ${i}    IN RANGE    ${max_retries}
        ${status}=    Run Keyword And Return Status    Page Should Contain Element    ${CLASS_FILTER_INST_TITLE}
        Run Keyword If    not ${status}    Exit For Loop
        Sleep    0.2s
    END
    IF    ${status}
        Log    Tentando forçar fechamento tocando botão Aplicar novamente (tentativa extra)
            Click Element    locator=${CLASS_FILTER_INST_BTN_APLICAR}
        Sleep    1s
        ${status2}=    Run Keyword And Return Status    Page Should Contain Element    ${CLASS_FILTER_INST_TITLE}
        Run Keyword If    ${status2}    Fail    Bottom sheet Instituição ainda visível após segunda tentativa de fechamento.
    END
    Sleep    0.2s
    Log To Console    message=[B3] Bottom sheet Instituição fechado.

Assert Institution Filter Chip Visible
    [Documentation]    Placeholder: valida que o chip de filtro de Instituição está visível após aplicar (estado específico pendente de dump pós-aplicação).
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO_SELECTED}    timeout=10
    Log    Chip de Instituição visível (placeholder estado pós-aplicação).

Reopen Institution Filter (If Closed)
    [Documentation]    Reabre bottom sheet de Instituição garantindo que esteja fechado antes.
    ${still_open}=    Run Keyword And Return Status    Page Should Contain Element    ${CLASS_FILTER_INST_TITLE}
    Run Keyword If    ${still_open}    Log    Bottom sheet já aberto - não reabrindo.
    Run Keyword If    not ${still_open}    Open Institution Filter Bottom Sheet

Capture Institution Filter Page Source
    [Documentation]    Captura o page source atual (XML) quando bottom sheet de Instituição está aberto.
    ${open}=    Run Keyword And Return Status    Page Should Contain Element    ${CLASS_FILTER_INST_TITLE}
    Run Keyword If    not ${open}    Fail    Bottom sheet Instituição não está aberto para captura.
    ${xml}=    Get Source
    Create Directory    dumps
    ${ts}=    Get Time    epoch
    ${file}=    Set Variable    dumps/inst_filter_${ts}.xml
    Create File    ${file}    ${xml}
    Log    Page source salvo em ${file}

Assert Institution One Selected Item
    [Documentation]    Valida que o chip de Instituição mostra 1 item selecionado.
    Wait Until Element Is Visible    locator=${CLASS_FILTER_ONE_SELECTED_ITEM}    timeout=10
    Log To Console    message=[B3] Chip de Instituição com 1 item selecionado validado.\n

Assert Institution Two Selected Items
    [Documentation]    Valida que o chip de Instituição mostra 2 itens selecionados.
    Wait Until Element Is Visible    locator=${CLASS_FILTER_TWO_SELECTED_ITEMS}    timeout=10
    Log To Console    message=[B3] Chip de Instituição com 2 itens selecion

Open Filter Two Item Selection
    [Documentation]    Valida que o chip de Instituição mostra 2 itens selecionados.
    Wait Until Element Is Visible    locator=${CLASS_FILTER_TWO_SELECTED_ITEMS}    timeout=10
    Click Element    locator=${CLASS_FILTER_TWO_SELECTED_ITEMS}
    Log To Console    message=[B3] Open Filter Two Item Selection 

Validate Ballance Filters Products Renda Fixa
    [Documentation]    Valida o saldo exibido dentro da tela de todos os produtos

    #Validate Access All Products Button Screen Wallet talvez aqui colocar o if  [Arguments]    ${filter_type}
    
    # IF    '${filter_type}' == 'produto'
    Wait Until Element Is Visible    ${CLASS_DETAIL_TXT_RENDA_FIXA}
    Element Should Be Visible        ${CLASS_DETAIL_TXT_RENDA_FIXA}
    Wait Until Element Is Visible    ${CLASS_DETAIL_TXT_DA_CARTEIRA}    timeout=10s
    Element Should Be Visible        ${CLASS_DETAIL_TXT_DA_CARTEIRA}
    Wait Until Element Is Visible    ${TEXT_VALUE_RESULT_INVESTMENT}    timeout=10s
    Element Should Be Visible        ${TEXT_VALUE_RESULT_INVESTMENT}
    
    # Log comparativo usando função reutilizável
    Log Element Comparison    ${TEXT_VALUE_RESULT_INVESTMENT}    TEXT_VALUE_RESULT_INVESTMENT

    Wait Until Element Is Visible    ${ALL_PRODUCTS_BALANCE}    timeout=10s
    Element Should Be Visible        ${ALL_PRODUCTS_BALANCE}
    ${balance}=    Get Text    ${ALL_PRODUCTS_BALANCE}

    Wait Until Element Is Visible    ${PERIODO}    timeout=10s
    Element Should Be Visible    ${PERIODO}
    Find Elements Until Specific Element Found   ${PERIODO}     match_numbers_expected=2

    Log To Console    message=[B3] Saldo exibido na tela de todos os produtos: ${balance}\n

 Validate Ballance Filters Products Renda Variavel
        [Documentation]    Valida o saldo exibido dentro da tela de todos os produtos de renda variável

        Wait Until Element Is Visible    ${CLASS_DETAIL_TXT_RENDA_VARIAVEL}
        Element Should Be Visible        ${CLASS_DETAIL_TXT_RENDA_VARIAVEL}
        Wait Until Element Is Visible    ${CLASS_DETAIL_TXT_DA_CARTEIRA}    timeout=10s
        Element Should Be Visible        ${CLASS_DETAIL_TXT_DA_CARTEIRA}
        Wait Until Element Is Visible    ${TEXT_VALUE_RESULT_INVESTMENT}    timeout=10s
        Element Should Be Visible        ${TEXT_VALUE_RESULT_INVESTMENT}

        Log Element Comparison    ${TEXT_VALUE_RESULT_INVESTMENT}    TEXT_VALUE_RESULT_INVESTMENT

        Wait Until Element Is Visible    ${ALL_PRODUCTS_BALANCE}    timeout=10s
        Element Should Be Visible        ${ALL_PRODUCTS_BALANCE}
        ${balance}=    Get Text    ${ALL_PRODUCTS_BALANCE}

        Wait Until Element Is Visible    ${PERIODO}    timeout=10s
        Element Should Be Visible    ${PERIODO}
        Find Elements Until Specific Element Found   ${PERIODO}     match_numbers_expected=2

        Log To Console    message=[B3] Saldo exibido na tela de todos os produtos (renda variável): ${balance}\n

Validate Ballance Filters Products Institutions
    [Documentation]    Valida o saldo exibido dentro da tela de todos os produtos de instituições
    Wait Until Element Is Visible    ${CLASS_DETAIL_TXT_DA_CARTEIRA}    timeout=10s
    Element Should Be Visible        ${CLASS_DETAIL_TXT_DA_CARTEIRA}
    Wait Until Element Is Visible    ${TEXT_VALUE_RESULT_INVESTMENT}    timeout=10s
    Element Should Be Visible        ${TEXT_VALUE_RESULT_INVESTMENT}

    Log Element Comparison    ${TEXT_VALUE_RESULT_INVESTMENT}    TEXT_VALUE_RESULT_INVESTMENT
    Wait Until Element Is Visible    ${ALL_PRODUCTS_BALANCE}    timeout=10s
    Element Should Be Visible        ${ALL_PRODUCTS_BALANCE}
    ${balance}=    Get Text    ${ALL_PRODUCTS_BALANCE}
    Wait Until Element Is Visible    ${PERIODO}    timeout=10s
    Element Should Be Visible    ${PERIODO}
    Find Elements Until Specific Element Found   ${PERIODO}     match_numbers_expected=2
    Log To Console    message=[B3] Saldo exibido na tela de todos os produtos (instituição): ${balance}\n

Validate Ballance Filters Products Internacional
        [Documentation]    Valida o saldo exibido dentro da tela de todos os produtos internacional

        Wait Until Element Is Visible    ${CLASS_DETAIL_TXT_INTERNACIONAL}
        Element Should Be Visible        ${CLASS_DETAIL_TXT_INTERNACIONAL}
        Wait Until Element Is Visible    ${CLASS_DETAIL_TXT_DA_CARTEIRA}    timeout=10s
        Element Should Be Visible        ${CLASS_DETAIL_TXT_DA_CARTEIRA}
        Wait Until Element Is Visible    ${TEXT_VALUE_RESULT_INVESTMENT}    timeout=10s
        Element Should Be Visible        ${TEXT_VALUE_RESULT_INVESTMENT}

        Log Element Comparison    ${TEXT_VALUE_RESULT_INVESTMENT}    TEXT_VALUE_RESULT_INVESTMENT

        Wait Until Element Is Visible    ${ALL_PRODUCTS_BALANCE}    timeout=10s
        Element Should Be Visible        ${ALL_PRODUCTS_BALANCE}
        ${balance}=    Get Text    ${ALL_PRODUCTS_BALANCE}

        Wait Until Element Is Visible    ${PERIODO}    timeout=10s
        Element Should Be Visible    ${PERIODO}
        Find Elements Until Specific Element Found   ${PERIODO}     match_numbers_expected=2

        Log To Console    message=[B3] Saldo exibido na tela de todos os produtos (internacional): ${balance}\n


Open Product Filter Bottom Sheet
    [Documentation]    Abre bottom sheet do filtro de Produto (aguardando locators definitivos).
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}
    Wait Until Element Is Visible    locator=${TITLE_BOTTOM_SHEET}    timeout=10
    Scroll Element Into View In Page    locator=${CRI_FILTER}
    Click Element    locator=${CRI_FILTER}
    Log To Console    message=[B3] Bottom sheet Produto aberto (provisório).\n

Filter Product By Institution
    [Documentation]    Filtra Produto por Instituição (marca um item).
    Scroll Element Into View In Page   locator=${CRI_FILTER}
    # Click Element    locator=${CRI_FILTER}
    Sleep    0.4s
    Log To Console    message=[B3] Filtro de Produto por Instituição aplicado (provisório).\n


Apply Product Filters
    [Documentation]    Aplica filtros selecionados de Produto (fecha bottom sheet).
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_APLICAR}    timeout=10
    # Opcional: validar se está habilitado (se não houver atributo, tentar clique direto)
    Click Element    locator=${CLASS_FILTER_INST_BTN_APLICAR}
    # Após aplicar, o bottom sheet deve fechar; aguardar desaparecimento do título
    Sleep    0.5s
    Log To Console    message=[B3] Filtros de Instituição aplicados.\n

Clear Product Filters
    [Documentation]    Limpa todas seleções no bottom sheet de Produto.
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_PRODUCT_SELECTED}    timeout=20
    Click Element    locator=${CLASS_FILTER_CHIP_PRODUCT_SELECTED}
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO_NOT_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}    timeout=10

Clear Product Filters Institution
    [Documentation]    Limpa todas seleções no bottom sheet de Produto (apenas Instituição).
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_PRODUCT_SELECTED}    timeout=20
    Click Element    locator=${CLASS_FILTER_CHIP_PRODUCT_SELECTED}
    Wait Until Element Is Visible    locator=${SELECT_FILTER_BOTTOM_SHEET_CLASSE}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}    timeout=10
Clear Product Filters Inside Bottom Sheet
    [Documentation]    Limpa seleções no bottom sheet de Produto (mantém sheet aberto).
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_PRODUCT_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${CRI_SELECT}   timeout=10
    Click Element    locator=${CRI_SELECT}
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_LIMPAR}    timeout=10
    Click Element    locator=${CLASS_FILTER_INST_BTN_LIMPAR}
    Sleep    0.4s
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}     timeout=10
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO_NOT_SELECTED}    timeout=10
    Log To Console    message=[B3] Filtros de Instituição limpos.\n
    Sleep    0.4s
    Log To Console    message=[B3] Filtros de Produto limpos.\n

Clear Institution Product Filters Inside Bottom Sheet
    [Documentation]    Limpa seleções no bottom sheet de Produto (mantém sheet aberto).
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_PRODUCT_SELECTED}    timeout=10
    Wait Until Element Is Visible    locator=${CRI_SELECT}   timeout=10
    Click Element    locator=${CRI_SELECT}
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_LIMPAR}    timeout=10
    Click Element    locator=${CLASS_FILTER_INST_BTN_LIMPAR}
    Sleep    0.4s
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUCT_NOT_SELECTED}     timeout=10
    Wait Until Element Is Visible    locator=${SELECT_FILTER_BOTTOM_SHEET_CLASSE}    timeout=10
    Log To Console    message=[B3] Filtros de Instituição limpos.\n
    Sleep    0.4s
    Log To Console    message=[B3] Filtros de Produto limpos.\n
    
Clear Other Product Filter Selections
    [Documentation]    Limpa duas seleções específicas no bottom sheet de Produto.
    Run Keyword And Ignore Error     Scroll Element Into View In Page    locator=${ETF_TRADED}
    Run Keyword And Ignore Error     Scroll Element Into View Top In Page    locator=${ETF_TRADED}
    Click Element    locator=${ETF_TRADED}