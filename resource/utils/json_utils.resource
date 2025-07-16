*** Settings ***
Documentation    Json Utils

Resource    ${EXECDIR}/robot/base.resource

*** Keywords ***
Convert Response Content To Json
    [Documentation]         Convert Response Content To Json
    [Arguments]             ${content}

    ${json_content}=    Evaluate    json.loads($content.decode('utf-8'))    json
    RETURN    ${json_content}
