

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

Scroll Element Into View Top In Page
    [Documentation]            Scroll Element Into View Page
    [Arguments]                ${locator}
    FOR    ${counter}    IN RANGE    0    15
        ${el}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    0.5
        Run Keyword If     ${el}     Exit For Loop

        IF    '${platformName}'=='android'
            Swipe    ${659}    ${800}    ${659}    ${1643}
        ELSE
            Swipe    ${216}    ${55}    ${212}    ${442}
        END
        ${counter}=    Set Variable    ${counter}+1
    END

Scroll Until Element Not Found
    [Documentation]    Faz scroll procurando por elementos. Se encontrar locator_1, o teste falha. Se encontrar locator_2, o teste passa.
    [Arguments]    ${locator_1}    ${locator_2}

    Log To Console    message=[B3] Verificando presença de elementos na tela

    FOR    ${counter}    IN RANGE    0    15
        Log To Console    message=[B3] Tentativa ${counter + 1}/15 - Verificando presença dos elementos

        # Verifica se o primeiro elemento está visível (FALHA se encontrar)
        ${el1_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_1}    0.5
        IF    ${el1_found}
            Log To Console    message=[B3] ❌ FALHA: Elemento indesejado encontrado na tela: ${locator_1}
            Fail    msg=Teste falhou: Elemento '${locator_1}' foi encontrado na tela, mas não deveria estar visível!
        END

        # Verifica se o segundo elemento está visível (SUCESSO se encontrar)
        ${el2_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_2}    0.5
        IF    ${el2_found}
            Log To Console    message=[B3] ✅ SUCESSO: Elemento de validação encontrado: ${locator_2}
            Log To Console    message=[B3] Teste passou - elemento de validação está presente na tela
            RETURN
        END

        # Se chegou até aqui, nenhum elemento foi encontrado nesta tentativa
        Log To Console    message=[B3] ➡️ Nenhum elemento encontrado nesta tentativa - fazendo scroll para verificar mais conteúdo

        # Faz scroll para verificar mais conteúdo da tela
        Scroll Screen
        ${counter}=    Set Variable    ${counter}+1
    END

    # Se terminou o loop sem encontrar o elemento de validação, o teste passou
    Log To Console    message=[B3] ✅ SUCESSO: Elemento indesejado '${locator_1}' não foi encontrado após ${15} tentativas de scroll!
    Log To Console    message=[B3] Teste passou - elemento indesejado não está presente na tela

Scroll Screen
    [Documentation]    Scroll Screen

    IF    '${platformName}'=='android'
        Swipe    ${659}    ${1643}    ${659}    ${800}
    ELSE
        Swipe    ${212}    ${442}    ${216}    ${55}
    END

Scroll Screen Up
    [Documentation]    Scroll Screen para cima

    IF    '${platformName}'=='android'
        Swipe    ${659}    ${800}    ${659}    ${1643}
    ELSE
        Swipe    ${216}    ${55}    ${212}    ${442}
    END



Scroll Full Screen Dynamic
    [Documentation]    Faz scroll do tamanho da tela usando dimensões dinâmicas para Android
    
    TRY
        # Para Android: obter dimensões via adb
        ${screen_info}=    Run    adb shell wm size
        Log To Console    message=[B3] Screen info: ${screen_info}
        
        # Extrai as dimensões (formato: "Physical size: 1080x2340")
        ${dimensions}=    Evaluate    re.search(r'(\d+)x(\d+)', '''${screen_info}''').groups()    modules=re
        ${screen_width}=    Convert To Integer    ${dimensions}[0]
        ${screen_height}=    Convert To Integer    ${dimensions}[1]
        
        # Calcula pontos de scroll (90% até 10% da altura)
        ${start_y}=    Evaluate    int(${screen_height} * 0.9)
        ${end_y}=    Evaluate    int(${screen_height} * 0.1)
        ${center_x}=    Evaluate    int(${screen_width} / 2)
        
        Swipe    ${center_x}    ${start_y}    ${center_x}    ${end_y}
        Log To Console    message=[B3] Full screen dinâmico executado (${screen_width}x${screen_height}: ${start_y} → ${end_y})
        
    EXCEPT
        # Fallback: usar valores padrão comuns para Android
        ${screen_width}=    Set Variable    1080
        ${screen_height}=    Set Variable    2340
        
        ${start_y}=    Evaluate    int(${screen_height} * 0.9)    # 2106
        ${end_y}=    Evaluate    int(${screen_height} * 0.1)     # 234
        ${center_x}=    Evaluate    int(${screen_width} / 2)     # 540
        
        Swipe    ${center_x}    ${start_y}    ${center_x}    ${end_y}
        Log To Console    message=[B3] Full screen com valores padrão executado (${screen_width}x${screen_height}: ${start_y} → ${end_y})
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
Scroll Horizontal Long
    [Documentation]    Perform a longer horizontal swipe to navigate through more distant horizontal elements
    [Arguments]    ${direction}=right
    
    IF    '${platformName}'=='android'
        IF    '${direction}'=='right'
            # Swipe from far right to far left (scroll right, mais longo)
            Swipe    ${900}    ${1180}    ${0}    ${1180}
        ELSE
            # Swipe from far left to far right (scroll left, mais longo)
            Swipe    ${0}    ${1180}    ${900}    ${1180}
        END
    ELSE
        IF    '${direction}'=='right'
            # iOS swipe coordinates (mais longo)
            Swipe    ${900}    ${1180}    ${0}    ${1180}
        ELSE
            Swipe    ${0}    ${1180}    ${900}    ${1180}
        END
    END
    
    Sleep    1s
    Log To Console    message=[B3] Horizontal LONG scroll ${direction} performed\n

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

