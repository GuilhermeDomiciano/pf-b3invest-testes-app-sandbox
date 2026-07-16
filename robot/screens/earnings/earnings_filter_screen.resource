*** Settings ***
Documentation    Proventos Screen - Validações de elementos dos proventos
Library    AppiumLibrary
Library    OperatingSystem
Library    DateTime
Library    String
Library    Collections
Resource    ../../../resource/utils/element_utils.resource
Resource    ../../base.resource
Variables    ../../elements/earnings_filter.yaml
*** Keywords ***

Validate Earnings Filter Main Options
	[Documentation]    Valida a existência dos filtros principais da tela de filtrar proventos recebidos (IDs das linhas 2 a 10 do arquivo de elementos).
	Wait Until Element Is Visible    locator=${TEXT_FILTRAR_PROVENTOS_RECEBIDOS}    timeout=10
	Element Should Be Visible    locator=${TEXT_FILTRAR_PROVENTOS_RECEBIDOS}

	Wait Until Element Is Visible    locator=${BTN_PERIODO_NAO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_PERIODO_NAO_SELECIONADO}

	Wait Until Element Is Visible    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}


	Wait Until Element Is Visible    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}


	Wait Until Element Is Visible    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}

Validate Earnings Date Filter Bottom Sheet
	[Documentation]    Valida a abertura do filtro de data e o fechamento do bottom sheet.
	Wait Until Element Is Visible    locator=${BTN_PERIODO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_PERIODO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_DATA}    timeout=10
	Element Should Be Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_DATA}
	Element Should Be Visible    locator=${BTN_FECHAR}
	Element Should Be Visible    locator=${BTN_ULTIMOS_30_DIAS}
	Element Should Be Visible    locator=${BTN_ULTIMOS_3_MESES}
	Click Element    locator=${BTN_ULTIMOS_3_MESES}
	Element Should Be Visible    locator=${BTN_ULTIMOS_3_MESES_SELECIONADO}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Element Should Be Visible    locator=${DIA_SELECIONADO}
	Wait Until Page Does Not Contain Element    locator=${BTN_PERIODO_NAO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_PERIODO_SELECIONADO}
	Click Element    locator=${BTN_PERIODO_SELECIONADO}

Validate Earnings Event Filter Bottom Sheet
	[Documentation]    Valida a abertura do filtro de tipo de evento e o fechamento do bottom sheet.
	Wait Until Element Is Visible    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_EVENTO}    timeout=10
	Element Should Be Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_EVENTO}
	Element Should Be Visible    locator=${BTN_FECHAR}
	Scroll Element Into View In Page   locator=${BTN_JUROS}
	Element Should Be Visible    locator=${BTN_JUROS}
	Click Element    locator=${BTN_JUROS}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Wait Until Page Does Not Contain Element    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_TIPO_DE_EVENTO_SELECIONADO}
	Element Should Be Visible    locator=${BTN_JUROS_SELECIONADO}
	Click Element    locator=${BTN_TIPO_DE_EVENTO_SELECIONADO}

Validate Earnings Event Filter Bottom Sheet Select All
	[Documentation]    Valida a abertura do filtro de tipo de evento, a seleção de todos os tipos e o fechamento do bottom sheet.
	Wait Until Element Is Visible    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_EVENTO}    timeout=10
	Element Should Be Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_EVENTO}
	Element Should Be Visible    locator=${BTN_FECHAR}
	Scroll Element Into View In Page   locator=${BTN_JUROS}
	Element Should Be Visible    locator=${BTN_JUROS}
	Wait Until Element Is Visible    locator=${BTN_SELECIONAR_TODOS}    timeout=10
	Click Element    locator=${BTN_SELECIONAR_TODOS}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Wait Until Page Does Not Contain Element    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_TIPO_DE_EVENTO_SELECIONADO}
	Element Should Be Visible    locator=${BTN_LIMPAR_FILTROS_SELECIONADO}
	Click Element    locator=${BTN_LIMPAR_FILTROS_SELECIONADO}
	Click Element    locator=${BTN_LIMPAR_FILTROS}
	Wait Until Element Is Visible    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}    timeout=10

