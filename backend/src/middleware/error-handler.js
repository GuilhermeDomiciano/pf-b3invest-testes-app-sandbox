/**
 * Middleware de tratamento de erros
 */

class UnsupportedGitProviderError extends Error {
  constructor(message) {
    super(message);
    this.name = 'UnsupportedGitProviderError';
    this.statusCode = 400;
  }
}

class ValidationError extends Error {
  constructor(message) {
    super(message);
    this.name = 'ValidationError';
    this.statusCode = 400;
  }
}

class NotFoundError extends Error {
  constructor(message = 'Recurso não encontrado') {
    super(message);
    this.name = 'NotFoundError';
    this.statusCode = 404;
  }
}

class InternalServerError extends Error {
  constructor(message = 'Erro interno do servidor') {
    super(message);
    this.name = 'InternalServerError';
    this.statusCode = 500;
  }
}

/**
 * Middleware para tratamento centralizado de erros
 */
function errorHandler(err, req, res, next) {
  const statusCode = err.statusCode || 500;
  const errorResponse = {
    error: err.name || 'Error',
    message: err.message || 'Erro desconhecido',
    ...(process.env.NODE_ENV === 'development' && { stack: err.stack })
  };

  res.status(statusCode).json(errorResponse);
}

module.exports = {
  UnsupportedGitProviderError,
  ValidationError,
  NotFoundError,
  InternalServerError,
  errorHandler
};