Pick All Monetary Values No Scroll
    [Documentation]    Busca todos os valores monetários na tela atual sem fazer scroll e valida ordem
    [Arguments]    ${card_order}=True
    
    Log To Console    message=[B3] Buscar todos os valores monetários na tela atual (sem scroll)\n
    
    # Obter todos os elementos da tela
    @{all_elements}=    Get WebElements    xpath=//*
    ${total_elements}=    Get Length    ${all_elements}
    Log To Console    message=[B3] Total de elementos encontrados: ${total_elements}\n
    
    # Lista para armazenar todos os valores monetários encontrados
    @{monetary_values}=    Create List
    
    FOR    ${i}    IN RANGE    ${total_elements}
        ${element_desc}=    Get Element Attribute    ${all_elements}[${i}]    content-desc
        ${element_text}=    Get Element Attribute    ${all_elements}[${i}]    text
        
        # Verificar content-desc primeiro

        ${is_monetary_desc}=    Is Valor Monetario    ${element_desc}
        IF    ${is_monetary_desc} == 1
            ${monetary_value}=    Extract Card Money Value    ${element_desc}
            Log To Console    message=[B3] Valor monetário encontrado (content-desc): ${element_desc} = R$ ${monetary_value}\n
            Append To List    ${monetary_values}    ${monetary_value}
            CONTINUE
            
        END
        
        # Verificar text se content-desc não contém valor monetário
        IF    '${element_text}' != '${EMPTY}' and '${element_text}' != 'None'
            ${is_monetary_text}=    Is Valor Monetario    ${element_text}
            IF    ${is_monetary_text} == 1
                ${monetary_value}=    Extract Card Money Value    ${element_text}
                Log To Console    message=[B3] Valor monetário encontrado (text): ${element_text} = R$ ${monetary_value}\n
                Append To List    ${monetary_values}    ${monetary_value}
            END
        END
    END
    
    # Verificar se encontrou algum valor monetário
    ${monetary_count}=    Get Length    ${monetary_values}
    Should Be True    ${monetary_count} >= 1    Nenhum valor monetário encontrado na tela atual
    Log To Console    message=[B3] Total de valores monetários encontrados: ${monetary_count}\n
    
    # Validar se a lista está ordenada
    @{sorted_values}=    Copy List    ${monetary_values}
    IF    ${card_order}
        Sort List    ${sorted_values}
        Reverse List    ${sorted_values}
        Log To Console    message=[B3] Validando ordem DESCENDENTE
    ELSE
        Sort List    ${sorted_values}
        Log To Console    message=[B3] Validando ordem ASCENDENTE
    END
    
    Log To Console    message=[B3] Lista original extraída: ${monetary_values}\n
    Log To Console    message=[B3] Lista ordenada esperada: ${sorted_values}\n
    Should Be Equal    ${monetary_values}    ${sorted_values}    A lista de valores monetários NÃO está ordenada conforme esperado na tela!
    
    Log To Console    message=[B3] ✅ Validação concluída: ${monetary_count} valores monetários estão ordenados corretamente!\n

    
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

