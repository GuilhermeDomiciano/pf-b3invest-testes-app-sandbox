*** Settings ***
Documentation    Element Utils

Resource    ${EXECDIR}/robot/base.resource

*** Keywords ***
Scroll Element Into View In Page
    [Documentation]            Scroll Element Into View Page
    [Arguments]                ${locator}
    FOR    ${counter}    IN RANGE    0    15
        ${el}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    0.5
        Run Keyword If     ${el}     Exit For Loop

        IF    '${platformName}'=='android'
            Swipe    ${659}    ${1643}    ${659}    ${800}
        ELSE
            Swipe    ${212}    ${442}    ${216}    ${55}
        END

        ${counter}=    Set Variable    ${counter}+1
    END

Scroll Screen
    [Documentation]    Scroll Screen

    IF    '${platformName}'=='android'
        Swipe    ${659}    ${1643}    ${659}    ${800}
    ELSE
        Swipe    ${212}    ${442}    ${216}    ${55}
    END
