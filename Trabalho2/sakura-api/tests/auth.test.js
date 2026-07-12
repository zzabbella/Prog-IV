const request = require('supertest');
const app = require('../src/app');
const pool = require('../src/config/db');

// limpa a tabela de usuários antes de cada teste, pra cada um começar "do zero"
beforeEach(async () => {
  await pool.query('TRUNCATE TABLE usuarios');
});

// fecha a conexão com o banco depois que todos os testes rodarem
afterAll(async () => {
  await pool.end();
});

describe('POST /api/auth/register', () => {
  it('deve registrar um novo usuário com sucesso', async () => {
    const resposta = await request(app)
      .post('/api/auth/register')
      .send({ username: 'isabella', senha: 'senha123' });

    expect(resposta.status).toBe(201);
    expect(resposta.body).toHaveProperty('id');
    expect(resposta.body.username).toBe('isabella');
    expect(resposta.body).not.toHaveProperty('senha');
    expect(resposta.body).not.toHaveProperty('senha_hash');
  });

  it('não deve permitir username duplicado', async () => {
    await request(app)
      .post('/api/auth/register')
      .send({ username: 'isabella', senha: 'senha123' });

    const resposta = await request(app)
      .post('/api/auth/register')
      .send({ username: 'isabella', senha: 'outrasenha' });

    expect(resposta.status).toBe(409);
    expect(resposta.body).toHaveProperty('erro');
  });

  it('deve rejeitar registro sem username ou senha', async () => {
    const resposta = await request(app)
      .post('/api/auth/register')
      .send({ username: 'isabella' }); // faltando "senha"

    expect(resposta.status).toBe(400);
  });
});

describe('POST /api/auth/login', () => {
  beforeEach(async () => {
    // cria um usuário pra poder testar o login
    await request(app)
      .post('/api/auth/register')
      .send({ username: 'isabella', senha: 'senha123' });
  });

  it('deve fazer login com credenciais corretas e devolver um token', async () => {
    const resposta = await request(app)
      .post('/api/auth/login')
      .send({ username: 'isabella', senha: 'senha123' });

    expect(resposta.status).toBe(200);
    expect(resposta.body).toHaveProperty('token');
    expect(typeof resposta.body.token).toBe('string');
  });

  it('deve rejeitar login com senha errada', async () => {
    const resposta = await request(app)
      .post('/api/auth/login')
      .send({ username: 'isabella', senha: 'senhaerrada' });

    expect(resposta.status).toBe(401);
  });

  it('deve rejeitar login com username inexistente', async () => {
    const resposta = await request(app)
      .post('/api/auth/login')
      .send({ username: 'naoexiste', senha: 'senha123' });

    expect(resposta.status).toBe(401);
  });
});