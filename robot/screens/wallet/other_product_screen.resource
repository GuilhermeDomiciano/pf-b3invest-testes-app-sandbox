*** Settings ***
Documentation    Home Screen
Library          AppiumLibrary

Resource    ../../../resource/utils/element_utils.resource
Variables    ../../elements/other_products.yaml

*** Keywords ***

Navigate To Other Products Screen From Institution Page Screen
    [Documentation]    Navega para a tela de outros produtos a partir da página da instituição

    Scroll Element Into View In Page    locator=${GO_TO_OTHER_PRODUCTS}
    Wait Until Page Contains Element    locator=${GO_TO_OTHER_PRODUCTS}    timeout=15s
    Click Element    locator=${GO_TO_OTHER_PRODUCTS}


Validate Header Other Products Screen
    [Documentation]    Valida o header da tela de outros produtos
    Wait Until Page Contains Element    locator=${OTHER_PRODUCTS_TITLE}    timeout=15s
    Element Should Be Visible    locator=${OTHER_PRODUCTS_TITLE}
    Wait Until Page Contains Element    locator=${OTHER_PRODUCTS_BACK_BUTTON}    timeout=15s
    Element Should Be Visible    locator=${OTHER_PRODUCTS_BACK_BUTTON}
    Wait Until Page Contains Element    locator=${OTHER_PRODUCTS_QUANTITY}    timeout=15s
    Element Should Be Visible    locator=${OTHER_PRODUCTS_QUANTITY}
    Wait Until Page Contains Element    locator=${OTHER_PRODUCTS_APPRECIATED}    timeout=15s
    Element Should Be Visible    locator=${OTHER_PRODUCTS_APPRECIATED}
    Wait Until Page Contains Element    locator=${OTHER_PRODUCTS_30_DAYS_ACS_VARIATION}    timeout=15s
    Element Should Be Visible    locator=${OTHER_PRODUCTS_30_DAYS_ACS_VARIATION}
    Wait Until Page Contains Element    locator=${ACCESSIBILITY_WALLET}    timeout=15s
    Element Should Be Visible    locator=${ACCESSIBILITY_WALLET}
    Wait Until Page Contains Element    locator=${CARD_OTHER_PRODUCTS_VALUE}    timeout=15s
    Element Should Be Visible    locator=${CARD_OTHER_PRODUCTS_VALUE}
    Scroll Element Into View In Page    locator=${PRODUCT_CARD_TITLE_OTHER_PRODUCTS}
    Wait Until Page Contains Element    locator=${PRODUCT_CARD_TITLE_OTHER_PRODUCTS}    timeout=15s
    Element Should Be Visible    locator=${PRODUCT_CARD_TITLE_OTHER_PRODUCTS}


Validate Card Order Classes Other Products Screen
    [Documentation]    Valida os cards das classes na tela de outros produtos.

    Wait Until Element Is Visible     locator=${PRODUCT_CARD_TITLE_OTHER_PRODUCTS}   timeout=10s
    Scroll Element Into View In Page    locator=${BTN_LOAD_MORE_OTHER_PRODUCTS}
    Sleep    2s  
    Log To Console    message=[B3] Validate Card Order Classes Other Products in Wallet Screen\n
    Pick Card To Check Order    ${PRODUCT_CARD_TITLE_OTHER_PRODUCTS}    ${BTN_LOAD_MORE_OTHER_PRODUCTS}   True

Navigate To Inside Other Product Card Screen
    [Documentation]    Navega para dentro do card de outro produto
    Wait Until Element Is Visible     locator=${PRODUCT_CARD_TITLE_OTHER_PRODUCTS}   timeout=10s
    Click Element    locator=${PRODUCT_CARD_TITLE_OTHER_PRODUCTS}
    Wait Until Page Contains Element    locator=${OTHER_PRODUCTS_BACK_BUTTON}    timeout=15s
    Element Should Be Visible    locator=${OTHER_PRODUCTS_BACK_BUTTON}
    Wait Until Page Contains Element    locator=${OTHER_PRODUCTS_30_DAYS_ACS_VARIATION}    timeout=15s
    Element Should Be Visible    locator=${OTHER_PRODUCTS_30_DAYS_ACS_VARIATION}
    Click Element    locator=${OTHER_PRODUCTS_BACK_BUTTON}
    Wait Until Element Is Visible    locator=${CARD_OTHER_PRODUCTS_VALUE}   timeout=15s
    Element Should Be Visible    locator=${CARD_OTHER_PRODUCTS_VALUE}
    Wait Until Element Is Visible    locator=${OTHER_PRODUCTS_30_DAYS_ACS_VARIATION}
    Element Should Be Visible    locator=${OTHER_PRODUCTS_30_DAYS_ACS_VARIATION}
    Log To Console    message=[B3] Navigate To Inside Other Product Card Screen in Wallet Screen\n

Validate Button Load More Other Products Screen
    [Documentation]    Valida o botão de carregar mais na tela de outros produtos
    Wait Until Element Is Visible     locator=${BTN_LOAD_MORE_OTHER_PRODUCTS}   timeout=10s
    Scroll Element Into View In Page    locator=${BTN_LOAD_MORE_OTHER_PRODUCTS}
    Click Element    locator=${BTN_LOAD_MORE_OTHER_PRODUCTS}
    Sleep    2s  
    Log To Console    message=[B3] Validate Button Load More Other Products in Wallet Screen\n