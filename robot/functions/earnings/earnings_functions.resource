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

Validate Radar Proventos Filter And Download Screen
    [Documentation]    Valida os campos de filtro e download do radar de proventos.
    Validate Radar Proventos Filter And Download

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

Validate Access Details Asset Button Proventos To Receive Item Screen
    [Documentation]    Valida se é possível acessar os detalhes do ativo ao clicar no botão de acessar detalhes do item de proventos a receber.
    Validate Access Details Asset Button Proventos To Receive Item

Validate Details Head Page Proventos To Receive Item Screen
    [Documentation]    Valida se as informações principais do item de proventos a receber estão corretas.
    Validate Details Head Page Proventos To Receive Item

Validate Details Active Proventos To Receive Item Screen
    [Documentation]    Valida se as informações detalhadas do item de proventos a receber estão corretas.
    Validate Details Active Proventos To Receive Item

Validate Details Event Proventos To Receive Item Screen
    [Documentation]    Valida se as informações do evento do item de proventos a receber estão corretas.
    Validate Details Event Proventos To Receive Item

Validate Access Details Asset Button Proventos Received Item Screen
    [Documentation]    Valida se é possível acessar os detalhes do ativo ao clicar no botão de acessar detalhes do item de proventos recebidos.
    Validate Access Details Asset Button Proventos Received Item

Validate Details Proventos Received Item Screen
    [Documentation]    Valida se as informações principais do item de proventos recebidos estão corretas.
    Validate Details Proventos Received Item

Validate Access Details Radar Proventos Screen
    [Documentation]    Valida se é possível acessar os detalhes do radar de proventos ao clicar no botão de acessar detalhes do item de proventos a receber.
    Validate Access Details Radar Proventos

Validate Details Radar Proventos Screen
    [Documentation]    Valida se as informações do radar de proventos estão corretas.
    Validate Details Radar Proventos

Check Money Value In Screen Details Proventos Received Item Screen
    [Documentation]    Valida se o valor do provento recebido é exibido corretamente na tela de detalhes do item de proventos recebidos.
    Check Money Value In Screen Details Proventos Received Item

Back Screen My Earnings Screen
    [Documentation]    Retorna para a tela de meus proventos.
    [Arguments]   ${OPTIONS}
    Back Screen Details Radar Proventos
    Wait Until Element Is Visible    locator=${B3_BOTTOM_NAV_BAR_ITEM_PROVENTOS}    timeout=20
    Click Element    locator=${B3_BOTTOM_NAV_BAR_ITEM_PROVENTOS}
    Click Element    locator=${B3_BOTTOM_NAV_BAR_ITEM_PROVENTOS}
    IF    '${OPTIONS}'=='A_RECEBER'
        Validate Proventos To Receive Header Screen
    ELSE IF    '${OPTIONS}'=='RECEBIDOS'
        Validate Proventos Header Screen
    ELSE IF    '${OPTIONS}'=='RADAR'
        Validate Text Radar Proventos Screen
    ELSE
        Log    Opção de tela inválida. Nenhuma ação específica será realizada.
    END