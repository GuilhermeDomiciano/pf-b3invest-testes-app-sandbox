*** Settings ***
Documentation    Walkthrough Screen

Library          AppiumLibrary

Variables        ${EXECDIR}/robot/elements/walkthrough.yaml

*** Keywords ***
Click Button Start Using
    [Documentation]    Click Button Start Using

    Wait Until Element Is Visible    locator=${BTN_START_USING}
    Click Element    locator=${BTN_START_USING}
