# Intake — pf-b3invest-testes-app

- **Status:** converted
- **Date:** 2026-07-16
- **Source:** DOCTRINA_INTAKE_DRAFT.md

<!-- Raw project intent, stored verbatim. The bootstrap playbook
     (doctrina intake) converts it into product.md and capability
     specs, then flips Status to converted. After conversion the
     specs are the only source of truth; never edit this file to
     change requirements. -->

---

# DOCTRINA_INTAKE_DRAFT — pf-b3invest-testes-app

Draft de intake inferido do repositório (README, estrutura, código e docs).
Itens sem evidência no repo estão marcados como **desconhecido**.
Não inventar além do que está no código/documentação local.

---

## 1. O que o projeto é

Repositório de **automação de testes mobile** (Android e iOS) do aplicativo **B3 Invest** (`AppB3`), com base de código única, usando **Robot Framework** + **Appium**.

Evidência: `docs/README.md`, `catalog-info.yaml` (`name: testes-app`, `system: b3-investidor`, `domain: pf`), keywords `Open AppB3` / `Launch Application AppB3` em `resource/core/` e `robot/base.resource`.

Lifecycle no Backstage: **experimental**.

---

## 2. Problema que resolve

Automatizar testes de aceitação/regressão da app mobile B3 Invest em **emulador/dispositivo local** e em **BrowserStack**, com separação entre locators (YAML), ações de UI (screens), lógica de fluxo (functions) e casos de teste (`.robot`).

Evidência: `docs/README.md` (estrutura e best practices), `makefile` (targets `run-local-*` / `run-bs-*`), `resource/core/core.resource` (ambientes `local` e `bs`).

---

## 3. Stack

| Camada | Evidência no repo | Valor |
|--------|-------------------|--------|
| Linguagem | `config/requirements.txt`, scripts `.py` em `resource/` | **Python** |
| Framework de teste | `config/requirements.txt`, `robot/**/*.robot` | **Robot Framework** |
| Automação mobile | `AppiumLibrary`, `Appium-Python-Client`, drivers UiAutomator2 / XCUITest (docs) | **Appium** |
| Execução paralela | `robotframework-pabot` + docs (`pabot ... -i gmud`) | **Pabot** |
| Cloud devices | `resource/core/browserstack/`, `config/settings.resource` | **BrowserStack App Automate** |
| HTTP / APIs auxiliares | `RequestsLibrary`, `JSONLibrary` | Chamadas HTTP (ex.: Mailsac) |
| Dados / fixtures | `pyyaml`, `resource/data/users.yaml`, YAML em `robot/elements/` | **YAML** |
| Utilitários Python | `openpyxl`, `pandas`, `Faker`, `python-dateutil`, libs RF Excel/DataDriver | Suporte a dados/planilhas |
| Lint RF | `pyproject.toml` (`[tool.robocop]`), `robotframework-robocop` | **Robocop** |
| Docs internas | `mkdocs.yml`, `docs/` | **MkDocs** + TechDocs (Backstage) |
| Orquestração local | `makefile` | Make targets para local/BS Android/iOS |
| Node (tooling Appium) | `docs/README.md` / README (install Appium via npm) | **Node.js** (pré-requisito de ambiente, não app do repo) |
| Banco de dados | Nenhum schema/código de DB; CODEOWNERS menciona `ad/*.sql` mas pasta não existe | **desconhecido** / não aplicável ao código atual |
| Infra / CI | Sem `.github/workflows/`; `catalog-info` aponta SonarQube e Backstage | **desconhecido** (pipeline Ultron citado só no CODEOWNERS) |
| Behave / Selenium / Locust | Citados no README raiz; **não há** pastas `features/`, dependências nem código correspondente | **Não usados no código atual** (README desatualizado) |

---

## 4. Usuários-alvo

Inferidos do propósito e ownership (não há persona documentada em `product.md`):

- **Time de QA / automação** que escreve e executa testes da app B3 Invest.
- **Owner Backstage:** `g_p_apl_alm_squad_0049_github` (`catalog-info.yaml`).
- **App sob teste:** investidores pessoa física via app B3 Invest (cenários CPF/CNPJ, carteira, proventos, etc.) — o consumidor final da app; o consumidor direto deste repo é o time de testes.

Persona detalhada / papéis de negócio além disso: **desconhecido**.

---

## 5. Principais capabilities / módulos existentes

Lista apenas (sem detalhar). Organizados pela estrutura real do repo.

### Camada de testes (`robot/tests/`)

- login
- cadastro
- quiz
- home
- wallet (carteira, produtos, classes, instituições, outros produtos/instituições, detalhes renda fixa/variável/internacional/instituição)
- earnings (radar, recebidos, a receber + filtros)
- statement (extrato)
- stock (mercado / Ibovespa)

### Screens (`robot/screens/`)

- cadastro, earnings, home, login, statement, stock, walkthrough, wallet

### Functions (`robot/functions/`)

- cadastro, earnings, home, login, statement, stock, wallet

### Elements / locators (`robot/elements/*.yaml`)

- cadastro, class, detail_classe, earnings, earnings_filter, home, institute, login, other_institution, other_products, product, quiz, statement, stock_market, walkthrough, wallet