Find Elements Until Specific Element Found
    [Documentation]    Faz log no terminal de todos os elementos (xpath/accessibility_id) encontrados até achar o elemento específico
    [Arguments]    ${target_element}     ${match_numbers_expected}=1
    @{elements}=    Get WebElements    xpath=//*
    ${total}=    Get Length    ${elements}
    ${target_desc}=    Get Element Attribute    ${target_element}    content-desc
    ${matches_found}=    Set Variable    0
    FOR    ${i}    IN RANGE    0    ${total}
        ${desc}=    Get Element Attribute    ${elements}[${i}]    content-desc
        ${resource_id}=    Get Element Attribute    ${elements}[${i}]    resource-id
        Log To Console    message=[B3] Elemento ${i}: content-desc='${desc}' resource-id='${resource_id}'
        ${desc}=    Replace String    ${desc}    \n    ${SPACE}
        ${desc}=    Set Variable    ${desc}
        IF    '${desc}' != '${EMPTY}' and '${desc}' != 'None'
            Log To Console    message=[B3] Elemento diferente de null ${i}!
            IF    '${desc}' == '${target_desc}'
                Log To Console    message=[B3] Elemento alvo encontrado no índice ${i}!
                IF   ${matches_found} >= ${match_numbers_expected}
                    Log To Console    message=[B3] Valores monetários encontrados antes do elemento alvo: ${matches_found}\n
                ELSE
                    Fail    msg=[B3] TESTE FALHOU: Nenhum valor monetário encontrado antes do elemento alvo ${matches_found}!
                    Log To Console    message=[B3] Nenhum valor monetário encontrado antes do elemento alvo.\n
                END
                RETURN
            ELSE 
                ${is_monetary}=    Is Valor Monetario    ${desc}
                ${matches_found}=    Evaluate    ${matches_found} + ${is_monetary}                
            END
        END
    END
    Log To Console    message=[B3] Elemento alvo não encontrado na tela!

