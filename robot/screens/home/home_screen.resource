*** Settings ***
Documentation    Home Screen

Library          AppiumLibrary

Variables    ${EXECDIR}/robot/elements/home.yaml

*** Keywords ***
Validate Login User
    [Documentation]    Validate Login User

    Wait Until Element Is Visible    locator=${TXT_USUARIO_LOGADO}

Validate Saldo User
    [Documentation]    Validate Login User

    Wait Until Element Is Visible    locator=${TXT_USUARIO_LOGADO}
