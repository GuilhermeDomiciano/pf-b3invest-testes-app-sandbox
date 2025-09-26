*** Settings ***
Documentation    Home Screen

Library          AppiumLibrary

Resource    ../../../resource/utils/element_utils.resource

Variables    ../../elements/wallet.yaml
Variables    ../../elements/class.yaml
Variables    ../../elements/institute.yaml
Variables    ../../elements/product.yaml

*** Keywords ***
Click On Classe Button Screen Wallet
    [Documentation]    Click on the Classe filter button in the wallet allocation section

    Wait Until Page Contains Element    locator=${BTN_WALLET_FILTER_CLASSE}    timeout=10
    Click Element    locator=${BTN_WALLET_FILTER_CLASSE}
    Scroll Element Into View In Page    locator=${TXT_WALLET_TITLE_ACESSO_RAPIDO}
    Wait Until Page Contains    text=Acessar todas as classes    timeout=10s
    Click Element    locator=${BTN_WALLET_ACCESS_ALL_CLASSES}

    Log To Console    message=[B3] Clicked Classe filter button in wallet allocation section\n
