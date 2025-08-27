*** Settings ***
Documentation             Settings

Library                   Collections
Library                   AppiumLibrary
Library                   RequestsLibrary


*** Variables ***
# Defaults:
${PLATFORM_NAME}          android
${ENVIRONMENT}            local
${PATH_VERSIONS}          ${EXECDIR}/app/

# Local Appium
${APPIUM_SERVER_LOCAL}    http://127.0.0.1:4723
${ANDROID_APP_LOCAL}      app-dev-release-14.apk
${IOS_APP_LOCAL}          Runner.app

# Browserstack Appium
${APPIUM_SERVER_BS}       https://hub-cloud.browserstack.com/wd/hub
${PROJECT_NAME_BS}        B3_APP
${BUILD_BS}               REGRESSION_ANDROID
${USERNAME_BS}            icaros_d2033
${ACESSKEY_BS}            3fd9dfsf2e09fsdsfd324dSRQD
${APP_IOS_BS}             bs://
${APP_ANDROID_BS}         bs://

# Browserstack Services
${BROWSERSTACK_URL}       https://${USERNAME_BS}:${ACESSKEY_BS}@api-cloud.browserstack.com
${BROWSERSTACK_PATH}      /app-automate/sessions/
