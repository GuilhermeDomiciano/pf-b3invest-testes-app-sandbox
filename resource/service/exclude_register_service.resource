*** Settings ***
Documentation    Exclude Register Service

Library     RequestsLibrary
Library     JSONLibrary

Resource    ${EXECDIR}/resource/utils/json_utils.resource

*** Variables ***
${B3_USER_URL}      https://b3sa.com.br/

*** Keywords ***
Exclude Register User
    [Documentation]    Exclude Register User
    [Arguments]    ${EMAIL}    ${PASSWORD}

    ### Solicitar backend para exclusão de cadastro com o Joao Vitor Farias Quintal
    Log To Console    message=[ATENCAO] Lembrar de excluir o registro deste usuário: ${EMAIL} - ${PASSWORD}
