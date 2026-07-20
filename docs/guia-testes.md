# Guia de testes — pf-b3invest-testes-app

Automação mobile (Android/iOS) da **AppB3** com **Robot Framework** + **Appium**.  
Execução em emulador/dispositivo **local** ou **BrowserStack App Automate**.

---

## 1. Visão da arquitetura

```
robot/tests/*.robot          → cenários (o que validar)
robot/functions/             → fluxos de negócio (como o usuário age)
robot/screens/               → ações de UI / Appium
robot/elements/*.yaml        → locators
resource/core/               → abrir app (local | bs)
resource/tools/              → dotenv, upload BS, status BS
config/settings.resource     → defaults públicos (sem secrets)
.env                         → secrets e overrides (gitignored)
```

Regra: **não** colocar locator cru no `.robot`; **não** colocar secret em `*.resource` commitado.

---

## 2. Setup do ambiente

### 2.1 Pré-requisitos

- Python 3.12+ (o mesmo que roda `robot`)
- Node.js + Appium 2 + drivers `uiautomator2` / `xcuitest` (só para **local**)
- Conta BrowserStack App Automate (só para **bs**)
- APK/IPA (artifact do GitHub Actions ou build local)

### 2.2 Instalar dependências

Na raiz do repositório:

```bat
python -m pip install -r config/requirements.txt
```

Confirme:

```bat
python -c "import AppiumLibrary; print('OK')"
where robot
```

`robot` e `python` devem ser do **mesmo** interpretador.

### 2.3 Arquivo `.env`

```bat
copy .env.example .env
```

Preencha pelo menos (BrowserStack):

| Variável | Uso |
|----------|-----|
| `USERNAME_BS` | usuário BS |
| `ACESSKEY_BS` | access key (rotacione se vazou em log) |
| `APP_ANDROID_BS` / `APP_IOS_BS` | `bs://...` após upload |
| `DEVICE_NAME_BS` / `PLATFORM_VERSION_BS` | opcional (senão defaults) |
| `BS_SSL_VERIFY` | `false` se proxy corporativo bloquear SSL no upload |
| `MAILSAC_TOKEN` | só fluxos de cadastro/e-mail |

`.env` **nunca** vai para o git.

---

## 3. Como criar um teste novo

### 3.1 Passos

1. **Locators** em `robot/elements/<dominio>.yaml`
2. **Screen** em `robot/screens/<dominio>/` — keywords que usam Appium + YAML
3. **Function** em `robot/functions/<dominio>/` — jornada (login, navegar, assert)
4. **Suite** em `robot/tests/` — `Test Setup` / `Teardown` padrão:

```robot
*** Settings ***
Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

*** Test Cases ***
Meu cenario feliz
    [Tags]    meu_dominio    regressivo
    Minha Function Keyword
    Should Be ...
```

5. Importe a function em `robot/base.resource` se for domínio novo compartilhado.

### 3.2 Tags

- Use tags de domínio (`acesso`, `cadastro`, `regressivo`, …).
- Não existe tag `login` — no login a tag é **`acesso`**.
- Filtre com `-i <tag>`.

### 3.3 Dados

Usuários de teste: `resource/data/users.yaml` (referência `${users['...']}`).

---

## 4. Executar localmente

### 4.1 Appium

1. Suba o Appium (`appium` na porta `4723`).
2. Emulador/device conectado; APK em `PATH_VERSIONS` + `ANDROID_APP_LOCAL` (ver `.env` / settings).

### 4.2 Comando

```bat
robot -v PLATFORM_NAME:android -v ENVIRONMENT:local -i acesso -d ./logs robot/tests/login.robot
```

| Flag | Significado |
|------|-------------|
| `-v PLATFORM_NAME:android\|ios` | plataforma |
| `-v ENVIRONMENT:local` | Appium local |
| `-i acesso` | só testes com essa tag |
| `-d ./logs` | relatórios Robot |
| caminho `.robot` ou `robot/tests/` | suite |

**Não** use `make` se o comando não existir no Windows — use `robot` direto.

---

