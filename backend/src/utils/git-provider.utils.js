/**
 * Utilitários para validação e suporte de provedores Git
 */

const SUPPORTED_PROVIDERS = {
  github: 'github',
  bitbucket: 'bitbucket',
  'azure-devops': 'azure-devops',
  gitlab: 'gitlab'
};

/**
 * Extrai o provider de uma URL ou string de repositório Git
 * @param {string} repoUrl - URL ou string do repositório (ex: git@github.com:user/repo.git ou https://github.com/user/repo)
 * @returns {string|null} - Provider identificado ou null
 */
function extractProviderFromUrl(repoUrl) {
  if (!repoUrl || typeof repoUrl !== 'string') {
    return null;
  }

  const url = repoUrl.toLowerCase();

  // Detectar provider baseado no hostname
  if (url.includes('github.com')) {
    return 'github';
  }
  if (url.includes('bitbucket.org')) {
    return 'bitbucket';
  }
  if (url.includes('dev.azure.com') || url.includes('visualstudio.com')) {
    return 'azure-devops';
  }
  if (url.includes('gitlab.com')) {
    return 'gitlab';
  }

  return null;
}

/**
 * Valida se um provider é reconhecido e suportado
 * @param {string} provider - Provider a validar
 * @returns {{valid: boolean, error?: string}}
 */
function validateProvider(provider) {
  if (!provider || typeof provider !== 'string') {
    return {
      valid: false,
      error: 'Provider deve ser uma string não vazia'
    };
  }

  const normalizedProvider = provider.toLowerCase().trim();

  if (!SUPPORTED_PROVIDERS[normalizedProvider]) {
    const supportedList = Object.keys(SUPPORTED_PROVIDERS).join(', ');
    return {
      valid: false,
      error: `Git provider não reconhecido para "${provider}". Use: ${supportedList}`
    };
  }

  return {
    valid: true,
    provider: normalizedProvider
  };
}

/**
 * Verifica se um provider é suportado
 * @param {string} provider - Provider a verificar
 * @returns {boolean}
 */
function isProviderSupported(provider) {
  return !!SUPPORTED_PROVIDERS[String(provider).toLowerCase()];
}

module.exports = {
  SUPPORTED_PROVIDERS,
  extractProviderFromUrl,
  validateProvider,
  isProviderSupported
};
