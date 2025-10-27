*** Settings ***
Documentation    Wallet Functions

Resource    ${EXECDIR}/robot/screens/wallet/class_screen.resource

*** Keywords ***
Validate Back Button Screen Wallet Filter Classes
    [Documentation]    Valida o funcionamento do botão de voltar dentro da tela de classes
    
    Click On Classe Button Screen Wallet
    Click On Back Button Screen Wallet Filters
    Wait Until Page Contains Element    locator=${BTN_WALLET_ACCESS_ALL_CLASSES}  timeout=10s
    Click Element    locator=${BTN_WALLET_ACCESS_ALL_CLASSES}

Validate All Classes Button Screen Wallet
    [Documentation]    Valida o botão de todas as classes na tela de todos os produtos

    Click On Classe Button Screen Wallet

Validate Products Inside Class Product And Navigate To Classes
    [Documentation]    Valida os títulos dos produtos dentro do filtro de classe: 'Renda Variável', 'Renda Fixa' e 'Internacional' e navega para as classes.

    Click On Classe Button Screen Wallet
    Scroll Element Into View In Page    locator=${BTN_RENDA_FIXA}
    Wait Until Element Is Visible   locator=${BTN_RENDA_FIXA}   timeout=10s
    Click Element    locator=${BTN_RENDA_FIXA}
    Click Element    locator=${BTN_WALLET_BACK}
    Scroll Element Into View In Page    locator=${BTN_INTERNACIONAL}        
    Wait Until Element Is Visible    locator=${BTN_INTERNACIONAL}   timeout=10s
    Click Element    locator=${BTN_INTERNACIONAL}
    Click Element    locator=${BTN_WALLET_BACK}
    Scroll Element Into View In Page    locator=${BTN_RENDA_VARIAVEL}
    Wait Until Element Is Visible     locator=${BTN_RENDA_VARIAVEL}   timeout=10s
    Click Element    locator=${BTN_RENDA_VARIAVEL}
    Click Element    locator=${BTN_WALLET_BACK}

Validate Card Classes Product
    [Documentation]    Valida os cards das classes na tela de todas as classes.

    Click On Classe Button Screen Wallet
    Scroll Element Into View In Page    locator=${CARD_RENDA_FIXA}
    Wait Until Element Is Visible     locator=${CARD_RENDA_FIXA}   timeout=10s
    Log To Console    message=[B3] Validate Card Classes in Wallet Screen\n

    Scroll Element Into View In Page    locator=${CARD_RENDA_FIXA_RESOURCE_ID}
    Wait Until Element Is Visible     locator=${CARD_RENDA_FIXA_RESOURCE_ID}   timeout=10s
    
#     # Encontrar os dois cards
#     @{cards}=    Get WebElements    ${CARD_RENDA_FIXA}
#     ${card_count}=    Get Length    ${cards}
#     Should Be Equal As Numbers    ${card_count}    2    Expected exactly 2 cards, found ${card_count}
    
#     # Pegar primeiro card (mais acima)
#     ${first_card}=    Set Variable    ${cards}[0]
#     ${first_card_text}=    Get Element Attribute    ${first_card}    content-desc
    
#     # Pegar segundo card (mais abaixo)
#     ${second_card}=    Set Variable    ${cards}[1]
#     ${second_card_text}=    Get Element Attribute    ${second_card}    content-desc
    
#     # Extrair valores monetários de cada card
#     ${first_value}=    Extract Card Money Value    ${first_card_text}
#     ${second_value}=    Extract Card Money Value    ${second_card_text}
    
#     Log To Console    message=[B3] First card (top) value: R$ ${first_value}\n
#     Log To Console    message=[B3] Second card (bottom) value: R$ ${second_value}\n
    
#     # Validar que o primeiro card tem valor maior
#     Should Be True    ${first_value} > ${second_value}    First card should have higher value than second card
#     Log To Console    message=[B3] ✓ Validation passed: Top card has higher value\n

# Extract Card Money Value
#     [Documentation]    Extrai valor monetário do texto do card (R$ X.XXX,XX)
#     [Arguments]    ${card_text}
    
#     # Buscar padrão R$ seguido de números
#     @{money_matches}=    Get Regexp Matches    ${card_text}    R\\$ ([0-9]{1,3}(?:\\.[0-9]{3})*,[0-9]{2})
#     Should Not Be Empty    ${money_matches}    No money value found in card text: ${card_text}
    
#     # Pegar primeiro match e converter para número
#     ${money_text}=    Set Variable    ${money_matches}[0]
#     ${money_clean}=    Replace String    ${money_text}    .    ${EMPTY}
#     ${money_clean}=    Replace String    ${money_clean}    ,    .
#     ${money_numeric}=    Convert To Number    ${money_clean}
    
#     RETURN    ${money_numeric}

