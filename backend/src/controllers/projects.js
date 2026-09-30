// In-memory database of project configurations
const projects = {
  75: {
    id: 75,
    name: 'pf-b3invest-testes-app',
    provider: 'github',
    repositoryUrl: 'https://github.com/b3sa/pf-b3invest-testes-app'
  },
  999: {
    id: 999,
    name: 'test-unsupported-provider',
    provider: 'github-emu',
    repositoryUrl: 'https://github-emu.example.com/test/repo'
  }
};

// Mock branches data
const mockBranches = {
  75: [
    {
      name: 'main',
      sha: 'abc123def456',
      protected: false
    },
    {
      name: 'develop',
      sha: 'ghi789jkl012',
      protected: false
    },
    {
      name: 'feat/test-squad-projects',
      sha: 'mno345pqr678',
      protected: false
    }
  ]
};

// Supported Git providers
const SUPPORTED_PROVIDERS = ['github', 'bitbucket', 'azure-devops', 'gitlab'];

/**
 * GET /api/squad-projects/:projectId/github/branches
 *
 * Returns a list of GitHub branches for a project.
 *
 * Success (HTTP 200):
 * - Project exists
 * - Provider is supported (github, bitbucket, azure-devops, gitlab)
 * - Returns array of branch objects
 *
 * Error (HTTP 400):
 * - Project exists but provider is unsupported (e.g., github-emu)
 * - Returns error object with message and allowed_providers list
 *
 * Error (HTTP 404):
 * - Project does not exist
 */
const getGitHubBranches = (req, res) => {
  const { projectId } = req.params;

  // Find project
  const project = projects[projectId];

  if (!project) {
    return res.status(404).json({
      error: {
        message: `Project ${projectId} not found`,
        code: 'PROJECT_NOT_FOUND'
      }
    });
  }

  // Validate provider is supported
  if (!SUPPORTED_PROVIDERS.includes(project.provider)) {
    return res.status(400).json({
      error: {
        message: `Unsupported Git provider: ${project.provider}. Please configure the project with one of the supported providers.`,
        code: 'UNSUPPORTED_PROVIDER',
        unsupported_provider: project.provider,
        allowed_providers: SUPPORTED_PROVIDERS
      }
    });
  }

  // Return branches for supported provider
  const branches = mockBranches[projectId] || [];

  res.status(200).json({
    data: branches,
    project: {
      id: project.id,
      name: project.name,
      provider: project.provider
    }
  });
};

module.exports = {
  getGitHubBranches
};
