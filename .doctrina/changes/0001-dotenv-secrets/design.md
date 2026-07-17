# Design — Change 0001-dotenv-secrets

## Abordagem

Usar o padrão **dotenv na raiz do repo**:

| Artefato | Git | Função |
|----------|-----|--------|
| `.env.example` | sim | Catálogo de chaves + exemplos não secretos |
| `.env` | não | Valores reais do desenvolvedor/CI local |
| loader Python | sim | `load_dotenv()` + exposição a variáveis Robot |

Fluxo de boot (Suite Setup / core):

1. Carregar `.env` se existir (não falhar se ausente em `ENVIRONMENT=local` para vars só-BS, mas falhar se `ENVIRONMENT=bs` e faltarem secrets obrigatórios).
2. Mapear `os.environ` → variáveis Robot (`USERNAME_BS`, `ACESSKEY_BS`, `MAILSAC_TOKEN`, `APP_ANDROID_BS`, `APP_IOS_BS`, etc.).
3. Manter em `settings.resource` apenas defaults **não secretos** (URLs públicas, nomes de build, paths relativos).

Dependência: `python-dotenv` em `config/requirements.txt`.

Contrato `mobile-test-runtime` vira a fonte de verdade dos nomes das variáveis; `.env.example` deve espelhar a tabela Environment 1:1.

## Alternativas consideradas

1. **Pasta `.env/` com vários arquivos versionados** — risco de commit acidental de secrets; rejeitado. Preferir arquivos gitignored nomeados (`.env`, `.env.bs`) se profiles forem necessários depois.
2. **Somente variáveis de sistema / CI** sem `.env.example` — ruim para onboarding local.
3. **Secrets em YAML criptografado** — overkill para este repo de testes; dotenv resolve a dívida atual.
4. **Manter secrets em `settings.resource`** — viola non-goal do product.md e ADR 0004.

## Trade-offs e riscos

- Robot não lê `.env` nativamente → precisa de library/keyword explícita no boot (custo pequeno).
- Se alguém copiar o example com secrets reais para o git, o `.gitignore` de `.env` não protege o example — o example **nunca** deve ter valores reais.
- Typo histórico `ACESSKEY_BS` permanece como nome canônico (contrato + env) até um rename coordenado (fora desta change, ou rename explícito na mesma change se o time aceitar breaking rename → **manter ortografia atual** para não quebrar scripts).

## Decisões a registrar como ADRs

- ADR 0004 — Segredos e config via dotenv, não em resources (já aceita).
