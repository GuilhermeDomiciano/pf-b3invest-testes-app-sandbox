*** Settings ***
Documentation    Core

Resource    ${EXECDIR}/resource/core/browserstack/browserstack.resource
Resource    ${EXECDIR}/resource/core/local/local.resource

*** Keywords ***
Open AppB3
    [Documentation]    Open AppB3
    [Arguments]    &{DATA}

    IF    '${DATA.ENVIRONMENT}' == 'local'
        Open App Local    &{DATA}

    ELSE IF    '${DATA.ENVIRONMENT}' == 'bs'
        Open App Browserstack    &{DATA}

    ELSE
        Fail    Environment ${DATA.ENVIRONMENT} not configured.
    END
