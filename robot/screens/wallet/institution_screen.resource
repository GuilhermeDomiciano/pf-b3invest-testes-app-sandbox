*** Settings ***
Documentation    Home Screen

Library          AppiumLibrary

Resource    ../../../resource/utils/element_utils.resource

Variables    ../../elements/wallet.yaml
Variables    ../../elements/class.yaml
Variables    ../../elements/institute.yaml
Variables    ../../elements/product.yaml

*** Keywords ***
Click On Institution Button Screen Wallet
    [Documentation]    Click on the Institution filter button in the wallet allocation section

    Wait Until Page Contains Element    locator=${BTN_WALLET_FILTER_INSTITUICAO}    timeout=10
    Click Element    locator=${BTN_WALLET_FILTER_INSTITUICAO}
    Scroll Element Into View In Page    locator=${BTN_WALLET_ACCESS_ALL_INSTITUTIONS}
    Wait Until Page Contains    text=Acessar todas as instituições    timeout=10s
    Click Element    locator=${BTN_WALLET_ACCESS_ALL_INSTITUTIONS}

    Log To Console    message=[B3] Clicked Instituição filter button in wallet allocation section\n

Validate And Navigate To Institutions Products And Button Load More Screen Wallet Institution
  [Documentation]    Valida e navega para as duas primeiras instituições encontradas na tela, voltando pelo botão de voltar do topo
    # Aguarda os cards de instituição aparecerem usando o regex dinâmico
    Scroll Element Into View In Page    locator=${INSTITUTION_BUTTON_REGEX}
    Wait Until Element Is Visible   locator=${INSTITUTION_BUTTON_REGEX}   timeout=10s
    Log To Console    message=[B3] Navegando para a primeira instituição encontrada na tela\n
    Click Element    ${INSTITUTION_BUTTON_REGEX}
    Sleep    2s
    Click Element    locator=${BTN_WALLET_BACK}
    Scroll Element Into View In Page    locator=${CARD_INSTITUTION_PRODUCT}
    Wait Until Element Is Visible   locator=${CARD_INSTITUTION_PRODUCT}   timeout=10s 
    Log To Console    message=[B3] Navegando por expressao regular para o primeiro card de produto de uma instituição encontrada na tela\n
    Click Element    ${CARD_INSTITUTION_PRODUCT}
    Sleep    2s
    Click Element    locator=${BTN_WALLET_BACK}
    Scroll Element Into View In Page    locator=${CARD_LOAD_MORE}
    Wait Until Element Is Visible     locator=${CARD_LOAD_MORE}   timeout=10s
    Log To Console    message=[B3] Validando que o botao carregar mais existe e está visível e carrega mais cards\n
    Click Element    ${CARD_LOAD_MORE}
    Sleep    2s
    # Enable TalkBack
    # Scroll Element Into View In Page    locator=${CARD_LOAD_MORE_INSTITUTIONS}
    # Click Element    ${CARD_LOAD_MORE_INSTITUTIONS}
    # Disable TalkBack
    # Sleep    2s
  