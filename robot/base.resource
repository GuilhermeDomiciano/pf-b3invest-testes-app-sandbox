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
Resource     ${EXECDIR}/resource/service/exclude_register_service.resource

# Utils
Resource     ${EXECDIR}/resource/utils/json_utils.resource

# Data
Variables    ${EXECDIR}/resource/data/users.yaml

# Functions
Resource     ${EXECDIR}/robot/functions/login/login_functions.resource
Resource     ${EXECDIR}/robot/functions/cadastro/cadastro_functions.resource
Resource     ${EXECDIR}/robot/functions/home/home_functions.resource
Resource     ${EXECDIR}/robot/functions/wallet/wallet_functions.resource
Resource     ${EXECDIR}/robot/functions/wallet/product_functions.resource
Resource     ${EXECDIR}/robot/functions/wallet/class_functions.resource
Resource     ${EXECDIR}/robot/functions/wallet/institution_functions.resource
Resource     ${EXECDIR}/robot/functions/wallet/wallet_details.resource
Resource     ${EXECDIR}/robot/functions/noticias/noticias_functions.resource

*** Keywords ***
Launch Application AppB3
    [Documentation]    Responsible for initializing the application

    # Segredos/overrides: .env via env_loader (ADR 0004) — chamado em Open AppB3
    Open AppB3    ENVIRONMENT=${ENVIRONMENT}
    ...           PLATFORM_NAME=${PLATFORM_NAME}

Close Application AppB3
    [Documentation]    Responsible for finalizing the execution of the application

    # Reporta passed/failed no dashboard App Automate (no-op se não for bs)
    Run Keyword And Ignore Error    Report Browserstack Session From Test

    Run Keyword And Ignore Error    Capture Page Screenshot

    Run Keyword And Ignore Error    Close Application
