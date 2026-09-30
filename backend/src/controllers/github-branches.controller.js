/**
 * Controller para endpoints de GitHub branches
 */

const { listBranches } = require('../services/github-branches.service');
const { validateProvider } = require('../utils/git-provider.utils');

/**
 * GET /api/squad-projects/:projectId/github/branches
 * Lista branches de um repositório GitHub para um projeto
 *
 * Query params:
 *   - provider (required): 'github', 'bitbucket', 'azure-devops', 'gitlab'
 *
 * Responses:
 *   200: { projectId, provider, repoUrl, branches: [{name, lastCommit}, ...] }
 *   400: { error, message } - Provider inválido ou configuração inválida
 *   500: { error, message } - Erro interno
 */
async function getBranchesByProvider(req, res, next) {
  try {
    const { projectId } = req.params;
    const { provider } = req.query;

    // Validar query param provider
    if (!provider) {
      const err = new Error('Provider é obrigatório como query parameter');
      err.name = 'ValidationError';
      err.statusCode = 400;
      throw err;
    }

    // Validar formato do provider
    const validation = validateProvider(provider);
    if (!validation.valid) {
      const err = new Error(validation.error);
      err.name = 'UnsupportedGitProviderError';
      err.statusCode = 400;
      throw err;
    }

    // Chamar serviço para listar branches
    const result = await listBranches(projectId, validation.provider);

    res.json(result);
  } catch (error) {
    next(error);
  }
}

/**
 * POST /api/squad-projects/:projectId/github/branches/validate
 * Valida se um provider é reconhecido sem listar branches
 *
 * Body: { provider: string }
 *
 * Responses:
 *   200: { valid: true, provider: string }
 *   400: { error, message } - Provider inválido
 */
async function validateProviderEndpoint(req, res, next) {
  try {
    const { provider } = req.body;

    if (!provider) {
      const err = new Error('Provider é obrigatório no body');
      err.name = 'ValidationError';
      err.statusCode = 400;
      throw err;
    }

    const validation = validateProvider(provider);

    if (!validation.valid) {
      const err = new Error(validation.error);
      err.name = 'UnsupportedGitProviderError';
      err.statusCode = 400;
      throw err;
    }

    res.json({
      valid: true,
      provider: validation.provider,
      supported: ['github', 'bitbucket', 'azure-devops', 'gitlab']
    });
  } catch (error) {
    next(error);
  }
}

module.exports = {
  getBranchesByProvider,
  validateProviderEndpoint
};
