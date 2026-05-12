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

Navigate To Radar Proventos Screen
    [Documentation]    Navega para a tela de radar de proventos.
    Navigate To Radar Proventos

Validate Popup Text Radar Proventos Close To Understand Screen
    [Documentation]    Valida se o texto de descrição do radar de proventos é exibido corretamente.
    Validate Popup Text Radar Proventos Close To Understand

Validate Popup Text Radar Proventos Close To Close Icon Screen
    [Documentation]    Valida se o texto de descrição do radar de proventos é exibido corretamente.
    Validate Popup Text Radar Proventos Close To Close Icon

Return To Login Keeping Session Screen
    [Documentation]    Retorna à tela de login mantendo a sessão do app aberta usando diferentes estratégias.
    Return To Login Keeping Session

Validate Text Radar Proventos Screen
    [Documentation]    Valida se o texto de descrição do radar de proventos é exibido corretamente.
    Validate Text Radar Proventos

Validate Text Bottom Sheet Radar Proventos Screen
    [Documentation]    Valida se o texto do bottom sheet do radar de proventos é exibido corretamente.
    Validate Text Bottom Sheet Radar Proventos

Validate Close Bottom Sheet Radar Proventos Screen
    [Documentation]    Valida se o bottom sheet do radar de proventos é fechado ao clicar fora da área do sheet.
    Validate Close Bottom Sheet Radar Proventos

Validate Scroll To close Icon Bottom Sheet Radar Proventos Screen
    [Documentation]    Valida se é possível rolar o conteúdo do bottom sheet do radar de proventos até o ícone de fechar.
    Validate Scroll To close Icon Bottom Sheet Radar Proventos

Validate Earnings Hide Graph Item Screen
    [Documentation]    Valida se o gráfico de proventos é ocultado ao clicar no botão de ocultar valores.
    Validate Earnings Hide Graph Item

Navigate To Receive Proventos Screen
    [Documentation]    Navega para a tela de proventos a receber.
    Navigate To Receive Proventos

Validate Proventos To Receive Header Screen
    [Documentation]    Valida os elementos principais do cabeçalho dos proventos a receber.
    Validate Proventos To Receive Header

Validate Earnings To Receive Graph Screen
    [Documentation]    Valida os elementos do gráfico de proventos a receber.
    Validate Earnings To Receive Graph

Validate Earnings To Receive Hide Graph Item Screen
    [Documentation]    Valida os elementos do item de proventos a receber.
    Validate Earnings To Receive Hide Graph Item