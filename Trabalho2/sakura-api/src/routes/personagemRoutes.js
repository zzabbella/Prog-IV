const express = require('express');
const router = express.Router();
const personagemController = require('../controllers/personagemController');
const authMiddleware = require('../middlewares/authMiddleware');

// todas as rotas de personagens exigem token JWT
router.use(authMiddleware);

router.get('/', personagemController.listar);
router.get('/:id', personagemController.buscarPorId);
router.post('/', personagemController.criar);
router.put('/:id', personagemController.atualizar);
router.delete('/:id', personagemController.deletar);

module.exports = router;