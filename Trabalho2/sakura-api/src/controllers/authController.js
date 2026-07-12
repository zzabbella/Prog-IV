const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const userModel = require('../models/userModel');

// POST /api/auth/register
async function register(req, res) {
  try {
    const { username, senha } = req.body;

    if (!username || !senha) {
      return res.status(400).json({ erro: 'username e senha são obrigatórios' });
    }

    const usuarioExistente = await userModel.findByUsername(username);
    if (usuarioExistente) {
      return res.status(409).json({ erro: 'username já está em uso' });
    }

    // gera o hash da senha (nunca salvamos a senha em texto puro)
    const senhaHash = await bcrypt.hash(senha, 10);

    const novoUsuario = await userModel.create({ username, senhaHash });

    return res.status(201).json(novoUsuario);
  } catch (erro) {
    console.error(erro);
    return res.status(500).json({ erro: 'Erro ao registrar usuário' });
  }
}

// POST /api/auth/login
async function login(req, res) {
  try {
    const { username, senha } = req.body;

    if (!username || !senha) {
      return res.status(400).json({ erro: 'username e senha são obrigatórios' });
    }

    const usuario = await userModel.findByUsername(username);
    if (!usuario) {
      return res.status(401).json({ erro: 'usuário ou senha inválidos' });
    }

    const senhaConfere = await bcrypt.compare(senha, usuario.senha_hash);
    if (!senhaConfere) {
      return res.status(401).json({ erro: 'usuário ou senha inválidos' });
    }

    const token = jwt.sign(
      { id: usuario.id, username: usuario.username },
      process.env.JWT_SECRET,
      { expiresIn: '2h' }
    );

    return res.json({ token });
  } catch (erro) {
    console.error(erro);
    return res.status(500).json({ erro: 'Erro ao fazer login' });
  }
}

module.exports = { register, login };