Validate Earnings Event Filter Bottom Sheet Close Button Dont Change Selection
	[Documentation]    Valida que o botão de fechar do bottom sheet de tipo de evento não altera a seleção feita.
	Wait Until Element Is Visible    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_TIPO_DE_EVENTO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_EVENTO}    timeout=10
	Element Should Be Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_EVENTO}
	Element Should Be Visible    locator=${BTN_FECHAR}
	Scroll Element Into View In Page   locator=${BTN_JUROS}
	Element Should Be Visible    locator=${BTN_JUROS}
	Click Element    locator=${BTN_JUROS}
	Click Element    locator=${BTN_FECHAR}
	Wait Until Page Does Not Contain Element    locator=${BTN_TIPO_DE_EVENTO_SELECIONADO}    timeout=10
	Wait Until Page Does Not Contain Element    locator=${BTN_JUROS_SELECIONADO}    timeout=10


Validate Earnings Institution Filter Bottom Sheet
	[Documentation]    Valida a abertura do filtro de instituição e o fechamento do bottom sheet.
	Wait Until Element Is Visible    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_INSTITUTIONS}    timeout=10
	Element Should Be Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_INSTITUTIONS}
	Element Should Be Visible    locator=${BTN_FECHAR}
	Scroll Element Into View In Page   locator=${BTN_BANCO_DO_BRASIL}
	Element Should Be Visible    locator=${BTN_BANCO_DO_BRASIL}
	Click Element    locator=${BTN_BANCO_DO_BRASIL}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Wait Until Page Does Not Contain Element    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_INSTITUICAO_SELECIONADO}
	Click Element    locator=${BTN_INSTITUICAO_SELECIONADO}

Validate Earnings Institution Filter Bottom Sheet Select All
	[Documentation]    Valida a abertura do filtro de instituição, a seleção de todas as instituições e o fechamento do bottom sheet.
	Wait Until Element Is Visible    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_INSTITUTIONS}    timeout=10
	Element Should Be Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_INSTITUTIONS}
	Element Should Be Visible    locator=${BTN_FECHAR}
	Scroll Element Into View In Page   locator=${BTN_BANCO_DO_BRASIL}
	Element Should Be Visible    locator=${BTN_BANCO_DO_BRASIL}
	Wait Until Element Is Visible    locator=${BTN_SELECIONAR_TODOS}    timeout=10
	Click Element    locator=${BTN_SELECIONAR_TODOS}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Wait Until Page Does Not Contain Element    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}    timeout=10
	Wait Until Page Does Not Contain Element    locator=${BTN_LIMPAR_FILTROS_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_INSTITUICAO_SELECIONADO}
	Element Should Be Visible    locator=${BTN_LIMPAR_FILTROS_SELECIONADA}
	Click Element    locator=${BTN_LIMPAR_FILTROS_SELECIONADA}
	Click Element    locator=${BTN_LIMPAR_FILTROS}
	Wait Until Element Is Visible    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}    timeout=10

Validate Earnings Institution Filter Bottom Sheet Close Button Dont Change Selection
	[Documentation]    Valida que o botão de fechar do bottom sheet de instituição não altera a seleção feita.
	Wait Until Element Is Visible    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_INSTITUICAO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_INSTITUTIONS}    timeout=10
	Element Should Be Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_INSTITUTIONS}
	Element Should Be Visible    locator=${BTN_FECHAR}
	Scroll Element Into View In Page   locator=${BTN_BANCO_DO_BRASIL}
	Element Should Be Visible    locator=${BTN_BANCO_DO_BRASIL}
	Click Element    locator=${BTN_BANCO_DO_BRASIL}
	Click Element    locator=${BTN_FECHAR}
	Wait Until Page Does Not Contain Element    locator=${BTN_INSTITUICAO_SELECIONADO}    timeout=10

Validate Earnings Investment Filter Bottom Sheet
	[Documentation]    Valida a abertura do filtro de tipo de investimento e o fechamento do bottom sheet.
	Wait Until Element Is Visible    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_INVESTIMENTO}    timeout=10
	Element Should Be Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_INVESTIMENTO}
	Element Should Be Visible    locator=${BTN_FECHAR}
	Scroll Element Into View In Page   locator=${BTN_CDB}
	Element Should Be Visible    locator=${BTN_CDB}
	Click Element    locator=${BTN_CDB}
	# Element Should Be Visible    locator=${BTN_CDB_SELECIONADO}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Wait Until Page Does Not Contain Element    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_TIPO_DE_INVESTIMENTO_SELECIONADO}
	Click Element    locator=${BTN_TIPO_DE_INVESTIMENTO_SELECIONADO}

