*** Settings ***
Documentation    Mailsac Service

Library     RequestsLibrary
Library     JSONLibrary
Library     ${EXECDIR}/resource/tools/regex_tools.py
Library     ${EXECDIR}/resource/tools/env_loader.py

Resource    ${EXECDIR}/resource/utils/json_utils.resource

*** Variables ***
${MAILSAC_URL}      https://mailsac.com/api
${MAILSAC_TOKEN}    ${EMPTY}

${MAILSAC_END_ADDRESSES}    /addresses/
${MAILSAC_END_MESSAGES}    /messages/

*** Keywords ***
Get MessageId Mailsac
    [Documentation]         Get MessageId Mailsac
    [Arguments]             ${EMAIL}

    Load Project Environment
    Validate Mailsac Token

    Sleep    10

    ${headers}=             Create Dictionary
    ...                     Mailsac-Key=${MAILSAC_TOKEN}
    ...                     Content-Type=application/json

    ${response}=            GET    ${MAILSAC_URL}${MAILSAC_END_ADDRESSES}${EMAIL}${MAILSAC_END_MESSAGES}
    ...                     verify=${True}
    ...                     headers=${headers}
    ...                     expected_status=200

    ${json_content}=        Run Keyword    Convert Response Content To Json    ${response.content}

    ${message_ids}=     Create List

    FOR  ${message}  IN  @{json_content}

        ${message_id}=             Get From Dictionary    ${message}    _id
        Append To List    ${message_ids}    ${message_id}
    END

    ${first_id}=    Get From List    ${message_ids}    0

    RETURN    ${first_id}

Get Token Mailsac
    [Documentation]    Get Token Mailsac
    [Arguments]        ${EMAIL}

    Load Project Environment
    Validate Mailsac Token

    ${MESSAGE_ID}=    Get MessageId Mailsac    EMAIL=${EMAIL}

    ${headers}=             Create Dictionary
    ...                     Mailsac-Key=${MAILSAC_TOKEN}
    ...                     Content-Type=application/json

    ${params}=              Create Dictionary
    ...                     email=${EMAIL}
    ...                     messageId=${MESSAGE_ID}

    ${response}=            GET    ${MAILSAC_URL}/text/${EMAIL}/${MESSAGE_ID}
    ...                     params=${params}
    ...                     verify=${True}
    ...                     headers=${headers}
    ...                     expected_status=200

    ${token}=    Extract Token From Content    content=${response.content}

    Log To Console    \n[B3] Capture Token: ${token} - E-mail: ${EMAIL}

    ${list_extract_token}=    Evaluate    list('${token}')

    Log To Console    \n[B3] Capture Token: ${list_extract_token}

    RETURN    ${list_extract_token}
