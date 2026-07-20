*** Settings ***
Documentation    Browserstack Capabilities

Library     ${EXECDIR}/resource/tools/env_loader.py
Library     Collections

Resource    ${EXECDIR}/config/settings.resource

*** Variables ***
${AUTOMATION_NAME_ANDROID_BS}    UIAutomator2
${PLATFORM_NAME_ANDROID_BS}      android
${AUTOMATION_NAME_IOS_BS}        XCUITest
${PLATFORM_NAME_IOS_BS}          iOS

# Defaults (override via DEVICE_NAME_BS / PLATFORM_VERSION_BS no .env)
# Android sugeridos: Samsung Galaxy S23|13.0, Google Pixel 7|13.0, Samsung Galaxy S21|12.0
# iOS sugeridos: iPhone 15|17, iPhone 14 Pro Max|16, iPhone XR|15

*** Keywords ***
Report Browserstack Session From Test
    [Documentation]    Envia pass/fail ao dashboard BS (no-op se ENVIRONMENT != bs)
    Mark Browserstack Session Status    ${TEST_STATUS}    ${TEST_MESSAGE}

Open App Browserstack Android
    [Documentation]    Open App Browserstack Android
    [Arguments]    &{DATA}

    Validate Browserstack App Id    ${DATA.PLATFORM_NAME}
    ${DEVICE}=    Resolve Browserstack Device    ${DATA.PLATFORM_NAME}
    ${DEVICE_NAME}=    Get From Dictionary    ${DEVICE}    deviceName
    ${PLATFORM_VERSION}=    Get From Dictionary    ${DEVICE}    platformVersion
    ${OPTIONS}=    Build Browserstack Options    ${TEST_NAME}

    Open Application     remote_url=${APPIUM_SERVER_BS}
    ...                  automationName=${AUTOMATION_NAME_ANDROID_BS}
    ...                  platformName=${PLATFORM_NAME_ANDROID_BS}
    ...                  deviceName=${DEVICE_NAME}
    ...                  platformVersion=${PLATFORM_VERSION}
    ...                  app=${APP_ANDROID_BS}
    ...                  disabledLocatorAutocompletion=${True}
    ...                  autoGrantPermissions=${True}
    ...                  bstack:options=${OPTIONS}

Open App Browserstack Ios
    [Documentation]    Open App Browserstack Ios
    [Arguments]    &{DATA}

    Validate Browserstack App Id    ${DATA.PLATFORM_NAME}
    ${DEVICE}=    Resolve Browserstack Device    ${DATA.PLATFORM_NAME}
    ${DEVICE_NAME}=    Get From Dictionary    ${DEVICE}    deviceName
    ${PLATFORM_VERSION}=    Get From Dictionary    ${DEVICE}    platformVersion
    ${OPTIONS}=    Build Browserstack Options    ${TEST_NAME}

    Open Application     remote_url=${APPIUM_SERVER_BS}
    ...                  automationName=${AUTOMATION_NAME_IOS_BS}
    ...                  platformName=${PLATFORM_NAME_IOS_BS}
    ...                  deviceName=${DEVICE_NAME}
    ...                  platformVersion=${PLATFORM_VERSION}
    ...                  app=${APP_IOS_BS}
    ...                  disabledLocatorAutocompletion=${True}
    ...                  autoAcceptAlerts=${True}
    ...                  fullReset=${True}
    ...                  bstack:options=${OPTIONS}

Open App Browserstack
    [Documentation]    Open App Browserstack
    [Arguments]    &{DATA}

    IF    '${DATA.PLATFORM_NAME}' == 'android'
        Log To Console    \n[APPIUM] Open App [ENV: BROWSERSTACK] [PLATFORM: Android]
        Open App Browserstack Android    &{DATA}

    ELSE IF    '${DATA.PLATFORM_NAME}' == 'ios'
        Log To Console    \n[APPIUM] Open App [ENV: BROWSERSTACK] [PLATFORM: iOS]
        Open App Browserstack Ios    &{DATA}

    ELSE
        Fail    Platform ${DATA.PLATFORM_NAME} not configured.
    END
