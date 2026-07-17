# Design — Change 0005-github-actions-regression

## Approach (após OK do humano)

Reusar a **forma** do workflow proposto (dispatch/call, jobs android/ios, upload opcional, artifacts), trocando a **integração** pelo contrato já usado localmente:

```text
robot -v PLATFORM_NAME:android -v ENVIRONMENT:bs -i <tag> -d ./logs robot/tests/
```

No job CI, gerar `.env` (ou `-v`) com:

- `USERNAME_BS` / `ACESSKEY_BS` (secrets mapeados)
- `APP_ANDROID_BS` ou `APP_IOS_BS` (do upload ou input)
- `DEVICE_NAME_ANDROID_BS` / `PLATFORM_VERSION_ANDROID_BS` (e iOS)
- `ENVIRONMENT` fixo `bs` no Robot; `cer|dev|prd` só como GitHub Environment / nome de build

Upload: preferir `python scripts/bs_upload_app.py --file ... --platform ...` no runner self-hosted (mesmo código do local). Fallback curl só se necessário.

## Alternatives considered

- Adaptar o Robot ao contrato do YAML antigo (`APP_URL`, `tests/mobile/`) — rejeitado: quebra o runtime local e o Doctrina já estabilizado.
- Manter o YAML “as-is” e documentar como aspiracional — rejeitado para merge: daria falsa impressão de CI funcional.

## Trade-offs and risks

- Cross-repo artifact + PAT: depende do delivery.
- `robot || true` no draft atual mascara falha — remover.
- Zscaler: runner AKS pode ou não bloquear upload; validar no primeiro run.

## Decisions to record as ADRs

- Possível: “CI usa o mesmo contrato de variáveis do runtime local (dotenv / Robot vars)” — só se a adaptação for adiante.
