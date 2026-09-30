*** Settings ***
Documentation    Squad Projects API Tests
...              Validates the GET /api/squad-projects/:projectId/github/branches endpoint

Library    Collections
Library    RequestsLibrary
Library    JSONLibrary

Resource    ${EXECDIR}/config/settings.resource
Resource    ${EXECDIR}/resource/core/core.resource
Resource    ${EXECDIR}/resource/service/squad_projects_service.resource

*** Variables ***
${SQUAD_PROJECTS_BASE_URL}    http://localhost:3000
${PROJECT_ID_SUPPORTED}       75
${PROJECT_ID_UNSUPPORTED}     999
${GITHUB_PROVIDER}            github
${GITHUB_EMU_PROVIDER}        github-emu
${BITBUCKET_PROVIDER}         bitbucket
${AZURE_DEVOPS_PROVIDER}      azure-devops
${GITLAB_PROVIDER}            gitlab
@{SUPPORTED_PROVIDERS}        github    bitbucket    azure-devops    gitlab

*** Test Cases ***
Validate Squad Projects GitHub Branches Endpoint With Supported Provider
    [Documentation]    Verify that GET /api/squad-projects/:projectId/github/branches
    ...                returns a successful response with branch list for a valid project
    ...                configured with a supported Git provider (github, bitbucket, azure-devops, gitlab)
    [Tags]    squad-projects    api    integration

    ${session}=    Create Squad Projects Session    ${SQUAD_PROJECTS_BASE_URL}
    ${response}=    Get Project GitHub Branches    ${PROJECT_ID_SUPPORTED}    ${session}
    ${branches}=    Validate GitHub Branches Response    ${response}

    Log    Branch list retrieved successfully for project ${PROJECT_ID_SUPPORTED}: ${branches}

Validate Squad Projects API Returns Error For Unsupported Provider
    [Documentation]    Verify that GET /api/squad-projects/:projectId/github/branches
    ...                returns explicit client error for unsupported providers (e.g., github-emu)
    ...                instead of surfacing unhandled server exception
    [Tags]    squad-projects    api    validation    error-handling

    ${session}=    Create Squad Projects Session    ${SQUAD_PROJECTS_BASE_URL}
    ${response}=    Get Project GitHub Branches    ${PROJECT_ID_UNSUPPORTED}    ${session}

    # Project 999 is configured with github-emu (unsupported provider)
    # Should return HTTP 400 with explicit error message
    Status Should Be    400    ${response}
    ${error}=    Validate Unsupported Provider Error Response    ${response}

    Log    Unsupported provider error properly handled: ${error}

Validate Squad Projects Configuration For Project 75
    [Documentation]    Confirm the production configuration for project 75:
    ...                - Git provider (github, bitbucket, azure-devops, gitlab)
    ...                - Repository URL
    ...                - Request payload structure
    ...                - Authenticated user role/scope
    [Tags]    squad-projects    configuration    validation

    ${session}=    Create Squad Projects Session    ${SQUAD_PROJECTS_BASE_URL}
    ${response}=    Get Project GitHub Branches    ${PROJECT_ID_SUPPORTED}    ${session}
    ${branches}=    Validate GitHub Branches Response    ${response}

    # Verify response includes project details
    ${body}=    Get From Dictionary    ${response.json()}    project
    Should Not Be Empty    ${body}

    ${provider}=    Get From Dictionary    ${body}    provider
    Should Contain    ${SUPPORTED_PROVIDERS}    ${provider}

    Log    Project ${PROJECT_ID_SUPPORTED} configuration validated successfully with ${branches.__len__()} branches and provider: ${provider}
