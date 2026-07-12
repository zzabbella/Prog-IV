const personagemModel = require('../models/personagemModel');

// GET /api/personagens
async function listar(req, res) {
  try {
    const personagens = await personagemModel.findAll();
    return res.json(personagens);
  } catch (erro) {
    console.error(erro);
    return res.status(500).json({ erro: 'Erro ao buscar personagens' });
  }
}

// GET /api/personagens/:id
async function buscarPorId(req, res) {
  try {
    const { id } = req.params;
    const personagem = await personagemModel.findById(id);

    if (!personagem) {
      return res.status(404).json({ erro: 'Personagem não encontrado' });
    }

    return res.json(personagem);
  } catch (erro) {
    console.error(erro);
    return res.status(500).json({ erro: 'Erro ao buscar personagem' });
  }
}

// POST /api/personagens
async function criar(req, res) {
  try {
    const { titulo, subtitulo, conteudo, imagem, ordem } = req.body;

    if (!titulo || !conteudo || !imagem) {
      return res.status(400).json({ erro: 'titulo, conteudo e imagem são obrigatórios' });
    }

    const novoPersonagem = await personagemModel.create({
      titulo,
      subtitulo: subtitulo || null,
      conteudo,
      imagem,
      ordem: ordem || 0
    });

    return res.status(201).json(novoPersonagem);
  } catch (erro) {
    console.error(erro);
    return res.status(500).json({ erro: 'Erro ao criar personagem' });
  }
}

// PUT /api/personagens/:id
async function atualizar(req, res) {
  try {
    const { id } = req.params;
    const { titulo, subtitulo, conteudo, imagem, ordem } = req.body;

    const personagemExistente = await personagemModel.findById(id);
    if (!personagemExistente) {
      return res.status(404).json({ erro: 'Personagem não encontrado' });
    }

    if (!titulo || !conteudo || !imagem) {
      return res.status(400).json({ erro: 'titulo, conteudo e imagem são obrigatórios' });
    }

    const personagemAtualizado = await personagemModel.update(id, {
      titulo,
      subtitulo: subtitulo || null,
      conteudo,
      imagem,
      ordem: ordem || 0
    });

    return res.json(personagemAtualizado);
  } catch (erro) {
    console.error(erro);
    return res.status(500).json({ erro: 'Erro ao atualizar personagem' });
  }
}

// DELETE /api/personagens/:id
async function deletar(req, res) {
  try {
    const { id } = req.params;

    const removido = await personagemModel.remove(id);
    if (!removido) {
      return res.status(404).json({ erro: 'Personagem não encontrado' });
    }

    return res.status(204).send();
  } catch (erro) {
    console.error(erro);
    return res.status(500).json({ erro: 'Erro ao deletar personagem' });
  }
}

module.exports = { listar, buscarPorId, criar, atualizar, deletar };