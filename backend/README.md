# API Squad Projects - GitHub Branches

API Express.js para gerenciar e listar branches de repositórios GitHub em projetos squad.

## Instalação

```bash
cd backend
npm install
```

## Executar

```bash
# Modo desenvolvimento
npm run dev

# Modo produção
npm start
```

O servidor estará disponível em `http://localhost:3000`

## Testes

```bash
# Executar testes de integração
npm test

# Modo watch
npm run test:watch
```

## Endpoints

### GET /api/squad-projects/:projectId/github/branches

Lista branches de um repositório para um projeto específico.

**Query Parameters:**
- `provider` (required): `github`, `bitbucket`, `azure-devops`, ou `gitlab`

**Responses:**

- **200 OK**: Sucesso
  ```json
  {
    "projectId": 135,
    "provider": "github",
    "repoUrl": "https://github.com/example/repo",
    "branches": [
      { "name": "main", "lastCommit": "2026-09-30" },
      { "name": "develop", "lastCommit": "2026-09-29" }
    ]
  }
  ```

- **400 Bad Request**: Provider inválido
  ```json
  {
    "error": "UnsupportedGitProviderError",
    "message": "Git provider não reconhecido para \"github-emu\". Use: github, bitbucket, azure-devops, gitlab"
  }
  ```

**Exemplos:**

```bash
# Provider válido
curl "http://localhost:3000/api/squad-projects/135/github/branches?provider=github"

# Provider inválido
curl "http://localhost:3000/api/squad-projects/135/github/branches?provider=github-emu"
```

### POST /api/squad-projects/:projectId/github/branches/validate

Valida um provider sem listar branches.

**Body:**
```json
{
  "provider": "github"
}
```

**Responses:**

- **200 OK**: Provider válido
  ```json
  {
    "valid": true,
    "provider": "github",
    "supported": ["github", "bitbucket", "azure-devops", "gitlab"]
  }
  ```

- **400 Bad Request**: Provider inválido
  ```json
  {
    "error": "UnsupportedGitProviderError",
    "message": "Git provider não reconhecido para \"invalid\". Use: github, bitbucket, azure-devops, gitlab"
  }
  ```

## Cobertura de Testes

Os testes de integração cobrem:

1. ✅ **Cenário: Provider válido (github)**
   - Retorna 200 com lista de branches
   - Não retorna HTTP 400

2. ✅ **Cenário: Provider não reconhecido (github-emu)**
   - Retorna 400 com erro acionável
   - Mensagem inclui lista de providers válidos
   - Não há erro não tratado (resposta JSON estruturada)

3. ✅ **Cenário: Query parameter ausente**
   - Retorna 400 com mensagem clara

4. ✅ **Validação de providers específicos**
   - Cada provider válido testado
   - Cada provider inválido testado

5. ✅ **Contexto de investigação/teste**
   - Registra projeto ID, provider, URL e escopo

## Projeto 135 - Configuração

- **Provider:** github
- **URL:** https://github.com/example/repo
- **Branches:** main, develop, feature/new-api
