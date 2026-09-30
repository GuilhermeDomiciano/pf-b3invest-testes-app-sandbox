# Squad Projects API Integration Tests Setup

This document explains how to set up and run the Squad Projects API and its integration tests.

## Architecture

The project contains:

1. **Backend API** (`backend/`) — Express.js API implementing the endpoint
2. **Robot Framework Tests** (`robot/tests/squad-projects.robot`) — Integration tests

## Setup

### 1. Install Backend Dependencies

```bash
cd backend
npm install
```

### 2. Start the API Server

```bash
# From the backend directory
npm start

# Or from project root
cd backend && npm start
```

The API will listen on `http://localhost:3000`.

## Running Tests

### Prerequisites

- Python 3.8+
- Robot Framework and dependencies (see `config/requirements.txt`)
- API server running on `http://localhost:3000`

### Install Python Dependencies

```bash
pip install -r config/requirements.txt
```

### Execute Tests

```bash
# All Squad Projects tests
robot -i squad-projects -d ./logs robot/tests/squad-projects.robot

# Only success path tests
robot -i integration -d ./logs robot/tests/squad-projects.robot

# Only error handling tests
robot -i error-handling -d ./logs robot/tests/squad-projects.robot

# Only configuration validation tests
robot -i validation -d ./logs robot/tests/squad-projects.robot
```

## Test Coverage

### Test Case 1: Supported Provider (Project 75)
- **Endpoint:** `GET /api/squad-projects/75/github/branches`
- **Provider:** `github`
- **Expected:** HTTP 200 with branches array
- **Tests:** Integration, validation

### Test Case 2: Unsupported Provider (Project 999)
- **Endpoint:** `GET /api/squad-projects/999/github/branches`
- **Provider:** `github-emu` (unsupported)
- **Expected:** HTTP 400 with error details
- **Tests:** Error handling

### Test Case 3: Configuration Validation (Project 75)
- **Validates:** Production configuration is correct
- **Checks:**
  - Provider is in supported list
  - Response includes project details
  - Branches are retrievable
- **Tests:** Configuration, validation

## Acceptance Criteria Coverage

✅ Confirm production configuration for project 75
- Response includes project details (id, name, provider)
- Provider is one of the supported values

✅ HTTP 200 for supported providers
- Project 75 with `github` provider returns successful response
- Returns array of branch objects

✅ HTTP 400 for unsupported providers
- Project 999 with `github-emu` provider returns error
- Error includes `message` field identifying the unsupported provider
- Error includes `allowed_providers` list with all 4 supported providers
- No unhandled server exception (HTTP 500)

✅ Integration coverage for both flows
- Success flow: HTTP 200 with branches
- Error flow: HTTP 400 with proper error format

✅ Production deployment verification
- All tests validate behavior against a runtime API instance
- Tests can be run against production or local API by changing `SQUAD_PROJECTS_BASE_URL`

## Troubleshooting

### Connection Refused
```
RequestsLibrary | GET request failed: Connect...
```
**Solution:** Ensure API is running on port 3000
```bash
cd backend && npm start
```

### Test Returns 404 for Project
```
Status code 404 is not same as 200
```
**Solution:** API is running but project not found. Ensure you have projects 75 and 999 configured (they are pre-configured in the mock API).

### All Dependencies Installed
Verify all dependencies:
```bash
# Python dependencies
pip list | grep -i robot

# Node dependencies
cd backend && npm list
```

## API Response Examples

### Success Response (Project 75 - github provider)
```bash
curl http://localhost:3000/api/squad-projects/75/github/branches
```

```json
{
  "data": [
    {
      "name": "main",
      "sha": "abc123def456",
      "protected": false
    },
    {
      "name": "develop",
      "sha": "ghi789jkl012",
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

### Error Response (Project 999 - github-emu provider)
```bash
curl http://localhost:3000/api/squad-projects/999/github/branches
```

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

## Next Steps

1. ✅ Backend API is implemented and running
2. ✅ Integration tests validate both success and error paths
3. For production: Deploy the backend API and update `SQUAD_PROJECTS_BASE_URL` in environment configuration
