# pf-b3invest-testes-app

Automação de testes app, desenvolvido em Python, utilizando as bibliotecas Selenium, Behave e o BrowserStack-SDK, Appium, locust Este projeto fornece uma estrutura organizada e pronta para uso, permitindo que você crie e execute testes automatizados de forma eficiente em diferentes navegadores e dispositivos.

## Características Principais

* **Behave Integration** : Utilize o Behave para escrever testes BDD (Behavior-Driven Development) de maneira fácil e compreensível.
* **Selenium WebDriver** : Integre facilmente o Selenium WebDriver para interagir com os elementos da web e simular ações do usuário.
* **Cross-browser Testing com BrowserStack** : Teste sua aplicação em vários navegadores e dispositivos usando o BrowserStack, garantindo a compatibilidade em diferentes ambientes.
* **Appium : Para a integração dos com App mobile local
* **Locust: Para os testes de carga
* **Estrutura Organizada** : Siga uma estrutura clara e modular para organizar seus testes e scripts de automação.

## Pré-requisitos

Antes de começar, certifique-se de ter instalado o Python em seu ambiente. Além disso, é necessário instalar as dependências do projeto, o que pode ser feito executando o seguinte comando:

<pre><div class="bg-black rounded-md"><div class="flex items-center relative text-gray-200 bg-gray-800 gizmo:dark:bg-token-surface-primary px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>bash</span><button class="flex ml-auto gizmo:ml-0 gap-2 items-center"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="icon-sm" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs language-bash">pip install -r requirements.txt
</code></div></div></pre>

## Configuração do BrowserStack

1. Crie uma conta no [BrowserStack](https://www.browserstack.com/).
2. Obtenha suas credenciais de acesso.
3. Substitua as informações no arquivo `config.yaml` com suas credenciais.

<pre><div class="bg-black rounded-md"><div class="flex items-center relative text-gray-200 bg-gray-800 gizmo:dark:bg-token-surface-primary px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>yaml</span><button class="flex ml-auto gizmo:ml-0 gap-2 items-center"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="icon-sm" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs language-yaml">browserstack:
  username: SEU_USERNAME
  access_key: SUA_CHAVE_DE_ACESSO
</code></div></div></pre>

## Estrutura do Projeto

<pre><div class="bg-black rounded-md"><div class="flex items-center relative text-gray-200 bg-gray-800 gizmo:dark:bg-token-surface-primary px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>plaintext</span><button class="flex ml-auto gizmo:ml-0 gap-2 items-center"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="icon-sm" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs language-plaintext">pf-b3-investidor-b3i-testes-front/
|   |-- .github/
|       |--workflow/
|           |--workflow.yml
|-- features/
|   |-- mapeamento/
|       |-- map_exemple.py
|   |-- steps/
|       |-- steps_exemple.py
|       |-- environment.py
|-- pages/
|   |-- pages_exemple.py
|-- .gitignore
|-- config.yaml
|-- browserstack.yaml
|-- mkdocs.yaml
|-- catalog-info.yaml
|-- requirements.txt
|-- README.md
</code></div></div></pre>

* **features/steps** : Contém os arquivos de passos para os cenários do Behave.
* **drivers** : Armazena o arquivo `chromedriver.py`
* **pages** : Pasta opcional para testes adicionais usando o Selenium diretamente, sem Behave.
* **.gitignore** : Arquivo para especificar quais arquivos e pastas devem ser ignorados pelo Git.
* **config.yaml** : Arquivo de configuração para variaveis.
* **browserstack.yaml** : Arquivo de configuração para suas credenciais do BrowserStack.
* **requirements.txt** : Lista de dependências do projeto.

## Executando os Testes

Para executar os testes, utilize o seguinte comando no terminal:

<pre><div class="bg-black rounded-md"><div class="flex items-center relative text-gray-200 bg-gray-800 gizmo:dark:bg-token-surface-primary px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>bash</span><button class="flex ml-auto gizmo:ml-0 gap-2 items-center"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="icon-sm" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs language-bash">behave
browserstack-sdk
</code></div></div></pre>

Isso executará todos os cenários de teste definidos na pasta `features`.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests para melhoraria continua.


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

