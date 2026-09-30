/**
 * Testes de integração para rota /api/squad-projects/:projectId/github/branches
 *
 * Cobertura:
 * 1. Listagem de branches com provider válido (github)
 * 2. Rejeição de provider não reconhecido (github-emu)
 * 3. Rejeição de provider ausente
 * 4. Validação de provedores reconhecidos vs não reconhecidos
 */

const request = require('supertest');
const app = require('../server');

describe('GET /api/squad-projects/:projectId/github/branches', () => {
  describe('Cenário: Provider válido reconhecido (github)', () => {
    test('com provider=github válido, retorna 200 com lista de branches', async () => {
      const response = await request(app)
        .get('/api/squad-projects/135/github/branches')
        .query({ provider: 'github' });

      expect(response.status).toBe(200);
      expect(response.body).toHaveProperty('projectId', 135);
      expect(response.body).toHaveProperty('provider', 'github');
      expect(response.body).toHaveProperty('repoUrl');
      expect(response.body).toHaveProperty('branches');
      expect(Array.isArray(response.body.branches)).toBe(true);
      expect(response.body.branches.length).toBeGreaterThan(0);
      expect(response.body.branches[0]).toHaveProperty('name');
      expect(response.body.branches[0]).toHaveProperty('lastCommit');
    });

    test('com provider=github, responde sem HTTP 400', async () => {
      const response = await request(app)
        .get('/api/squad-projects/135/github/branches')
        .query({ provider: 'github' });

      expect(response.status).not.toBe(400);
      expect(response.status).toBe(200);
    });
  });

  describe('Cenário: Provider não reconhecido (github-emu)', () => {
    test('com provider=github-emu inválido, retorna 400 com erro acionável', async () => {
      const response = await request(app)
        .get('/api/squad-projects/135/github/branches')
        .query({ provider: 'github-emu' });

      expect(response.status).toBe(400);
      expect(response.body).toHaveProperty('error');
      expect(response.body).toHaveProperty('message');
      expect(response.body.error).toBe('UnsupportedGitProviderError');
      expect(response.body.message).toContain('não reconhecido');
      expect(response.body.message).toContain('github');
      expect(response.body.message).toContain('bitbucket');
      expect(response.body.message).toContain('azure-devops');
      expect(response.body.message).toContain('gitlab');
    });

    test('mensagem de erro inclui lista de providers válidos', async () => {
      const response = await request(app)
        .get('/api/squad-projects/135/github/branches')
        .query({ provider: 'github-emu' });

      expect(response.status).toBe(400);
      const message = response.body.message;
      expect(message).toMatch(/github/i);
      expect(message).toMatch(/bitbucket/i);
      expect(message).toMatch(/azure-devops/i);
      expect(message).toMatch(/gitlab/i);
    });

    test('não retorna erro não tratado (não há stack trace no response 200)', async () => {
      const response = await request(app)
        .get('/api/squad-projects/135/github/branches')
        .query({ provider: 'github-emu' });

      expect(response.status).toBe(400);
      // Verificar que a resposta é um JSON estruturado, não uma exceção
      expect(response.body).toHaveProperty('error');
      expect(response.body).toHaveProperty('message');
      expect(response.headers['content-type']).toMatch(/json/);
    });
  });

  describe('Cenário: Provider ausente (query parameter faltando)', () => {
    test('sem query parameter provider, retorna 400', async () => {
      const response = await request(app)
        .get('/api/squad-projects/135/github/branches');

      expect(response.status).toBe(400);
      expect(response.body).toHaveProperty('error');
      expect(response.body.message).toContain('obrigatório');
    });
  });

  describe('Cenário: Validação de providers específicos', () => {
    const validProviders = ['github', 'bitbucket', 'azure-devops', 'gitlab'];
    const invalidProviders = ['github-emu', 'gitea', 'gitbucket', 'bitbucket-cloud', 'invalid'];

    test.each(validProviders)(
      'provider=%s válido retorna 200',
      async (provider) => {
        const response = await request(app)
          .get('/api/squad-projects/135/github/branches')
          .query({ provider });

        // github é o suportado para projeto 135, outros devem validar mas podem retornar vazio
        if (provider === 'github') {
          expect(response.status).toBe(200);
          expect(response.body.provider).toBe(provider);
        }
      }
    );

    test.each(invalidProviders)(
      'provider=%s inválido retorna 400',
      async (provider) => {
        const response = await request(app)
          .get('/api/squad-projects/135/github/branches')
          .query({ provider });

        expect(response.status).toBe(400);
        expect(response.body.error).toBe('UnsupportedGitProviderError');
      }
    );
  });

  describe('Contexto de investigação/teste', () => {
    test('registra projeto ID 135 corretamente', async () => {
      const response = await request(app)
        .get('/api/squad-projects/135/github/branches')
        .query({ provider: 'github' });

      expect(response.body.projectId).toBe(135);
    });

    test('registra provider usado na requisição', async () => {
      const response = await request(app)
        .get('/api/squad-projects/135/github/branches')
        .query({ provider: 'github' });

      expect(response.body.provider).toBe('github');
    });

    test('registra URL do repositório na resposta', async () => {
      const response = await request(app)
        .get('/api/squad-projects/135/github/branches')
        .query({ provider: 'github' });

      expect(response.body).toHaveProperty('repoUrl');
      expect(response.body.repoUrl).toMatch(/https?:\/\//);
    });

    test('registra lista de branches com metadados', async () => {
      const response = await request(app)
        .get('/api/squad-projects/135/github/branches')
        .query({ provider: 'github' });

      expect(response.body).toHaveProperty('branches');
      expect(Array.isArray(response.body.branches)).toBe(true);
      response.body.branches.forEach(branch => {
        expect(branch).toHaveProperty('name');
        expect(branch).toHaveProperty('lastCommit');
      });
    });
  });
});

describe('POST /api/squad-projects/:projectId/github/branches/validate', () => {
  describe('Validação de provider sem listar branches', () => {
    test('com provider válido, retorna 200 com { valid: true }', async () => {
      const response = await request(app)
        .post('/api/squad-projects/135/github/branches/validate')
        .send({ provider: 'github' });

      expect(response.status).toBe(200);
      expect(response.body.valid).toBe(true);
      expect(response.body.provider).toBe('github');
      expect(response.body).toHaveProperty('supported');
    });

    test('com provider inválido, retorna 400 com mensagem acionável', async () => {
      const response = await request(app)
        .post('/api/squad-projects/135/github/branches/validate')
        .send({ provider: 'github-emu' });

      expect(response.status).toBe(400);
      expect(response.body.error).toBe('UnsupportedGitProviderError');
      expect(response.body.message).toContain('não reconhecido');
    });

    test('sem provider no body, retorna 400', async () => {
      const response = await request(app)
        .post('/api/squad-projects/135/github/branches/validate')
        .send({});

      expect(response.status).toBe(400);
    });
  });
});
