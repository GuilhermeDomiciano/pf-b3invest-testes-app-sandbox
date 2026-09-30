/**
 * Serviço para listar branches de repositórios GitHub
 * (simulado em memória para este exemplo)
 */

const { validateProvider } = require('../utils/git-provider.utils');

/**
 * Dados simulados de repositórios por projeto
 * Estrutura: { projectId: { provider: string, repoUrl: string, branches: [] } }
 */
const mockRepositories = {
  135: {
    provider: 'github',
    repoUrl: 'https://github.com/example/repo',
    branches: [
      { name: 'main', lastCommit: '2026-09-30' },
      { name: 'develop', lastCommit: '2026-09-29' },
      { name: 'feature/new-api', lastCommit: '2026-09-28' }
    ]
  }
};

/**
 * Lista branches de um repositório no qual o provider foi validado
 * @param {number|string} projectId - ID do projeto
 * @param {string} provider - Provider Git (github, bitbucket, gitlab, azure-devops)
 * @returns {Promise<Array>} - Lista de branches
 * @throws {UnsupportedGitProviderError} - Se provider não for reconhecido
 * @throws {NotFoundError} - Se projeto não for encontrado
 */
async function listBranches(projectId, provider) {
  // Validar provider
  const { valid, error, provider: normalizedProvider } = validateProvider(provider);

  if (!valid) {
    const err = new Error(error);
    err.name = 'UnsupportedGitProviderError';
    err.statusCode = 400;
    throw err;
  }

  // Simular delay de conexão
  await new Promise(resolve => setTimeout(resolve, 50));

  // Para o projeto 135, retornar branches do repositório configurado
  if (projectId === 135 || String(projectId) === '135') {
    const repo = mockRepositories[135];

    // Verificar se o provider corresponde ao configurado
    if (normalizedProvider !== repo.provider) {
      const err = new Error(
        `Configuração inválida: projeto ${projectId} usa provider '${repo.provider}', mas foi solicitado '${normalizedProvider}'`
      );
      err.name = 'ValidationError';
      err.statusCode = 400;
      throw err;
    }

    return {
      projectId: 135,
      provider: normalizedProvider,
      repoUrl: repo.repoUrl,
      branches: repo.branches
    };
  }

  // Para outros projetos, retornar lista vazia (simulação)
  return {
    projectId,
    provider: normalizedProvider,
    repoUrl: `https://${normalizedProvider}.com/example/repo`,
    branches: []
  };
}

module.exports = {
  listBranches,
  mockRepositories
};
