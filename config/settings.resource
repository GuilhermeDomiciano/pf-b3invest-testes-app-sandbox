*** Settings ***
Documentation             Settings

Library                   Collections
Library                   AppiumLibrary
Library                   RequestsLibrary


*** Variables ***
# Defaults públicos (não secretos). Segredos e overrides vêm do .env via
# keyword "Load Project Environment" (resource/tools/env_loader.py) — ADR 0004.
${PLATFORM_NAME}          android
${ENVIRONMENT}            local
${PATH_VERSIONS}          ${EXECDIR}/app/

# Local Appium
${APPIUM_SERVER_LOCAL}    http://127.0.0.1:4723
${ANDROID_APP_LOCAL}      app-cert-release.apk
${IOS_APP_LOCAL}          Runner.app

# Browserstack Appium (credenciais e app ids: .env)
${APPIUM_SERVER_BS}       https://hub-cloud.browserstack.com/wd/hub
${PROJECT_NAME_BS}        B3_APP
${BUILD_BS}               REGRESSION_ANDROID
${USERNAME_BS}            ${EMPTY}
${ACESSKEY_BS}            ${EMPTY}
${APP_IOS_BS}             ${EMPTY}
${APP_ANDROID_BS}         ${EMPTY}

# Browserstack Services (URL montada após Load Project Environment)
${BROWSERSTACK_URL}       ${EMPTY}
${BROWSERSTACK_PATH}      /app-automate/sessions/