Validate Earnings Investment Filter Bottom Sheet Select All
	[Documentation]    Valida a abertura do filtro de tipo de investimento, a seleção de todos os tipos e o fechamento do bottom sheet.
	Wait Until Element Is Visible    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_INVESTIMENTO}    timeout=10
	Element Should Be Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_INVESTIMENTO}
	Element Should Be Visible    locator=${BTN_FECHAR}
	Scroll Element Into View In Page   locator=${BTN_CDB}
	Element Should Be Visible    locator=${BTN_CDB}
	Wait Until Element Is Visible    locator=${BTN_SELECIONAR_TODOS}    timeout=10
	Click Element    locator=${BTN_SELECIONAR_TODOS}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Wait Until Page Does Not Contain Element    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_TIPO_DE_INVESTIMENTO_SELECIONADO}
	Element Should Be Visible    locator=${BTN_LIMPAR_FILTROS_SELECIONADO}
	Click Element    locator=${BTN_LIMPAR_FILTROS_SELECIONADO}
	Click Element    locator=${BTN_LIMPAR_FILTROS}
	Wait Until Element Is Visible    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}    timeout=10

Validate Earnings Investment Filter Bottom Sheet Close Button Dont Change Selection
	[Documentation]    Valida que o botão de fechar do bottom sheet de tipo de investimento não altera a seleção feita.
	Wait Until Element Is Visible    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_TIPO_DE_INVESTIMENTO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_INVESTIMENTO}    timeout=10
	Element Should Be Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_TIPO_DE_INVESTIMENTO}
	Element Should Be Visible    locator=${BTN_FECHAR}
	Scroll Element Into View In Page   locator=${BTN_CDB}
	Element Should Be Visible    locator=${BTN_CDB}
	Click Element    locator=${BTN_CDB}
	Click Element    locator=${BTN_FECHAR}
	Wait Until Page Does Not Contain Element    locator=${BTN_TIPO_DE_INVESTIMENTO_SELECIONADO}    timeout=10

Validate Earnings 30 Days Date Filter Bottom Sheet
	[Documentation]    Valida o sub-filtro "Últimos 30 dias" no bottom sheet de data:
	...                - Opção disponível e selecionável
	...                - Apenas um campo de data exibido (não um range)
	...                - D-1 (data da última carga) ativa como valor padrão e limite máximo
	Wait Until Element Is Visible    locator=${BTN_PERIODO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_PERIODO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_DATA}    timeout=10
	Element Should Be Visible    locator=${BTN_ULTIMOS_30_DIAS}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Wait Until Element Is Visible    locator=${BTN_PERIODO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_PERIODO_SELECIONADO}
	Page Should Not Contain Element    locator=${BTN_PERIODO_NAO_SELECIONADO}
	Element Should Be Visible    locator=${BTN_PERIODO_SELECIONADO}
	Element Should Be Visible    locator=${DIA_SELECIONADO}
	Click Element    locator=${BTN_PERIODO_SELECIONADO}

Validate Earnings 3 Months Date Filter Bottom Sheet
	[Documentation]    Valida o sub-filtro "Últimos 3 meses" no bottom sheet de data:
	...                - Opção disponível e selecionável
	...                - Apenas um campo de data exibido (não um range)
	...                - D-1 (data da última carga) ativa como valor padrão e limite máximo
	Wait Until Element Is Visible    locator=${BTN_PERIODO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_PERIODO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_DATA}    timeout=10
	Element Should Be Visible    locator=${BTN_ULTIMOS_3_MESES}
	Click Element    locator=${BTN_ULTIMOS_3_MESES}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Wait Until Element Is Visible    locator=${BTN_PERIODO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_PERIODO_SELECIONADO}
	Page Should Not Contain Element    locator=${BTN_PERIODO_NAO_SELECIONADO}
	Element Should Be Visible    locator=${BTN_PERIODO_SELECIONADO}
	Element Should Be Visible    locator=${DIA_SELECIONADO}
	Click Element    locator=${BTN_PERIODO_SELECIONADO}

