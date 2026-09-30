const express = require('express');
const projectsController = require('../controllers/projects');

const router = express.Router();

// GET /api/squad-projects/:projectId/github/branches
router.get('/:projectId/github/branches', projectsController.getGitHubBranches);

module.exports = router;
