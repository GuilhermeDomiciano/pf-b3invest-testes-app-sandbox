*** Settings ***
Documentation    Element Utils

Library    OperatingSystem

Resource    ${EXECDIR}/robot/base.resource   

*** Keywords ***
Scroll Element Into View In Page
    [Documentation]            Scroll Element Into View Page
    [Arguments]                ${locator}
    FOR    ${counter}    IN RANGE    0    15
        ${el}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    0.5
        Run Keyword If     ${el}     Exit For Loop

        IF    '${platformName}'=='android'
            #Para rodar no play do python
            Swipe    ${659}    ${1643}    ${659}    ${800}
        ELSE
            Swipe    ${212}    ${442}    ${216}    ${55}
        END

        ${counter}=    Set Variable    ${counter}+1
        #Scroll Screen
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
        Swipe    ${659}    ${1643}    ${659}    ${800}
    ELSE
        Swipe    ${212}    ${442}    ${216}    ${55}
    END

Scroll Horizontal
    [Documentation]    Perform horizontal swipe to navigate through horizontal elements
    [Arguments]    ${direction}=right
    
    IF    '${platformName}'=='android'
        IF    '${direction}'=='right'
            # Swipe from right to left (scroll right)
            Swipe    ${800}    ${1180}    ${200}    ${1180}
        ELSE
            # Swipe from left to right (scroll left)
            Swipe    ${200}    ${1180}    ${800}    ${1180}
        END
    ELSE
        IF    '${direction}'=='right'
            # iOS swipe coordinates
            Swipe    ${800}    ${1180}    ${200}    ${1180}
        ELSE
            Swipe    ${200}    ${1180}    ${800}    ${1180}
        END
    END
    
    Sleep    1s
    Log To Console    message=[B3] Horizontal scroll ${direction} performed\n

Scroll Horizontally Until Element Found
    [Documentation]    Scroll horizontally until a specific element is found
    [Arguments]    ${locator}    ${max_scrolls}=5    ${direction}=right
    
    FOR    ${counter}    IN RANGE    0    ${max_scrolls}
        ${element_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    timeout=2
        IF    ${element_found}
            Log To Console    message=[B3] Element found after ${counter} horizontal scrolls\n
            RETURN
        END
        Scroll Horizontal    ${direction}
    END
    
    Log To Console    message=[B3] Element not found after ${max_scrolls} horizontal scrolls\n
    Fail    Element ${locator} not found after horizontal scrolling

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


Enable TalkBack
    [Documentation]    Enable TalkBack on Android Emulator

    Run    adb shell settings put secure enabled_accessibility_services com.google.android.marvin.talkback/com.google.android.marvin.talkback.TalkBackService
    Run    adb shell settings put secure accessibility_enabled 1

    # Bring app to foreground
    Run    adb shell am start -n com.b3invest.app/com.b3invest.app.MainActivity

Disable TalkBack
    [Documentation]    Disable TalkBack on Android Emulator

    Run    adb shell settings put secure accessibility_enabled 0
    Run    adb shell settings put secure enabled_accessibility_services com.android.talkback/com.google.android.marvin.talkback.TalkBackService

    ${el}=    Run Keyword And Return Status    Wait Until Element Is Visible    Allow    0.5
        Run Keyword If     ${el}     Click Element    Allow