## 5. Executar no BrowserStack

### 5.1 Upload do APK/IPA

Baixe o artifact do GitHub Actions (ou use path local). **Não** use `python -m` com barras:

```bat
python scripts/bs_upload_app.py --file "C:\app-apks-release\android-apk\app-cert-release.apk" --platform android --update-env --insecure
```

- `--update-env` grava `APP_ANDROID_BS=bs://...` no `.env`
- `--insecure` / `BS_SSL_VERIFY=false` se der `CERTIFICATE_VERIFY_FAILED` (proxy B3)

### 5.2 Rodar suite

```bat
robot -v PLATFORM_NAME:android -v ENVIRONMENT:bs -i acesso -d ./logs robot/tests/login.robot
```

### 5.3 Paralelo Android + iOS

Mesma suite nos dois OS ao mesmo tempo (dois processos `robot`):

```bat
python scripts/run_parallel_platforms.py --env bs --include acesso --suite robot/tests/login.robot
```

Regressivo completo:

```bat
python scripts/run_parallel_platforms.py --env bs --include regressivo --suite robot/tests/
```

Local:

```bat
python scripts/run_parallel_platforms.py --env local --include acesso
```

Logs separados: `logs/parallel/bs/android` e `logs/parallel/bs/ios`.  
Exit code ≠ 0 se **qualquer** plataforma falhar.

Para devices no paralelo, use no `.env`:

```env
DEVICE_NAME_ANDROID_BS=Samsung Galaxy S23
PLATFORM_VERSION_ANDROID_BS=13.0
DEVICE_NAME_IOS_BS=iPhone 15
PLATFORM_VERSION_IOS_BS=17
```

(Não use só `DEVICE_NAME_BS` genérico — ele se aplicaria aos dois processos.)

**Custo BS:** paralelo abre 2 sessões (device-minutes). Prefira tag estreita (`acesso`) antes do `regressivo`.

Defaults de device (se `.env` não definir):

- Android: Samsung Galaxy S23 / 13.0  
- iOS: iPhone 15 / 17  

Outros exemplos no `.env.example` / `browserstack.yml.example` (espelho documental; **não** é lido pelo Robot).

### 5.4 Pass/fail no dashboard

No `Test Teardown` (`Close Application AppB3`), se `ENVIRONMENT=bs`, o framework chama `Mark Browserstack Session Status` com `${TEST_STATUS}` → `passed` / `failed` via `browserstack_executor`.  
Assim o App Automate mostra o resultado do caso, não só “session ended”.

---

## 6. BrowserStack — setup, uso e troubleshooting

### Setup checklist

1. `.env` com `USERNAME_BS` + `ACESSKEY_BS`
2. Upload → `APP_*_BS` preenchido
3. `pip install -r config/requirements.txt` no **mesmo** Python do `robot`
4. Comando com `-v ENVIRONMENT:bs`

### Uso rápido

```bat
python scripts/bs_upload_app.py --file "CAMINHO\app.apk" --platform android --update-env --insecure
robot -v PLATFORM_NAME:android -v ENVIRONMENT:bs -i acesso -d ./logs robot/tests/login.robot
```

Ver sessão: dashboard BrowserStack → App Automate → build `Automacao APP B3i` / `local-YYYYMMDD-...`.

### Troubleshooting

