*** Settings ***
Documentation    Wallet Functions

Resource    ${EXECDIR}/robot/screens/wallet/other_institution_screen.resource
Resource    ../../screens/wallet/other_institution_screen.resource

*** Keywords ***

Navigation Other Institution Button Screen Wallet
    [Documentation]    Navega para a tela de outras instituições a partir do filtro de instituições

    Click Other Institution Button Screen Wallet Screen

Validate Other Institutions Screen Information TopBar
    [Documentation]    Valida as informações do topo da tela de outras instituições

    Validate Other Institutions Screen Information TopBar Screen

Validate Button Institution
    [Documentation]     Valida o botão de instituição e seus textos

    Validate Button Institution Screen

Navigate To Institution Page From Other Institutions
    [Documentation]    Navega para a página da instituição a partir da tela de outras instituições

    Navigate To Institution Page From Other Institutions Screen

Back Navigation From Other Institutions
    [Documentation]    Realiza a navegação de volta a partir da tela de outras instituições

    Back Navigation From Other Institutions Screen

Validate Card Institution
    [Documentation]     Valida o card da instituição e seus textos
    Validate Card Institution Screen

Validate Order Cards Institution
    [Documentation]     Valida a ordem dos cards das instituições na tela de outras instituições
    Validate Order Cards Institution Screen

Validate Three Products Institution
    [Documentation]    Navega para a tela da instituição do produto inserido a partir da tela de outras instituições

    Validate Three Products Institution Screen
    Validate Load More Products In Other Institutions Screen

Validate Load More Products one and three In Other Institutions
    [Documentation]    Valida a funcionalidade de carregar mais produtos na tela de outras instituições
    
    Validate Load More Products one and three In Other Institutions Screen

Validate Scroll Voice Over Enabled In Other Institutions
    [Documentation]    Valida a funcionalidade de scroll com o Voice Over ativado na tela de outras instituições

    Validate Scroll Voice Over Enabled In Other Institutions Screen
    