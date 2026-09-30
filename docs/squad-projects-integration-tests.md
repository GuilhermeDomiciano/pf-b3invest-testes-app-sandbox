# Squad Projects Integration Tests

## Overview

This document describes the integration tests for the Squad Projects API endpoint:
- `GET /api/squad-projects/:projectId/github/branches`

The tests validate that the endpoint correctly handles:
1. Valid requests with supported Git providers (github, bitbucket, azure-devops, gitlab)
2. Invalid requests with unsupported providers (e.g., github-emu)
3. Proper error handling and response format compliance

## Test Location

- **Test file:** `robot/tests/squad-projects.robot`
- **Service utilities:** `resource/service/squad_projects_service.resource`

## Prerequisites

1. **Squad Projects API must be running** at the configured base URL
   - Default: `http://localhost:3000`
   - Override via `.env`: `SQUAD_PROJECTS_API_URL`

2. **Project 75 must be configured** in the Squad Projects API with:
   - A valid Git provider (github, bitbucket, azure-devops, or gitlab)
   - Valid repository URL
   - Proper authentication/authorization scope

3. **Robot Framework dependencies** must be installed:
   ```bash
   pip install -r config/requirements.txt
   ```

## Configuration

### Environment Variables

Add to `.env`:
```env
SQUAD_PROJECTS_API_URL=http://localhost:3000
SQUAD_PROJECTS_PROJECT_ID=75
```

See `.env.example` for template.

## Running Tests

### All Squad Projects Tests
```bash
robot -v ENVIRONMENT:local -i squad-projects -d ./logs robot/tests/squad-projects.robot
```

### Specific Test Cases

#### Supported Provider Flow
```bash
robot -v ENVIRONMENT:local -i integration -d ./logs robot/tests/squad-projects.robot
```
Tests that the endpoint returns HTTP 200 with valid branch list for supported providers.

#### Error Handling (Unsupported Provider)
```bash
robot -v ENVIRONMENT:local -i error-handling -d ./logs robot/tests/squad-projects.robot
```
Tests that the endpoint returns HTTP 400 with proper error message for unsupported providers.

#### Configuration Validation
```bash
robot -v ENVIRONMENT:local -i validation -d ./logs robot/tests/squad-projects.robot
```
Tests that project 75 configuration is correct and accessible.

## Test Cases

### 1. Validate Squad Projects GitHub Branches Endpoint With Supported Provider
**Purpose:** Verify the endpoint returns a successful response with valid branch list  
**Tags:** `squad-projects`, `api`, `integration`  
**Expected Result:** HTTP 200 with JSON array of branches

### 2. Validate Squad Projects API Returns Error For Unsupported Provider
**Purpose:** Verify the endpoint properly rejects unsupported providers  
**Tags:** `squad-projects`, `api`, `validation`, `error-handling`  
**Expected Result:** HTTP 400 with error message identifying the unsupported provider

### 3. Validate Squad Projects Configuration For Project 75
**Purpose:** Confirm project 75 production configuration  
**Tags:** `squad-projects`, `configuration`, `validation`  
**Expected Result:** HTTP 200 with successful branch list, confirming:
  - Git provider is supported
  - Repository URL is accessible
  - Authentication/authorization is valid

## Response Contract

### Success Response (HTTP 200)
```json
{
  "data": [
    {
      "name": "main",
      "sha": "abc123...",
      "protected": false
    },
    ...
  ]
}
```

### Error Response (HTTP 400 - Unsupported Provider)
```json
{
  "error": {
    "message": "Unsupported Git provider: github-emu",
    "allowed_providers": ["github", "bitbucket", "azure-devops", "gitlab"]
  }
}
```

## Notes

- Tests use RequestsLibrary for HTTP requests (no AppiumLibrary required)
- Session setup/teardown is minimal (no mobile app launch needed)
- Tests can run against local or production Squad Projects API
- Configure deployed revision handling via environment variables

## Troubleshooting

### Connection Refused
- Check that Squad Projects API is running at the configured URL
- Verify `SQUAD_PROJECTS_API_URL` in `.env`

### HTTP 400 on Valid Configuration
- Confirm project 75 Git provider is in the supported list
- Check repository URL accessibility
- Verify authentication credentials if required

### HTTP 500 / Unhandled Exception
- This indicates a bug in the API implementation
- Tests will fail as expected (not a test failure, but an API issue)
- The error handling test should catch this and report it

## Related Artifacts

- `.doctrina/contracts/mobile-test-runtime.md` — runtime contract  
- `.doctrina/specs/test-services/` — test services specification
- `AGENTS.md` — operational standards for this repository
