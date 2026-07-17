*** Settings ***
Documentation    Core

Library     ${EXECDIR}/resource/tools/env_loader.py

Resource    ${EXECDIR}/resource/core/browserstack/browserstack.resource
Resource    ${EXECDIR}/resource/core/local/local.resource

*** Keywords ***
Open AppB3
    [Documentation]    Open AppB3
    [Arguments]    &{DATA}

    Load Project Environment

    IF    '${DATA.ENVIRONMENT}' == 'local'
        Open App Local    &{DATA}

    ELSE IF    '${DATA.ENVIRONMENT}' == 'bs'
        Validate Browserstack Secrets
        Open App Browserstack    &{DATA}

    ELSE
        Fail    Environment ${DATA.ENVIRONMENT} not configured.
    END
