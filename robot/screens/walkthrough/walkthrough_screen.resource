*** Settings ***
Documentation    Walkthrough Screen

Library          AppiumLibrary

Variables        ${EXECDIR}/robot/elements/walkthrough.yaml

*** Keywords ***
Click Button Start Using
    [Documentation]    Click Button Start Using

    Wait Until Element Is Visible    locator=${BTN_START_USING_ACCESSIBILITY}    timeout=20
    Click Element    locator=${BTN_START_USING_ACCESSIBILITY}

Click Button Accessibility
    [Documentation]    Click Button Accessbility

    Wait Until Element Is Visible    locator=${BTN_ACCESSIBILITY}
    Click Element    locator=${BTN_ACCESSIBILITY}