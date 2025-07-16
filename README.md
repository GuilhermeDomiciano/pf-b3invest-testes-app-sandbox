This is a project to automate Android and iOS mobile applications using a single code base with Robot Framework and the Appium library.

## Install
1. Download and Install [XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12 "XCode")

2. Download and Install [Android Studio](https://developer.android.com/codelabs/basic-android-kotlin-compose-install-android-studio "Android Studio")

3. Download and Install [Python](https://www.python.org/downloads/ "Python")

4. Download and Install [Nodejs](https://nodejs.org/en/download "Nodejs")

5. Check Python installation
    `python3 -V`

6. Install [pip](https://pip.pypa.io/ "pip")
    `pip3 -V`

7. Install Appium 2.0
    `npm i -g appium@next`

8. Install Appium Doctor
   `npm i -g appium-doctor`

9. Check Appium installation
   `appium-doctor`

10. Install Robot Framework
    `pip3 install robotframework`

11. Install Appium Library
    `pip3 install robotframework-appiumlibrary`

12. Download and install VSCode [VSCode](https://code.visualstudio.com/docs/?dv=osx "VSCode")

13. Install [Robot Code](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode "Robot Code") extension from VSCode's Marketplace

14. Install Appium Drivers 
    `appium driver install uiautomator2`
    `appium driver install xcuitest`

## Usage
The basic usage is giving a path to a test (or task) file or directory as an
argument with possible command line options before the path

    robot -v PLATFORM_NAME:android -v ENVIRONMENT:local -i home -d ./logs robot/tests/

"***-v***" refers to the variables. To replace a declared value within the code, you can specify a variable name and value.

"***-i***" refers to the tags. To run only a selected group of tests, you may specify a tag name.

"***-d***" refers to the test results. The location to save the test results can be specified here.

Another possibility is to execute the necessary parameters in the terminal:

    robot -v PLATFORM_NAME:android -v ENVIRONMENT:local -i TAG -d ./logs robot/tests/

To run the regressive you must send these required parameters:

    pabot --testlevelsplit --pabotlib -v PLATFORM_NAME:android -v ENVIRONMENT:local -d ./logs -i gmud robot/tests/

## Help Robot Framework
Run ``robot --help`` and ``rebot --help`` for more information about the command
line usage. For a complete reference manual see [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html "Robot Framework User Guide").
