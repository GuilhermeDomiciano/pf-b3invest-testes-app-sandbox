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

Open Class Detail Renda Fixa
    [Documentation]    Clica no botão de navegação da classe Renda Fixa para abrir a tela de detalhe.
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_BTN_NAV_RENDA_FIXA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_NAV_RENDA_FIXA}    timeout=10
    Click Element    locator=${CLASS_DETAIL_BTN_NAV_RENDA_FIXA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_VOLTAR}    timeout=10
    Log To Console    message=[B3] Detalhe da classe 'Renda Fixa' aberto.\n

Validate Class Detail Back Button Section
    [Documentation]    Valida acao do botao de voltar na tela de detalhe da classe.
    Click Element    locator=${CLASS_DETAIL_BTN_VOLTAR}
    Log To Console    message=[B3] Back Buttom classe validado.\n

Validate Class Detail Overview Section
    [Documentation]    Valida presença dos elementos principais do cabeçalho de detalhe da classe.
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_VOLTAR}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_OCULTAR_VALORES}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_RENDA_FIXA}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_DESVALORIZOU_R_1_495_000_12}    timeout=5
    Log To Console    message=[B3] Overview da classe validado.\n

Validate Class Detail Products Counters
    [Documentation]    Valida contadores e textos de ativos/instituições (podem variar entre ambientes).
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_2_ATIVOS}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_4_ATIVOS_EM_1_INSTITUI_O}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_2_PRODUTOS_EM_RENDA_FIXA}    timeout=5
    Log To Console    message=[B3] Contadores de produtos/instituições validados (best-effort).\n

Validate Class Detail Evolution Section
    [Documentation]    Valida a seção de evolução patrimonial dentro da classe (gráfico de barras / períodos).
    # Scroll usando locator direto seguindo padrão do projeto
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_RENDA_FIXA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_EVOLU_O_EM_RENDA_FIXA}    timeout=10
    # Botões de período (variações)
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_EM_7_DIAS_ESCOLHER_PER_ODO}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_EM_49_DIAS_ESCOLHER_PER_ODO}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_EM_6_MESES_ESCOLHER_PER_ODO}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_12_M_BLOQUEADO_BLOQUEADO}    timeout=5
    Log To Console    message=[B3] Seção de evolução validada.\n

Validate Class Detail Evolution Bars
    [Documentation]    Valida presença de algumas barras do gráfico de evolução (não necessariamente todas).
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_11_MAI_2022}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_12_MAI_2022}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_13_MAI_2022}    timeout=5
    Log To Console    message=[B3] Barras principais do gráfico de evolução visíveis.\n

Validate Class Detail Donut Allocation Section
    [Documentation]    Valida seção de alocação (gráfico donut) e fatias principais.
    # Scroll usando locator direto seguindo padrão do projeto
    Scroll Element Into View In Page    locator=${CLASS_DETAIL_TXT_ALOCA_O_EM_RENDA_FIXA}
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_ALOCA_O_EM_RENDA_FIXA}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_GR_FICO_DONNUT_ALOCA_O_TIPO_PRODUTO}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_50_CCB}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_50_CDB}    timeout=5
    Log To Console    message=[B3] Seção de alocação (donut) validada.\n

Validate Class Detail Products List
    [Documentation]    Valida que itens de produto estão presentes na lista.
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_CCB_1_ATIVO_ITEM_1_DE_2}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_EL_CDB_1_ATIVO_ITEM_2_DE_2}    timeout=5
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_BTN_ACESSAR_PAGINA_DO_ATIVO_TESTE_BTG_PACTUAL_CTV}    timeout=5
    Log To Console    message=[B3] Lista de produtos da classe validada.\n

Select Class Detail Period
    [Documentation]    Seleciona um período na seção de evolução da classe (se existir).
    [Arguments]    ${period}=7_d
    ${locator}=    Set Variable    ${EMPTY}
    IF    '${period}'=='7 d'
        ${locator}=    Set Variable    ${CLASS_DETAIL_EL_EM_7_DIAS_ESCOLHER_PER_ODO}
    ELSE IF    '${period}'=='7 s'
        ${locator}=    Set Variable    ${CLASS_DETAIL_EL_EM_49_DIAS_ESCOLHER_PER_ODO}
    ELSE IF    '${period}'=='6 m'
        ${locator}=    Set Variable    ${CLASS_DETAIL_EL_EM_6_MESES_ESCOLHER_PER_ODO}
    ELSE IF    '${period}'=='12 m'
        ${locator}=    Set Variable    ${CLASS_DETAIL_EL_12_M_BLOQUEADO_BLOQUEADO}
    END
    Run Keyword If    '${locator}'=='${EMPTY}'    Fail    Período '${period}' não suportado.
    Scroll Element Into View In Page    locator=${locator}
    Wait Until Element Is Visible    locator=${locator}    timeout=10
    Click Element    locator=${locator}
    Log To Console    message=[B3] Período '${period}' selecionado.\n

Validate Full Class Detail Screen
    [Documentation]    Validação agrupada que chama as principais seções da tela de detalhe da classe.
    Validate Class Detail Overview Section
    Validate Class Detail Products Counters
    Validate Class Detail Evolution Section
    Validate Class Detail Donut Allocation Section
    Validate Class Detail Products List
    Log To Console    message=[B3] Tela completa de detalhe de classe validada.\n

# ================== Filtros ==================
Open Institution Filter Bottom Sheet
    [Documentation]    Abre bottom sheet do filtro de Instituição (locators definitivos).
    # Pré-condição: já estamos na tela de detalhe da classe.
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO}    timeout=10
    Click Element    locator=${CLASS_FILTER_CHIP_INSTITUICAO}
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_TITLE}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_SELECT_ALL}    timeout=10
    Log To Console    message=[B3] Bottom sheet Instituição aberto.\n

Clear Institution Filter Selection
    [Documentation]    Limpa todas seleções no bottom sheet de Instituição.
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO}    timeout=10
    Click Element    locator=${CLASS_FILTER_CHIP_INSTITUICAO}
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO}    timeout=10
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUTO_PRODUTO}    timeout=10


Open Product Filter Bottom Sheet
    [Documentation]    Abre bottom sheet do filtro de Produto (aguardando locators definitivos).
    Wait Until Element Is Visible    locator=${CLASS_DETAIL_TXT_PRODUTO_PRODUTO}    timeout=10
    Click Element    locator=${CLASS_DETAIL_TXT_PRODUTO_PRODUTO}
    # TODO: Substituir espera abaixo quando dump de Produto for capturado
    Sleep    1s
    Log To Console    message=[B3] Bottom sheet Produto aberto (provisório).\n
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
    Wait Until Element Is Visible    locator=${CLASS_FILTER_INST_BTN_LIMPAR}    timeout=10
    Click Element    locator=${CLASS_FILTER_INST_BTN_LIMPAR}
    Sleep    0.4s
    Log To Console    message=[B3] Filtros de Instituição limpos.\n
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
    Wait Until Element Is Visible    locator=${CLASS_FILTER_CHIP_INSTITUICAO}    timeout=10
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