/**
 * Definição de rotas da API
 */

const express = require('express');
const {
  getBranchesByProvider,
  validateProviderEndpoint
} = require('../controllers/github-branches.controller');

const router = express.Router();

/**
 * GET /api/squad-projects/:projectId/github/branches
 * Lista branches de um repositório
 *
 * Query: ?provider=github|bitbucket|azure-devops|gitlab
 * Response: 200 { projectId, provider, repoUrl, branches }
 * Error: 400 { error, message }
 */
router.get('/squad-projects/:projectId/github/branches', getBranchesByProvider);

/**
 * POST /api/squad-projects/:projectId/github/branches/validate
 * Valida um provider
 *
 * Body: { provider: string }
 * Response: 200 { valid: true, provider, supported }
 * Error: 400 { error, message }
 */
router.post('/squad-projects/:projectId/github/branches/validate', validateProviderEndpoint);

module.exports = router;
