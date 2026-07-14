*** Settings ***
Documentation    Proventos Functions
Resource    ../../screens/earnings/earnings_filter_screen.resource

*** Keywords ***

Validate Earnings Filter Main Options Screen
	[Documentation]    Executa a validação de existência dos filtros principais da tela de filtrar proventos recebidos.
	Validate Earnings Filter Main Options

Validate Earnings Date Filter Bottom Sheet Screen
	[Documentation]    Executa a validação do filtro de data na tela de filtrar proventos recebidos.
	Validate Earnings Date Filter Bottom Sheet

Validate Earnings Event Filter Bottom Sheet Screen
	[Documentation]    Executa a validação do filtro de tipo de evento na tela de filtrar proventos recebidos.
	Validate Earnings Event Filter Bottom Sheet
	Validate Earnings Event Filter Bottom Sheet Select All
	Validate Earnings Event Filter Bottom Sheet Close Button Dont Change Selection

Validate Earnings Institution Filter Bottom Sheet Screen
	[Documentation]    Executa a validação do filtro de instituição na tela de filtrar proventos recebidos.
	Validate Earnings Institution Filter Bottom Sheet
	Validate Earnings Institution Filter Bottom Sheet Select All
	Validate Earnings Institution Filter Bottom Sheet Close Button Dont Change Selection
	

Validate Earnings All Periods Date Filter Bottom Sheet Screen
	[Documentation]    Executa a validação do sub-filtro "Todos os períodos" no bottom sheet de data de proventos recebidos.
	Validate Earnings 30 Days Date Filter Bottom Sheet
	Validate Earnings 3 Months Date Filter Bottom Sheet
	Validate Earnings 6 Months Date Filter Bottom Sheet
	Validate Earnings 12 Months Date Filter Bottom Sheet
	Validate D-1 Date Button Is Visible In Date Filter

Validate Earnings Investment Filter Bottom Sheet Screen
	[Documentation]    Executa a validação do filtro de tipo de investimento na tela de filtrar proventos recebidos.
	Validate Earnings Investment Filter Bottom Sheet
	Validate Earnings Investment Filter Bottom Sheet Select All
	Validate Earnings Investment Filter Bottom Sheet Close Button Dont Change Selection
