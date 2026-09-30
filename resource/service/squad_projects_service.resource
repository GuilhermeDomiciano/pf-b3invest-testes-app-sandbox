*** Settings ***
Documentation    Squad Projects API Service
...              Utilities for integrating with the squad-projects API

Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Keywords ***
Create Squad Projects Session
    [Documentation]    Creates and returns a session handle for squad-projects API
    [Arguments]    ${base_url}=${SQUAD_PROJECTS_BASE_URL}

    Create Session    squad_projects_api    ${base_url}    verify=False
    [Return]    squad_projects_api

Get Project GitHub Branches
    [Documentation]    Fetches the list of GitHub branches for a project
    [Arguments]    ${project_id}    ${session}=squad_projects_api

    ${response}=    GET On Session    ${session}    /api/squad-projects/${project_id}/github/branches
    [Return]    ${response}

Validate GitHub Branches Response
    [Documentation]    Validates that the response conforms to the endpoint contract
    [Arguments]    ${response}

    Should Be Equal As Numbers    ${response.status_code}    200
    Should Not Be Empty    ${response.json()}

    ${body}=    Get From Dictionary    ${response.json()}    data
    Should Be A List    ${body}

    [Return]    ${body}

Validate Unsupported Provider Error Response
    [Documentation]    Validates error response for unsupported provider
    [Arguments]    ${response}

    Should Be Equal As Numbers    ${response.status_code}    400
    ${error}=    Get From Dictionary    ${response.json()}    error
    Should Not Be Empty    ${error}

    ${message}=    Get From Dictionary    ${error}    message
    Should Contain    ${message}    unsupported

    ${unsupported_provider}=    Get From Dictionary    ${error}    unsupported_provider
    Should Not Be Empty    ${unsupported_provider}

    ${allowed_providers}=    Get From Dictionary    ${error}    allowed_providers
    Should Be A List    ${allowed_providers}
    Should Have Length    ${allowed_providers}    4

    [Return]    ${error}
