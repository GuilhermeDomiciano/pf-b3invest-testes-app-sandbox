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
            #Swipe    ${659}    ${1643}    ${659}    ${800}
            Swipe      start_x=659  start_y=1643  end_x=659   end_y=800  duration=800ms
        ELSE
            #Swipe    ${212}    ${442}    ${216}    ${55}
            Swipe      start_x=212  start_y=442  end_x=216   end_y=55  duration=800ms
        END

        ${counter}=    Set Variable    ${counter}+1
        Scroll Screen
    END

Scroll Until Element Not Found
    [Documentation]    Scrolls until an element with given Accessibility ID is NOT visible anymore.
    [Arguments]    ${locator_1}    ${locator_2}

    FOR    ${counter}    IN RANGE    0    15

        ${el}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_1}    0.5
        Run Keyword If     ${el}     Exit For Loop
        ${el}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_2}    0.5
        Run Keyword If     ${el}     Exit For Loop
        Scroll Screen

        ${counter}=    Set Variable    ${counter}+1
    END

Scroll Screen
    [Documentation]    Scroll Screen

    IF    '${platformName}'=='android'
        #Swipe    ${659}    ${1643}    ${659}    ${800}
        Swipe      start_x=659  start_y=1643  end_x=659   end_y=800  duration=800ms
    ELSE
        #Swipe    ${212}    ${442}    ${216}    ${55}
        Swipe      start_x=212  start_y=442  end_x=216   end_y=55  duration=800ms
    END

Check If Button Is Checked
    [Documentation]    Check if the button is checked
    [Arguments]    ${locator}

    ${status}=    Get Element Attribute    ${locator}    checked
    Should Be Equal    ${status}    true
    Log To Console    message= [B3] Button is checked: ${locator}

Check If Button Is Not Checked
    [Documentation]    Check if the button is not checked
    [Arguments]    ${locator}

    ${status}=    Get Element Attribute    ${locator}    checked
    Should Be Equal    ${status}    false
    Log To Console    message= [B3] Button is not checked: ${locator}