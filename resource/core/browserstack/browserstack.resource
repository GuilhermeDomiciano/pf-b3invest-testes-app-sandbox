*** Settings ***
Documentation    Browserstack Capabilities

Resource    ${EXECDIR}/config/settings.resource

*** Variables ***
${AUTOMATION_NAME_ANDROID_BS}    UIAutomator2
${PLATFORM_NAME_ANDROID_BS}      android
${DEVICE_NAME_ANDROID_BS}        Samsung Galaxy S.*

${AUTOMATION_NAME_IOS_BS}        XCUITest
${PLATFORM_NAME_IOS_BS}          iOS
${DEVICE_NAME_IOS_BS}            iPhone.*

${APPIUM_VERSION_BS}             2.12.1

*** Keywords ***
Open App Browserstack Android
    [Documentation]    Open App Browserstack Android
    [Arguments]    &{DATA}

    ${OPTIONS}=    Create Dictionary
    Set To Dictionary    ${OPTIONS}    userName         ${USERNAME_BS}
    Set To Dictionary    ${OPTIONS}    accessKey        ${ACESSKEY_BS}
    Set To Dictionary    ${OPTIONS}    appiumVersion    ${APPIUM_VERSION_BS}
    Set To Dictionary    ${OPTIONS}    projectName      ${PROJECT_NAME_BS}
    Set To Dictionary    ${OPTIONS}    buildName        ${BUILD_BS}
    Set To Dictionary    ${OPTIONS}    sessionName      ${TEST_NAME}

    Open Application     remote_url=${APPIUM_SERVER_BS}
    ...                  automationName=${AUTOMATION_NAME_ANDROID_BS}
    ...                  platformName=${PLATFORM_NAME_ANDROID_BS}
    ...                  deviceName=${DEVICE_NAME_ANDROID_BS}
    ...                  app=${APP_ANDROID_BS}
    ...                  disabledLocatorAutocompletion=${True}
    ...                  autoGrantPermissions=${True}
    ...                  bstack:options=${OPTIONS}

Open App Browserstack Ios
    [Documentation]    Open App Browserstack Ios
    [Arguments]    &{DATA}

    ${OPTIONS}=    Create Dictionary
    Set To Dictionary    ${OPTIONS}    userName         ${USERNAME_BS}
    Set To Dictionary    ${OPTIONS}    accessKey        ${ACESSKEY_BS}
    Set To Dictionary    ${OPTIONS}    appiumVersion    ${APPIUM_VERSION_BS}
    Set To Dictionary    ${OPTIONS}    projectName      ${PROJECT_NAME_BS}
    Set To Dictionary    ${OPTIONS}    buildName        ${BUILD_BS}
    Set To Dictionary    ${OPTIONS}    sessionName      ${TEST_NAME}

    Open Application     remote_url=${APPIUM_SERVER_BS}
    ...                  automationName=${AUTOMATION_NAME_IOS_BS}
    ...                  platformName=${PLATFORM_NAME_IOS_BS}
    ...                  deviceName=${DEVICE_NAME_IOS_BS}
    ...                  app=${APP_IOS_BS}
    ...                  disabledLocatorAutocompletion=${True}
    ...                  autoAcceptAlerts=${True}
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