### Infra de automação (`resource/`, `config/`)

- core local / BrowserStack
- services: Mailsac (e-mail de teste), exclude_register (stub/manual)
- utils: element_utils, json_utils, regex_money_utils
- tools: regex_tools.py
- data: users.yaml
- settings: `config/settings.resource`, `config/requirements.txt`
- base: `robot/base.resource`

### Meta / plataforma

- Backstage / TechDocs (`catalog-info.yaml`, `mkdocs.yml`)
- Doctrina scaffolding (`.doctrina/`, `AGENTS.md`) — product.md ainda template vazio

---

## 6. Dívida técnica / problemas conhecidos (com evidência)

1. **README raiz desatualizado / inconsistente** — descreve Behave, Selenium, Locust, estrutura `features/`, `config.yaml`, `browserstack.yaml` e comandos `behave` / `browserstack-sdk`; o código real é Robot Framework + Appium em `robot/` + `resource/`. A segunda metade do README e `docs/README.md` batem com o código.

2. **Credenciais hardcoded** — username/access key BrowserStack e token Mailsac em `config/settings.resource` e `resource/service/mailsac_service.resource` (risco de vazamento; não repetidos aqui).

3. **Makefile com variável inconsistente** — define `LOGS_DIR` mas usa `$(LOG_DIR)` nos targets.

4. **Exclusão de cadastro incompleta** — `exclude_register_service.resource` só loga lembrete; comentário pede API de backend (“Joao Vitor…”).

5. **TODOs / gaps em testes (comentários no código):**
   - Filtros com **accessibility/código Flutter não visível** para clique (vários `wallet_details_*.robot`).
   - Casos **fora do MVP** ou “saiu do MVP, validar quando voltar” (`home.robot` open finance; `wallet.robot` botões de ação / divulgação de resultados).
   - Validação de **gráficos** linha/barra pendente (`wallet_screen.resource`).
   - **Ordenação de lista** não extraída (`product_wallet.robot`).
   - **Load more** de instituições precisa de usuário com >3 instituições (`institution_wallet.robot`).
   - Validação de **data de hoje** em proventos a receber (`earnings_to_receive.robot`).
   - CA03 “não tem como testar” (`wallet_details_rendaFixa.robot`).
   - Lógica de atributo **disabled** a ajustar (`wallet_details_screnn.resource` — nome do arquivo também com typo `screnn`).

6. **Swipes com coordenadas absolutas** — vários recursos usam pixels fixos (`element_utils.resource`, screens), frágeis entre dispositivos.

7. **CI/CD no repo** — sem workflows GitHub Actions versionados; automação de pipeline: **desconhecido**.

8. **Pasta `app/`** referenciada (`PATH_VERSIONS` / APKs) mas não presente no tree versionado: **desconhecido** se fica só local/artefato externo.

---

## 7. Metas próximas

Não há arquivo de roadmap nem board no repo.

### Inferido de TODOs / tags / docs (não é roadmap oficial)

- Reabilitar / completar cenários que “sairam do MVP” (ações da carteira, divulgação de resultados, open finance).
- Resolver interação com filtros onde locators Flutter não aparecem.
- Completar validações de gráficos, ordenação, load more, data de proventos.
- Implementar exclusão real de cadastro via API (hoje só lembrete no log).
- Alinhar documentação raiz à stack Robot/Appium.

### Issues abertas no GitHub

**desconhecido** — CLI `gh` indisponível neste ambiente; não há pasta de issues no repo; nenhum arquivo `ROADMAP.md` / `TODO.md` na raiz.

Tags de ticket Jira/PFSAPP aparecem em tags de teste (ex.: `PFSAPP-628`), mas o status desses itens no Jira: **desconhecido**.

---

## 8. Estrutura de pastas (visão atual)

```
pf-b3invest-testes-app/
├── robot/           # tests, screens, functions, elements, base.resource
├── resource/        # core (local/BS), service, utils, tools, data
├── config/          # settings.resource, requirements.txt
├── docs/            # TechDocs / README técnico
├── .github/         # CODEOWNERS apenas (sem workflows)
├── .doctrina/       # framework Doctrina (ainda em bootstrap)
├── makefile
├── pyproject.toml   # Robocop
├── catalog-info.yaml
├── mkdocs.yml
├── README.md
└── AGENTS.md
```

---

## 9. Como executar (evidência)

```bash
pip install -r config/requirements.txt
# Appium server local + drivers uiautomator2 / xcuitest (docs)

robot -v PLATFORM_NAME:android -v ENVIRONMENT:local -i home -d ./logs robot/tests/
# ou makefile: run-local-android | run-local-ios | run-bs-android | run-bs-ios
# regressivo paralelo (docs): pabot ... -i gmud robot/tests/
```

Tag default no makefile: `regressivo`.

---

## Fontes consultadas

- `README.md`, `docs/README.md`, `docs/index.md`
- `catalog-info.yaml`, `makefile`, `mkdocs.yml`, `pyproject.toml`, `config/requirements.txt`, `config/settings.resource`
- `robot/`, `resource/`, `.github/CODEOWNERS`
- Grep por TODO/FIXME/MVP/roadmap no código
- Issues remotas: não consultáveis (`gh` ausente)
)
