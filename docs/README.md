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

Antes de rodar (local ou BrowserStack), configure o ambiente:

```
copy .env.example .env
# edite .env com USERNAME_BS, ACESSKEY_BS, MAILSAC_TOKEN, etc.
pip install -r config/requirements.txt
```

O `.env` é gitignored (ADR 0004). Não coloque secrets em `config/settings.resource`.

Espelho opcional das caps BS (não usado na execução): `browserstack.yml.example`.

### Execução local

    robot -v PLATFORM_NAME:android -v ENVIRONMENT:local -i home -d ./logs robot/tests/

    make run-local-android
    make run-local-ios TAGS=login

### BrowserStack App Automate

1. Preencha `USERNAME_BS` e `ACESSKEY_BS` no `.env`.
2. Baixe o APK/IPA do artifact do GitHub Actions (ou use o binário local).
3. Faça upload no BrowserStack e grave o `bs://` no `.env`:

```
python scripts/bs_upload_app.py --file ./app/seu-app.apk --platform android --update-env
# ou
make upload-bs-android APP_FILE=./app/seu-app.apk

python scripts/bs_upload_app.py --file ./app/seu-app.ipa --platform ios --update-env
```

No Windows, **não** use `python -m resource/tools/bs_upload_app.py` (gera `ModuleNotFoundError`). Use `python scripts/bs_upload_app.py ...`.

4. (Opcional) Escolha device no `.env`:

```
DEVICE_NAME_BS=Samsung Galaxy S23
PLATFORM_VERSION_BS=13.0
# iOS ex.: DEVICE_NAME_BS=iPhone 15  PLATFORM_VERSION_BS=17
```

Defaults se vazio: Android `Samsung Galaxy S23` / `13.0` · iOS `iPhone 15` / `17`.

5. Rode smoke (tag estreita) e depois o regressivo:

```
make run-bs-android TAGS=login
make run-bs-ios TAGS=login

robot -v PLATFORM_NAME:android -v ENVIRONMENT:bs -i login -d ./logs robot/tests/
```

`BUILD_NUMBER` (CI) ou `BUILD_BS` definem o build no dashboard; se ambos vazios, o loader usa `local-YYYYMMDD-HHmmss`.
`PROJECT_NAME_BS` default: `Automacao APP B3i`. Flags `BS_DEBUG`, `BS_NETWORK_LOGS`, `BS_APP_PROFILING` default `true`.

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

B3 Invest Test Automation

This repository contains automated tests for the B3 Invest mobile application using Robot Framework and Appium. The project is organized for maintainability, scalability, and clear separation of UI actions, business logic, and test cases.

Project Structure

pf-b3invest-testes-app/
├── robot/
│   ├── tests/
│   │   ├── wallet.robot
│   │   ├── product_wallet.robot
│   │   ├── class_wallet.robot
│   │   ├── institution_wallet.robot
│   ├── screens/
│   │   └── wallet/
│   │       ├── wallet_screen.resource
│   │       ├── class_screen.resource
│   │       ├── institution_screen.resource
│   ├── functions/
│   │   └── wallet/
│   │       ├── wallet_functions.resource
│   │       ├── product_functions.resource
│   │       ├── class_functions.resource
│   │       ├── institution_functions.resource
│   ├── elements/
│   │   ├── wallet.yaml
│   │   ├── product.yaml
│   │   ├── class.yaml
│   │   ├── institute.yaml
├── resource/
│   └── utils/
│       └── element_utils.resource
├── config/
│   └── requirements.txt
│   └── settings.resource
├── docs/
│   └── README.md

Key Technologies

* Robot Framework: Test automation framework for acceptance testing.
* Appium: Mobile automation for Android and iOS.
* YAML: Used for element locator definitions.
* Python: For custom libraries and environment setup.

How It Works

* Element Locators: Defined in YAML files under /Users/user/Documents/B3-APP/pf-b3invest-testes-app/robot/elements/
* Screen Keywords: UI actions and navigation in /Users/user/Documents/B3-APP/pf-b3invest-testes-app/robot/screens/wallet/
* Business Logic: High-level flows and validations in /Users/user/Documents/B3-APP/pf-b3invest-testes-app/robot/functions/wallet/
* Test Cases: Organized by feature in /Users/user/Documents/B3-APP/pf-b3invest-testes-app/robot/tests/

Running Tests

1. Install dependencies
pip install -r config/requirements.txt

2. Start Appium server
appium

3. Run tests
robot robot/tests/wallet.robot

Best Practices

* Use fully qualified keyword names if there are duplicates (e.g., product_functions.Validate Access All Products Button Section Screen Wallet).
* Avoid circular imports between resource files.
* Keep UI actions, business logic, and test cases separated for maintainability.
* Use tags in test cases for easy filtering and reporting.

Troubleshooting

* Device offline / instrumentation crashed: Restart emulator/device and Appium server.
* Keyword not found: Check resource imports and spelling.
* Circular import warning: Refactor resource imports to avoid loops.

Contributing

* Fork the repository and create a feature branch.
* Add or update tests and resources as needed.
* Submit a pull request with a clear description of changes.