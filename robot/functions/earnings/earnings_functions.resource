*** Settings ***
Documentation    Proventos Functions
Resource    ../../screens/earnings/earnings_screen.resource

*** Keywords ***

Navigation To My Earnings Screen
    [Documentation]    Navega para a tela de meus proventos.
    Navigation To My Earnings 

Validate Proventos Header Screen
    [Documentation]    Valida os elementos principais do cabeçalho dos proventos.
    Validate Proventos Header

Validate Proventos Graph Screen
    [Documentation]    Valida os elementos do gráfico de proventos.
    Validate Earnings Graph

Validate Proventos Received Item Screen
    [Documentation]    Valida os elementos do gráfico de proventos a receber.
    Validate Proventos Received Item

Validate Load More Button Proventos Received Item Screen
    [Documentation]    Valida o botão de carregar mais itens na tela de proventos a receber.
    Validate Load More Button Proventos Received Item

Validate Load More Updates Date List Screen
    [Documentation]    Valida se a data dos itens de proventos a receber é atualizada após clicar no botão de carregar mais.
    Validate Load More Updates Date List

Validate Mis Date Screen
    [Documentation]    Valida se a data dos itens de proventos a receber é atualizada após clicar no botão de carregar mais.
    Validate Mis Date

Validate Proventos Available Soon Text Screen
    [Documentation]    Valida se o texto de proventos disponíveis em breve é exibido quando não há proventos registrados.
    Validate Proventos Available Soon Text