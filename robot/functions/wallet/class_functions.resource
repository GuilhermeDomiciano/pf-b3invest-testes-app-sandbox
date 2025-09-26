*** Settings ***
Documentation    Wallet Functions

Resource    ${EXECDIR}/robot/screens/wallet/class_screen.resource

*** Keywords ***
Validate Back Button Screen Wallet Filter Classes
    [Documentation]    Valida o funcionamento do botão de voltar dentro da tela de classes
    
    Click On Classe Button Screen Wallet
    Click On Back Button Screen Wallet Filters

Validate All Classes Button Screen Wallet
    [Documentation]    Valida o botão de todas as classes na tela de todos os produtos

    Click On Classe Button Screen Wallet

Validate Products Inside Class Filter
    [Documentation]    Valida os títulos dos produtos dentro do filtro de classe: 'Renda Variável', 'Renda Fixa' e 'Internacional'.

    Click On Classe Button Screen Wallet
    Wait Until Page Contains    text=Renda Variável    timeout=10s
    Wait Until Page Contains    text=Renda Fixa    timeout=10s

    Scroll Element Into View In Page    locator=accessibility_id=Internacional
    Wait Until Page Contains    text=Internacional    timeout=10s

Validate Arrow Inside Filter Classes
    [Documentation]    Validate Arrow Inside Filter Classes

    Click On Classe Button Screen Wallet
    Wait Until Page Contains Element    locator=id=b3i_navigation_Renda Variável    timeout=10s
    Wait Until Page Contains Element    locator=id=b3i_navigation_Renda Fixa    timeout=10s

    Scroll Element Into View In Page    locator=id=b3i_navigation_Internacional
    Wait Until Page Contains Element    locator=id=b3i_navigation_Internacional    timeout=10s
