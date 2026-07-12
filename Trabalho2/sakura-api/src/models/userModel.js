const pool = require('../config/db');

// Busca um usuário pelo username
async function findByUsername(username) {
  const [rows] = await pool.query(
    'SELECT * FROM usuarios WHERE username = ?',
    [username]
  );
  return rows[0]; // undefined se não encontrar
}

// Busca um usuário pelo id
async function findById(id) {
  const [rows] = await pool.query(
    'SELECT id, username, criado_em FROM usuarios WHERE id = ?',
    [id]
  );
  return rows[0];
}

// Cria um novo usuário (já espera receber a senha JÁ com hash)
async function create({ username, senhaHash }) {
  const [result] = await pool.query(
    'INSERT INTO usuarios (username, senha_hash) VALUES (?, ?)',
    [username, senhaHash]
  );
  return findById(result.insertId);
}

module.exports = { findByUsername, findById, create };