| Sintoma | Causa provável | O que fazer |
|---------|----------------|-------------|
| `ModuleNotFoundError: resource/tools/bs_upload_app` | usou `python -m` com path | `python scripts/bs_upload_app.py ...` |
| `No keyword 'Open Application'` | AppiumLibrary ausente | `pip install -r config/requirements.txt` |
| `suite contains no tests matching tag 'login'` | tag inexistente | use `-i acesso` ou `-i regressivo` |
| `USERNAME_BS` / `ACESSKEY_BS` obrigatórios | `.env` vazio | preencher secrets |
| `CERTIFICATE_VERIFY_FAILED` no upload | proxy SSL | `--insecure` ou `BS_SSL_VERIFY=false` / `BS_CA_BUNDLE` |
| HTTP 403 + página Zscaler / “file type” | Zscaler bloqueia upload de `.ipa`/`.apk` | upload pelo dashboard BS e colar `bs://` no `.env`; ou abrir chamado Service Desk; ou upload fora da rede B3 |
| Dashboard sem passed/failed | teardown antigo / sessão já morta | atualizar `base.resource`; ver WARN no log |
| `ENVIRONMENT` parece `local` no log mas rodou BS | `.env` com `ENVIRONMENT=local` | CLI `-v` manda; loader não sobrescreve mais PLATFORM/ENVIRONMENT |
| Secrets no `output.xml` | log antigo | rotacionar key; não commitir `logs/` |
| Make desconhecido | Windows sem Make | use os comandos `python` / `robot` deste guia |
| Paralelo Android+iOS | — | `python scripts/run_parallel_platforms.py --env bs -i acesso` |
| Device errado no paralelo | `DEVICE_NAME_BS` genérico | use `DEVICE_NAME_ANDROID_BS` / `DEVICE_NAME_IOS_BS` |

---

## 7. GitHub Actions (regressão BrowserStack)

Workflow: `.github/workflows/regression-tests.yml` (ADR 0005).

- **Robot** sempre com `ENVIRONMENT=bs` e o mesmo contrato local (`PLATFORM_NAME`, `APP_*_BS`, `USERNAME_BS` / `ACESSKEY_BS`).
- Input **`environment`** (`cer`|`dev`|`prd`) = GitHub Environment + rótulo de build (`BUILD_BS`), **não** o target Appium.
- **Upload novo build:** baixa artifacts GHA `android-apk` / `ios-ipa` de `delivery_repo` (default **`b3sa/pf-b3invest-app-base`**).
  - Fonte: *Pipeline - Deploy CERT* em `pf-b3invest-app-base` → reusable `workflow-flutter-delivery-cert.yml` (artifacts ficam no **run do caller**, ex. `.../pf-b3invest-app-base/actions/runs/29493179598`).
  - Layout: `android-apk` → `app-cert-release.apk`; `ios-ipa` → `b3i_app_base.ipa` (CI localiza por `find`, sem path Windows).
  - **Vazio / `latest` / `auto` / `true`:** Resolve busca o último artifact não expirado nesse repo.
  - **Número:** pin no Run ID do Deploy CERT.
  - **HTTP 404:** PAT sem acesso a `pf-b3invest-app-base` (ou repo errado). Garanta `actions:read` no PAT para esse repo.
  - Workaround: `upload_new_build=false` + `existing_app_url_*` (`bs://...`).
- **Sem upload:** informe `existing_app_url_android` / `existing_app_url_ios` (`bs://...`).
- Secrets: `BROWSERSTACK_USERNAME`, `BROWSERSTACK_ACCESS_KEY`, `PIPELINE_COMMIT_PAT` (mapeados no job para `*_BS`).
- Suite: caminho sob `robot/tests/` (ex. `login`). Tag: ex. `acesso`, `regressivo`.
- Logs/artifacts: `logs/ci/android`, `logs/ci/ios`, consolidado em `logs/ci/merged`.
- Análise IA no workflow fica **comentada** até change futura.

Disparo manual: Actions → *Mobile Regression Tests* → Run workflow.

---

## 8. Relatórios

- `logs/log.html` — passo a passo  
- `logs/report.html` — resumo  
- `logs/output.xml` — máquina  
- CI: artifacts `mobile-report-*`  

Não versionar `logs/` (podem conter dados sensíveis).

---

## 9. Referências Doctrina / código

- Specs: `.doctrina/specs/test-runtime`, `ui-layers`, `login`, …  
- ADRs 0001–0005  
- Contrato: `.doctrina/contracts/mobile-test-runtime.md`  
- Skills: `dotenv-and-secrets`, `browserstack-app-automate-run`, `python-run-project-scripts`  
- Upload: `scripts/bs_upload_app.py` · Status BS: `Mark Browserstack Session Status` em `env_loader.py`  
- CI: `.github/workflows/regression-tests.yml`