Find Elements Until Specific Element Found Scroll
    [Documentation]    Faz log no terminal de todos os elementos (xpath/accessibility_id) encontrados até achar o elemento específico com scroll automático
    [Arguments]    ${target_element}     ${match_numbers_expected}=1    ${max_scrolls}=5
    
    # Converte parâmetros para inteiros
    ${max_scrolls_int}=    Convert To Integer    ${max_scrolls}
    ${match_expected_int}=    Convert To Integer    ${match_numbers_expected}
    ${matches_found}=    Set Variable    0
    
    # Primeira verificação: tentar obter o content-desc do elemento alvo
    ${target_desc}=    Set Variable    ${EMPTY}
    ${target_exists}=    Run Keyword And Return Status    Page Should Contain Element    ${target_element}
    IF    ${target_exists}
        ${target_desc}=    Get Element Attribute    ${target_element}    content-desc
        Log To Console    message=[B3] Elemento alvo já visível, content-desc: '${target_desc}'
    ELSE
        Log To Console    message=[B3] Elemento alvo '${target_element}' não está visível, iniciando busca com scroll
    END
    
    FOR    ${scroll_attempt}    IN RANGE    0    ${max_scrolls_int}
        ${attempt_display}=    Evaluate    ${scroll_attempt} + 1
        Log To Console    message=[B3] === Tentativa ${attempt_display}/${max_scrolls_int} ===
        @{elements}=    Get WebElements    xpath=//*
        ${total}=    Get Length    ${elements}
      
        ${element_found}=    Set Variable    ${False}
        
        # Se não conseguiu obter target_desc antes, tenta novamente a cada scroll
        IF    '${target_desc}' == '${EMPTY}'
            ${target_exists_now}=    Run Keyword And Return Status    Page Should Contain Element    ${target_element}
            IF    ${target_exists_now}
                ${target_desc}=    Get Element Attribute    ${target_element}    content-desc
                Log To Console    message=[B3] Elemento alvo agora visível, content-desc: '${target_desc}'
            END
        END
        
        FOR    ${i}    IN RANGE    0    ${total}
            ${desc}=    Get Element Attribute    ${elements}[${i}]    content-desc
            ${resource_id}=    Get Element Attribute    ${elements}[${i}]    resource-id
            Log To Console    message=[B3] Elemento ${i}: content-desc='${desc}' resource-id='${resource_id}'
            
            # Limpa quebras de linha para comparação
            ${desc_clean}=    Replace String    ${desc}    \n    ${SPACE}
            
            IF    '${desc_clean}' != '${EMPTY}' and '${desc_clean}' != 'None'
                Log To Console    message=[B3] Elemento diferente de null ${i}!
                
                # PRIMEIRO: Conta valores monetários ANTES de verificar se é o elemento alvo
                ${is_monetary}=    Is Valor Monetario    ${desc_clean}
                IF    ${is_monetary} == 1
                    ${matches_found}=    Evaluate    ${matches_found} + 1
                    Log To Console    message=[B3] ✅ Valor monetário encontrado: '${desc_clean}' (Total: ${matches_found})
                END
                
                # SEGUNDO: Verifica se é o elemento alvo (se conseguimos obter o target_desc)
                IF    '${target_desc}' != '${EMPTY}' and '${desc_clean}' == '${target_desc}'
                    Log To Console    message=[B3] 🎯 Elemento alvo encontrado no índice ${i} após ${scroll_attempt} scrolls!
                    ${element_found}=    Set Variable    ${True}
                    IF   ${matches_found} >= ${match_expected_int}
                        Log To Console    message=[B3] ✅ SUCESSO: ${matches_found} valores monetários encontrados antes do elemento alvo (esperado: ${match_expected_int})!
                        RETURN
                    ELSE
                        Log To Console    message=[B3] ❌ FALHA: Apenas ${matches_found} valores monetários encontrados, esperado: ${match_expected_int}!
                        Fail    msg=[B3] TESTE FALHOU: Apenas ${matches_found} valores monetários encontrados, esperado: ${match_expected_int}!
                    END
                END
            END
        END
        
        # Verificação adicional: tentar localizar o elemento diretamente pelo locator
        IF    not ${element_found}
            ${direct_check}=    Run Keyword And Return Status    Page Should Contain Element    ${target_element}
            IF    ${direct_check}
                Log To Console    message=[B3] 🎯 Elemento alvo '${target_element}' encontrado diretamente!
                ${element_found}=    Set Variable    ${True}
                # Valida se temos valores monetários suficientes
                IF   ${matches_found} >= ${match_expected_int}
                    Log To Console    message=[B3] ✅ SUCESSO: ${matches_found} valores monetários encontrados (esperado: ${match_expected_int})!
                    RETURN
                ELSE
                    Log To Console    message=[B3] ❌ FALHA: Apenas ${matches_found} valores monetários encontrados, esperado: ${match_expected_int}!
                    Fail    msg=[B3] TESTE FALHOU: Apenas ${matches_found} valores monetários encontrados, esperado: ${match_expected_int}!
                END
            END
        END
        
        # Se encontrou o elemento, sai do loop de scroll
        IF    ${element_found}
            BREAK
        END
        
        # Se não encontrou o elemento e não é a última tentativa, faz scroll
        ${max_minus_one}=    Evaluate    ${max_scrolls_int} - 1
        IF    ${scroll_attempt} < ${max_minus_one}
            ${next_attempt}=    Evaluate    ${scroll_attempt} + 1
            Log To Console    message=[B3] Elemento alvo não encontrado, fazendo scroll ${next_attempt}/${max_scrolls_int}
            Scroll Full Screen Dynamic
            Sleep    1s
        END
    END
    
    # Se chegou aqui, não encontrou o elemento mesmo com scroll
    Log To Console    message=[B3] ERRO: Elemento alvo '${target_element}' não encontrado na tela após ${max_scrolls_int} tentativas de scroll!
    Fail    msg=Elemento '${target_element}' não encontrado após ${max_scrolls_int} scrolls

Log Element Comparison
    [Documentation]    Faz log comparativo entre elemento buscado e encontrado na tela
    [Arguments]    ${locator}    ${element_name}=Elemento
    Log To Console    message=[B3] 🔍 ${element_name} BUSCADO: ${locator}
    ${found_element}=    Get WebElement    ${locator}
    ${resource_id_found}=    Get Element Attribute    ${found_element}    resource-id
    ${content_desc_found}=    Get Element Attribute    ${found_element}    content-desc
    ${text_found}=    Get Element Attribute    ${found_element}    text
    ${class_found}=    Get Element Attribute    ${found_element}    class
    Log To Console    message=[B3] ✅ ${element_name} ENCONTRADO NA TELA:
    Log To Console    message=[B3] Locator Original: ${locator}
    Log To Console    message=[B3] Resource-ID: ${resource_id_found}
    Log To Console    message=[B3] Content-Desc: ${content_desc_found}
    Log To Console    message=[B3] Text: ${text_found}
    Log To Console    message=[B3] Class: ${class_found}
