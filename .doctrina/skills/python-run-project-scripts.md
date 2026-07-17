---
name: python-run-project-scripts
description: Invocar scripts Python deste repo no Windows sem python -m em caminhos com barra (evita ModuleNotFoundError).
when: O agente ou o usuário vê ModuleNotFoundError ao rodar bs_upload_app / scripts em resource/tools, ou tenta python -m com caminho .py.
---

# Skill — python-run-project-scripts

## When to use this skill

- Erro: `ModuleNotFoundError: No module named 'resource/tools/bs_upload_app'`
- Alguém rodou `python -m resource/tools/bs_upload_app.py`
- Precisa documentar ou executar upload BS / utilitários Python do repo no Windows

## Procedure

1. **Nunca** use `python -m` com caminho de arquivo (`barra` + `.py`).
2. Comandos corretos (a partir da raiz do repo):
   ```bat
   python scripts/bs_upload_app.py --file "C:\caminho\app.apk" --platform android --update-env
   python resource\tools\bs_upload_app.py --file "C:\caminho\app.apk" --platform android --update-env
   make upload-bs-android APP_FILE="C:\caminho\app.apk"
   ```
3. Preferir o launcher `scripts/bs_upload_app.py` (nome sem colisão com o pacote/`resource`).
4. Garantir `USERNAME_BS` e `ACESSKEY_BS` preenchidos no `.env` antes do upload.
5. Garantir `USERNAME_BS` e `ACESSKEY_BS` preenchidos no `.env` antes do upload.
6. Se ainda falhar: `pip install -r config/requirements.txt` (precisa `requests` e `python-dotenv`).
7. Se `CERTIFICATE_VERIFY_FAILED` (proxy B3): use `BS_CA_BUNDLE` no `.env` ou `BS_SSL_VERIFY=false` / `--insecure`.

## Anti-patterns

- `python -m resource/tools/bs_upload_app.py`
- `python -m resource/tools/bs_upload_app` (pode conflitar com o módulo stdlib `resource` em Unix)
- Assumir que o Make no PowerShell usa a mesma shell que o Git Bash sem testar
- Desligar SSL (`--insecure`) em máquina pessoal sem necessidade

## Related material

- `scripts/bs_upload_app.py`
- `resource/tools/bs_upload_app.py`
- Skill `browserstack-app-automate-run`
- `docs/README.md`
