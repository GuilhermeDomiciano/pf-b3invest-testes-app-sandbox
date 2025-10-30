

*** Settings ***
Documentation    Element Utils

Library    OperatingSystem
Library    regex_money_utils.py

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

Pick Card To Check Order
    [Documentation]    Pick Card To check order
    [Arguments]    ${card_id}    ${scroll_needed}   ${card_order}=True
    Scroll Element Into View In Page    locator=${scroll_needed}
    Wait Until Element Is Visible     locator=${scroll_needed}   timeout=10s
    Log To Console    message=[B3] Validate Card Classes in Wallet Screen\n
    @{cards}=    Get WebElements    ${card_id}
    ${card_count}=    Get Length    ${cards}
    Should Be True    ${card_count} >= 1    Expected at least 1 card, found ${card_count}

    # Extrair todos os valores em uma lista, ignorando elementos abaixo do scroll_needed
    @{card_values}=    Create List
    ${scroll_id}=    Get Element Attribute    ${scroll_needed}    resource-id
    FOR    ${i}    IN RANGE    ${card_count}
        ${card_element}=    Get Element Attribute    ${cards}[${i}]    resource-id
        IF    '${card_element}' == '${scroll_id}'
            BREAK
        END
        ${card_text}=    Get Element Attribute    ${cards}[${i}]    content-desc
        ${card_value}=    Extract Card Money Value    ${card_text}
        Log To Console    message=[B3] Card ${i+1}: R$ ${card_value}\n
        Append To List    ${card_values}    ${card_value}
    END

    # Validar se a lista está ordenada
    @{sorted_values}=    Copy List    ${card_values}
    IF    ${card_order}
        Sort List    ${sorted_values}
        Reverse List    ${sorted_values}
        Log To Console    message=Descendente
    ELSE
        Sort List    ${sorted_values}
        Log To Console    message=Ascendente
    END
    Log To Console    message=[B3] Lista original extraída: ${card_values}\n
    Log To Console    message=[B3] Lista ordenada esperada: ${sorted_values}\n
    Should Be Equal    ${card_values}    ${sorted_values}    A lista de valores dos cards NÃO está ordenada conforme esperado na tela!

    
Extract Card Money Value
    [Documentation]    Extrai valor monetário do texto do card (R$ X.XXX,XX)
    [Arguments]    ${card_text}
    
    # Buscar padrão R$ seguido de números
    # Extrai o valor monetário (R$ X.XXX,XX) e converte para float
    # Captura valor no formato brasileiro: R$ X.XXX.XXX.XXX,XX
    ${normalized}=    Replace String    ${card_text}    \n    ${SPACE}
    ${normalized}=    Replace String    ${normalized}    \r    ${SPACE}
    ${normalized}=    Replace String    ${normalized}    \t    ${SPACE}
    ${normalized}=    Replace String    ${normalized}    \u00A0    ${SPACE}
    Log To Console    message=[B3] Original card text: ${card_text}\n
    Log To Console    message=[B3] Normalized card text: ${normalized}\n
    @{money_matches}=    extrair_valor_monetario    ${normalized}
    Log To Console    message=[B3] Money matches found: ${money_matches}\n
    Should Not Be Empty    ${money_matches}    No money value found in card text: ${card_text}
    ${money_text}=    Set Variable    ${money_matches}[0]
    # Remove pontos de milhar e troca vírgula por ponto
    ${money_clean}=    Replace String    ${money_text}    .    ${EMPTY}
    ${money_clean}=    Replace String    ${money_clean}    ,    .
    ${money_numeric}=    Convert To Number    ${money_clean}
    
    RETURN    ${money_numeric}

Disable Android Internet
    [Documentation]    Desliga a internet (Wi-Fi e dados móveis) do Android via adb
    Run    adb shell svc wifi disable
    Run    adb shell svc data disable
    Sleep   2s
    Log To Console    message=[B3] Internet do Android desligada (Wi-Fi e dados móveis)

Enable Android Internet
    [Documentation]    Liga a internet (Wi-Fi e dados móveis) do Android via adb
    Run    adb shell svc wifi enable
    Run    adb shell svc data enable
    Sleep   2s
    Log To Console    message=[B3] Internet do Android ligada (Wi-Fi e dados móveis)

Check Android Wifi Enabled
    [Documentation]    Verifica se o Wi-Fi do Android está ativo via adb (retorna True/False)
    ${output}=    Run    adb shell dumpsys wifi | grep 'Wi-Fi is' | grep 'enabled'
    ${wifi_on}=    Run Keyword And Return Status    Should Contain    ${output}    enabled
    RETURN    ${wifi_on}

Restart Android Emulator
    [Documentation]    Reinicia o emulador Android via adb
    Run    adb reboot
    Sleep    30s
    Log To Console    message=[B3] Emulador Android reiniciado
