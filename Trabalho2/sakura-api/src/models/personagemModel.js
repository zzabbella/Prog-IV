const pool = require('../config/db');

// Busca todos os personagens, ordenados pelo campo "ordem"
async function findAll() {
  const [rows] = await pool.query(
    'SELECT * FROM personagens ORDER BY ordem ASC'
  );
  return rows;
}

// Busca um personagem pelo id
async function findById(id) {
  const [rows] = await pool.query(
    'SELECT * FROM personagens WHERE id = ?',
    [id]
  );
  return rows[0]; // undefined se não encontrar
}

// Cria um novo personagem
async function create({ titulo, subtitulo, conteudo, imagem, ordem }) {
  const [result] = await pool.query(
    'INSERT INTO personagens (titulo, subtitulo, conteudo, imagem, ordem) VALUES (?, ?, ?, ?, ?)',
    [titulo, subtitulo, conteudo, imagem, ordem]
  );
  return findById(result.insertId);
}

// Atualiza um personagem existente
async function update(id, { titulo, subtitulo, conteudo, imagem, ordem }) {
  await pool.query(
    'UPDATE personagens SET titulo = ?, subtitulo = ?, conteudo = ?, imagem = ?, ordem = ? WHERE id = ?',
    [titulo, subtitulo, conteudo, imagem, ordem, id]
  );
  return findById(id);
}

// Remove um personagem
async function remove(id) {
  const [result] = await pool.query(
    'DELETE FROM personagens WHERE id = ?',
    [id]
  );
  return result.affectedRows > 0; // true se apagou algo
}

module.exports = { findAll, findById, create, update, remove };