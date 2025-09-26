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
    Scroll Element Into View In Page    locator=${TXT_WALLET_TITLE_ACESSO_RAPIDO}
    Wait Until Page Contains    text=Acessar todas as instituições    timeout=10s
    Click Element    locator=${BTN_WALLET_ACCESS_ALL_INSTITUTIONS}

    Log To Console    message=[B3] Clicked Instituição filter button in wallet allocation section\n
