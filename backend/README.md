# Squad Projects API

Mock API for integration testing the Squad Projects endpoint.

## Setup

```bash
cd backend
npm install
```

## Running

```bash
npm start
```

Server listens on port 3000 by default.

## API Endpoints

### GET /api/squad-projects/:projectId/github/branches

Returns GitHub branches for a project.

#### Success Response (HTTP 200)

```json
{
  "data": [
    {
      "name": "main",
      "sha": "abc123def456",
      "protected": false
    }
  ],
  "project": {
    "id": 75,
    "name": "pf-b3invest-testes-app",
    "provider": "github"
  }
}
```

#### Error Response - Unsupported Provider (HTTP 400)

```json
{
  "error": {
    "message": "Unsupported Git provider: github-emu. Please configure the project with one of the supported providers.",
    "code": "UNSUPPORTED_PROVIDER",
    "unsupported_provider": "github-emu",
    "allowed_providers": ["github", "bitbucket", "azure-devops", "gitlab"]
  }
}
```

#### Error Response - Project Not Found (HTTP 404)

```json
{
  "error": {
    "message": "Project 123 not found",
    "code": "PROJECT_NOT_FOUND"
  }
}
```

## Test Projects

- **Project 75** (supported provider)
  - Provider: `github`
  - URL: `https://github.com/b3sa/pf-b3invest-testes-app`
  - Returns: HTTP 200 with branches array

- **Project 999** (unsupported provider)
  - Provider: `github-emu`
  - URL: `https://github-emu.example.com/test/repo`
  - Returns: HTTP 400 with error details

## Integration Tests

Run tests from the project root:

```bash
# Start the API in one terminal
cd backend && npm start

# In another terminal, run tests
robot -i squad-projects -d ./logs robot/tests/squad-projects.robot
```
