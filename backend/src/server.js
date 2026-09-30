/**
 * Servidor Express principal
 */

const express = require('express');
const routes = require('./routes');
const { errorHandler } = require('./middleware/error-handler');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

// Rotas da API
app.use('/api', routes);

// 404 handler
app.use((req, res) => {
  res.status(404).json({
    error: 'NotFound',
    message: `Rota ${req.method} ${req.path} não encontrada`
  });
});

// Error handler (deve ser o último middleware)
app.use(errorHandler);

// Iniciar servidor apenas se este arquivo for executado diretamente
if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:${PORT}`);
  });
}

module.exports = app;