Validate Earnings 6 Months Date Filter Bottom Sheet
	[Documentation]    Valida o sub-filtro "Últimos 6 meses" no bottom sheet de data:
	...                - Opção disponível e selecionável
	...                - Apenas um campo de data exibido (não um range)
	...                - D-1 (data da última carga) ativa como valor padrão e limite máximo
	Wait Until Element Is Visible    locator=${BTN_PERIODO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_PERIODO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_DATA}    timeout=10
	Element Should Be Visible    locator=${BTN_ULTIMOS_6_MESES}
	Click Element    locator=${BTN_ULTIMOS_6_MESES}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Wait Until Element Is Visible    locator=${BTN_PERIODO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_PERIODO_SELECIONADO}
	Page Should Not Contain Element    locator=${BTN_PERIODO_NAO_SELECIONADO}
	Element Should Be Visible    locator=${BTN_PERIODO_SELECIONADO}
	Element Should Be Visible    locator=${DIA_SELECIONADO}
	Click Element    locator=${BTN_PERIODO_SELECIONADO}

Validate Earnings 12 Months Date Filter Bottom Sheet
	[Documentation]    Valida o sub-filtro "Últimos 12 meses" no bottom sheet de data:
	...                - Opção disponível e selecionável
	...                - Apenas um campo de data exibido (não um range)
	...                - D-1 (data da última carga) ativa como valor padrão e limite máximo
	Wait Until Element Is Visible    locator=${BTN_PERIODO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_PERIODO_NAO_SELECIONADO}
	Wait Until Element Is Visible    locator=${TILTE_BOTTOM_SHEET_FILTRO_DATA}    timeout=10
	Element Should Be Visible    locator=${BTN_ULTIMOS_12_MESES}
	Click Element    locator=${BTN_ULTIMOS_12_MESES}
	Click Element    locator=${BTN_APLICAR_FILTROS}
	Wait Until Element Is Visible    locator=${BTN_PERIODO_SELECIONADO}    timeout=10
	Element Should Be Visible    locator=${BTN_PERIODO_SELECIONADO}
	Page Should Not Contain Element    locator=${BTN_PERIODO_NAO_SELECIONADO}
	Element Should Be Visible    locator=${BTN_PERIODO_SELECIONADO}
	Element Should Be Visible    locator=${DIA_SELECIONADO}
	Click Element    locator=${BTN_PERIODO_SELECIONADO}



Validate D-1 Date Button Is Visible In Date Filter
	[Documentation]    Valida que o botão com a data D-1 (dia atual - 1) está visível no calendário do filtro.
	...                Exemplo: //android.widget.Button[@content-desc="28 de junho de 2026"]
	Wait Until Element Is Visible    locator=${BTN_PERIODO_NAO_SELECIONADO}    timeout=10
	Click Element    locator=${BTN_PERIODO_NAO_SELECIONADO}
	${meses}=    Create Dictionary
	...    1=janeiro    2=fevereiro    3=março    4=abril    5=maio    6=junho
	...    7=julho    8=agosto    9=setembro    10=outubro    11=novembro    12=dezembro
	${d1_raw}=    Get Current Date    increment=-1 day    result_format=%d/%m/%Y
	${partes}=    Split String    ${d1_raw}    /
	${dia}=    Convert To Integer    ${partes}[0]
	${mes_num}=    Evaluate    str(int('${partes}[1]'))
	${mes_nome}=    Get From Dictionary    ${meses}    ${mes_num}
	${ano}=    Set Variable    ${partes}[2]
	${d1_pt}=    Set Variable    ${dia} de ${mes_nome} de ${ano}
	Log To Console    message=[B3] Valor extraído: ${d1_pt}
	Wait Until Element Is Visible    locator=xpath=//android.widget.Button[@content-desc="${d1_pt}"]    timeout=10
	Element Should Be Visible    locator=xpath=//android.widget.Button[@content-desc="${d1_pt}"]