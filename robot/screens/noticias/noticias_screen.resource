*** Settings ***
Documentation    Noticias Screen

Library          AppiumLibrary

Variables    ../../../robot/elements/noticias.yaml

*** Keywords ***
Navigate To Noticias Screen
    [Documentation]    Navega da home para a tela de listagem de notícias.
    ...    OBS: a entrada fica na seção "Notícias" da home, que só aparece após
    ...    rolar (posição varia conforme o conteúdo real-time do dia) — scroll
    ...    incremental até o elemento aparecer, em vez de quantidade fixa de swipes.
    ${found}=    Set Variable    ${FALSE}
    FOR    ${i}    IN RANGE    8
        ${found}=    Run Keyword And Return Status
        ...    Wait Until Element Is Visible    locator=${BTN_NOTICIAS_ENTRY}    timeout=1s
        IF    ${found}    BREAK
        Swipe    500    1800    500    600    500
        Sleep    1s
    END
    Should Be True    ${found}    msg=Entrada da seção Notícias não apareceu após 8 tentativas de scroll
    Click Element    locator=${BTN_NOTICIAS_ENTRY}
    Log To Console    message=[B3] Navigate To Noticias Screen\n

Validate Noticias Back Button
    [Documentation]    Valida presença do botão de voltar no topo da tela de notícias.
    Wait Until Element Is Visible    locator=${BTN_NOTICIAS_BACK}    timeout=10

Validate Noticias Title
    [Documentation]    Valida presença do título "Notícias" no topo da tela.
    Wait Until Element Is Visible    locator=${TITLE_NOTICIAS}    timeout=10
