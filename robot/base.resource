*** Settings ***
Documentation    Base AppB3

Library      Collections
Library      AppiumLibrary
Library      RequestsLibrary

# Config
Resource     ${EXECDIR}/config/settings.resource

# Core
Resource     ${EXECDIR}/resource/core/core.resource

# Service
Resource     ${EXECDIR}/resource/service/mailsac_service.resource

# Utils
Resource     ${EXECDIR}/resource/utils/json_utils.resource

# Data
Variables    ${EXECDIR}/resource/data/users.yaml

# Functions
Resource     ${EXECDIR}/robot/functions/login/login_functions.resource
Resource     ${EXECDIR}/robot/functions/cadastro/cadastro_functions.resource
Resource     ${EXECDIR}/robot/functions/home/home_functions.resource

*** Keywords ***
Launch Application AppB3
    [Documentation]    Responsible for initializing the application

    Open AppB3    ENVIRONMENT=${ENVIRONMENT}
    ...           PLATFORM_NAME=${PLATFORM_NAME}

Close Application AppB3
    [Documentation]    Responsible for finalizing the execution of the application

    Capture Page Screenshot

    Close Application
