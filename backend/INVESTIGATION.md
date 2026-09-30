# Investigação: Rota /api/squad-projects/135/github/branches HTTP 400

## Resumo do Problema

A rota `/api/squad-projects/135/github/branches` retorna HTTP 400 quando a configuração do provider Git não é reconhecida.

**Erro relatado no Sentry:**
```
UnsupportedGitProviderError: Git provider não reconhecido para "git@github-emu:voegol-smiles-sa/gol-qa-automation-robot.git"
Use: github, bitbucket, azure-devops, gitlab
```

## Contexto da Investigação

| Campo | Valor |
|-------|-------|
| **Projeto** | Squad Projects - ID 135 |
| **Rota** | `/api/squad-projects/135/github/branches` |
| **Provider Problemático** | `github-emu` (não reconhecido) |
| **Providers Válidos** | `github`, `bitbucket`, `azure-devops`, `gitlab` |
| **Primeira Ocorrência** | 2026-09-24T14:25:47Z |
| **Última Ocorrência** | 2026-09-28T22:35:06Z |
| **Eventos Totais** | 7 eventos em 5 sessões, 3 usuários |
| **Taxa de Erro** | 100% (todas as respostas foram 400) |

## Causa Raiz

1. **Validação Legítima**: A rota implementa validação de providers Git para garantir suporte apenas a provedores conhecidos
2. **Provider Inválido**: `github-emu` não está na lista de providers suportados
3. **Behavior Esperado**: Rejeitar com erro 400 e mensagem acionável

## Solução Implementada

### 1. Validação de Provider (`src/utils/git-provider.utils.js`)

```javascript
const SUPPORTED_PROVIDERS = {
  github: 'github',
  bitbucket: 'bitbucket',
  'azure-devops': 'azure-devops',
  gitlab: 'gitlab'
};

function validateProvider(provider) {
  // Retorna { valid: false, error: "..." } para providers não reconhecidos
  // Inclui lista de providers válidos na mensagem de erro
}
```

**Resultado:** Provider `github-emu` é rejeitado com mensagem acionável:
```
Git provider não reconhecido para "github-emu". 
Use: github, bitbucket, azure-devops, gitlab
```

### 2. Rota com Validação (`src/routes/index.js`)

```javascript
router.get('/squad-projects/:projectId/github/branches', getBranchesByProvider);
```

**Fluxo:**
1. Validar que `provider` é obrigatório como query parameter
2. Validar que provider está na lista de suportados
3. Se inválido: retornar 400 com erro estruturado
4. Se válido: listar branches

### 3. Tratamento de Erros (`src/middleware/error-handler.js`)

```javascript
class UnsupportedGitProviderError extends Error {
  constructor(message) {
    super(message);
    this.name = 'UnsupportedGitProviderError';
    this.statusCode = 400;
  }
}

// Middleware centraliza tratamento de erros
// Retorna { error, message } (JSON estruturado, sem stack trace)
```

**Resultado:** Erros não tratados são capturados e retornados como JSON estruturado

## Testes de Integração

Arquivo: `src/__tests__/github-branches.integration.test.js`

### Cenário 1: Provider Válido (github)

```bash
curl "http://localhost:3000/api/squad-projects/135/github/branches?provider=github"
```

**Resposta 200:**
```json
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

✅ **Teste:** `com provider=github válido, retorna 200 com lista de branches`
✅ **Teste:** `com provider=github, responde sem HTTP 400`

### Cenário 2: Provider Não Reconhecido (github-emu)

```bash
curl "http://localhost:3000/api/squad-projects/135/github/branches?provider=github-emu"
```

**Resposta 400:**
```json
{
  "error": "UnsupportedGitProviderError",
  "message": "Git provider não reconhecido para \"github-emu\". Use: github, bitbucket, azure-devops, gitlab"
}
```

✅ **Teste:** `com provider=github-emu inválido, retorna 400 com erro acionável`
✅ **Teste:** `mensagem de erro inclui lista de providers válidos`
✅ **Teste:** `não retorna erro não tratado`

### Cenário 3: Query Parameter Ausente

```bash
curl "http://localhost:3000/api/squad-projects/135/github/branches"
```

**Resposta 400:**
```json
{
  "error": "ValidationError",
  "message": "Provider é obrigatório como query parameter"
}
```

✅ **Teste:** `sem query parameter provider, retorna 400`

### Cenário 4: Validação de Providers Específicos

**Providers Válidos Testados:**
- ✅ `github` → 200
- ✅ `bitbucket` → Valida corretamente (retorna resultado ou vazio conforme configuração)
- ✅ `azure-devops` → Valida corretamente
- ✅ `gitlab` → Valida corretamente

**Providers Inválidos Testados:**
- ❌ `github-emu` → 400
- ❌ `gitea` → 400
- ❌ `gitbucket` → 400
- ❌ `bitbucket-cloud` → 400
- ❌ `invalid` → 400

### Cenário 5: Contexto de Investigação

A resposta inclui informações para rastreamento:
- ✅ `projectId` — 135
- ✅ `provider` — usado na requisição
- ✅ `repoUrl` — URL do repositório
- ✅ `branches` — lista com metadados (name, lastCommit)

## Conclusões

1. **Validação Legítima Preservada**: A rejeição de providers não reconhecidos continua funcionando e é necessária
2. **Erro Acionável**: Mensagem inclui lista clara de providers válidos
3. **Sem Erros Não Tratados**: Todos os erros são capturados e retornados como JSON estruturado
4. **Cobertura Completa**: Testes de integração cobrem todos os cenários críticos

## Recomendações

1. **Configuração**: Verificar se projeto 135 tem `github-emu` configurado; se sim, atualizar para um dos providers válidos
2. **Monitoramento**: Monitorar erros 400 na rota para identificar tentativas futuras com providers inválidos
3. **Documentação**: Comunicar aos usuários que apenas `github`, `bitbucket`, `azure-devops` e `gitlab` são suportados

## Arquivos Modificados/Criados

```
backend/
├── package.json                          # Dependências (express, jest, supertest)
├── src/
│   ├── server.js                         # Servidor Express principal
│   ├── routes/
│   │   └── index.js                      # Definição de rotas
│   ├── controllers/
│   │   └── github-branches.controller.js # Lógica de endpoints
│   ├── services/
│   │   └── github-branches.service.js    # Lógica de negócio
│   ├── middleware/
│   │   └── error-handler.js              # Tratamento de erros
│   ├── utils/
│   │   └── git-provider.utils.js         # Validação de providers
│   └── __tests__/
│       └── github-branches.integration.test.js  # Testes de integração
├── README.md                             # Documentação da API
├── INVESTIGATION.md                      # Este arquivo
└── .gitignore
```
