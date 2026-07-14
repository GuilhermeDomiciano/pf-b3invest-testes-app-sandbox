*** Settings ***
Documentation    Local Capabilities

Resource    ${EXECDIR}/config/settings.resource

*** Variables ***
${AUTOMATION_NAME_ANDROID_LOCAL}    UIAutomator2
${PLATFORM_NAME_ANDROID_LOCAL}      android
${DEVICE_NAME_ANDROID_LOCAL}        Samsung Galaxy S.*
${UDID_LOCAL}                       emulator-5554

${AUTOMATION_NAME_IOS_LOCAL}        XCUITest
${PLATFORM_NAME_IOS_LOCAL}          iOS
${DEVICE_NAME_IOS_LOCAL}            iPhone 16 Pro
${PLATFORM_VERSION_LOCAL}           18.6

*** Keywords ***
Open App Local Android
    [Documentation]    Open App Local Android
    [Arguments]    &{DATA}

    Open Application      remote_url=${APPIUM_SERVER_LOCAL}
    ...                   automationName=${AUTOMATION_NAME_ANDROID_LOCAL}
    ...                   platformName=${PLATFORM_NAME_ANDROID_LOCAL}
    ...                   app=${PATH_VERSIONS}${ANDROID_APP_LOCAL}
    ...                   deviceName=${DEVICE_NAME_ANDROID_LOCAL}
    ...                   disableIdLocatorAutocompletion=${True}
    # ...                   adbExecTimeout=60000
    # ...                   androidInstallTimeout=90000
    # ...                   appWaitTimeout=60000
    # ...                   autoGrantPermissions=${True}
    # ...                   fullReset=${True}
    # ...                   noReset=${False}

Open App Local Ios
    [Documentation]    Open App Local Ios
    [Arguments]    &{DATA}

    Open Application      remote_url=${APPIUM_SERVER_LOCAL}
    ...                   automationName=${AUTOMATION_NAME_IOS_LOCAL}
    ...                   platformName=${PLATFORM_NAME_IOS_LOCAL}
    ...                   app=/Users/user/Documents/pf-b3invest-testes-app/app/iphonesimulator/${IOS_APP_LOCAL}
    ...                   deviceName=${DEVICE_NAME_IOS_LOCAL}
    ...                   platformVersion=${PLATFORM_VERSION_LOCAL}
    ...                   showXcodeLog=${True}

Open App Local
    [Documentation]    Open App Local
    [Arguments]    &{DATA}

    IF    '${DATA.PLATFORM_NAME}' == 'android'
        Log To Console    \n[APPIUM] Open App [ENV: LOCAL] [PLATFORM: Android]
        Open App Local Android    &{DATA}

    ELSE IF    '${DATA.PLATFORM_NAME}' == 'ios'
        Log To Console    \n[APPIUM] Open App [ENV: LOCAL] [PLATFORM: iOS]
        Open App Local Ios    &{DATA}

    ELSE
        Fail    Platform ${DATA.PLATFORM_NAME} not configured.
    END
