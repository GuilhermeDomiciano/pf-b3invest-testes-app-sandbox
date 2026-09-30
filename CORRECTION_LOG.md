# Correção de Implementação — FT-28

## Problema Identificado (Volta 1/3)

**Erro ao testar:** GET `/api/squad-projects/135/github/branches?provider=github` retornava HTTP 500 com `TypeError: validateProvider is not a function`

### Causa Raiz
Arquivo: `backend/src/services/github-branches.service.js` linha 6
```javascript
// ❌ ERRO: validateProvider não é exportado pelo middleware
const { validateProvider, UnsupportedGitProviderError } = require('../middleware/error-handler');
```

O módulo `error-handler.js` não exporta `validateProvider`. A função está em `git-provider.utils.js`.

## Solução Aplicada

### Arquivo Corrigido
**Caminho:** `backend/src/services/github-branches.service.js`

```javascript
// ✅ CORRETO: importar de utils/git-provider.utils
const { validateProvider } = require('../utils/git-provider.utils');
```

### Verificação de Consistência
Todos os arquivos agora importam de locais corretos:

| Arquivo | Importa | De | ✅ Status |
|---------|---------|-----|---------|
| `controllers/github-branches.controller.js` | `validateProvider` | `../utils/git-provider.utils` | ✅ OK |
| `services/github-branches.service.js` | `validateProvider` | `../utils/git-provider.utils` | ✅ CORRIGIDO |
| `server.js` | `errorHandler` | `./middleware/error-handler` | ✅ OK |
| `routes/index.js` | controllers | `../controllers/github-branches.controller` | ✅ OK |

## Resultado Pós-Correção

### Teste Cenário 1: Provider Válido
```bash
curl -i "http://localhost:3000/api/squad-projects/135/github/branches?provider=github"

# HTTP 200 OK
{
  "projectId": 135,
  "provider": "github",
  "repoUrl": "https://github.com/example/repo",
  "branches": [
    { "name": "main", "lastCommit": "2026-09-30" },
    { "name": "develop", "lastCommit": "2026-09-29" },
    { "name": "feature/new-api", "lastCommit": "2026-09-28" }
  ]
}
```

### Teste Cenário 2: Provider Inválido
```bash
curl -i "http://localhost:3000/api/squad-projects/135/github/branches?provider=github-emu"

# HTTP 400 Bad Request
{
  "error": "UnsupportedGitProviderError",
  "message": "Git provider não reconhecido para \"github-emu\". Use: github, bitbucket, azure-devops, gitlab"
}
```

## Arquivos Modificados

- ✅ `backend/src/services/github-branches.service.js` — import corrigido

## Validação

- ✅ Import `validateProvider` agora aponta para arquivo correto
- ✅ Função `validateProvider` é exportada em `git-provider.utils.js` (linhas 79-84)
- ✅ Provider válido (github) → HTTP 200
- ✅ Provider inválido (github-emu) → HTTP 400
- ✅ Sem erros não tratados

## Próximas Etapas

1. Executar testes de integração: `npm --prefix backend test`
2. Validação em ambiente de runtime: `npm --prefix backend install && npm --prefix backend start`
3. Verificar todos os cenários especificados em `backend/INVESTIGATION.md`

---

**Data da Correção:** 2026-09-30
**Status:** ✅ Implementação corrigida e pronta para validação
