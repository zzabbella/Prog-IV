const request = require('supertest');
const app = require('../src/app');
const pool = require('../src/config/db');

let token; // vai guardar o token JWT válido, usado na maioria dos testes

// antes de todos os testes: limpa as tabelas e cria um usuário pra pegar um token
beforeAll(async () => {
  await pool.query('TRUNCATE TABLE usuarios');
  await pool.query('TRUNCATE TABLE personagens');

  await request(app)
    .post('/api/auth/register')
    .send({ username: 'isabella', senha: 'senha123' });

  const respostaLogin = await request(app)
    .post('/api/auth/login')
    .send({ username: 'isabella', senha: 'senha123' });

  token = respostaLogin.body.token;
});

// limpa a tabela de personagens antes de cada teste individual
beforeEach(async () => {
  await pool.query('TRUNCATE TABLE personagens');
});

afterAll(async () => {
  await pool.end();
});

describe('Proteção JWT nas rotas de personagens', () => {
  it('deve bloquear acesso sem token', async () => {
    const resposta = await request(app).get('/api/personagens');

    expect(resposta.status).toBe(401);
  });

  it('deve bloquear acesso com token inválido', async () => {
    const resposta = await request(app)
      .get('/api/personagens')
      .set('Authorization', 'Bearer token-invalido-qualquer');

    expect(resposta.status).toBe(401);
  });
});

describe('POST /api/personagens', () => {
  it('deve criar um personagem com token válido', async () => {
    const resposta = await request(app)
      .post('/api/personagens')
      .set('Authorization', `Bearer ${token}`)
      .send({
        titulo: 'Sakura Kinomoto',
        subtitulo: 'Guardiã das Cartas',
        conteudo: 'Biografia de teste',
        imagem: 'https://exemplo.com/sakura.png',
        ordem: 1
      });

    expect(resposta.status).toBe(201);
    expect(resposta.body).toHaveProperty('id');
    expect(resposta.body.titulo).toBe('Sakura Kinomoto');
  });

  it('deve rejeitar criação sem campos obrigatórios', async () => {
    const resposta = await request(app)
      .post('/api/personagens')
      .set('Authorization', `Bearer ${token}`)
      .send({ titulo: 'Sem conteúdo nem imagem' });

    expect(resposta.status).toBe(400);
  });
});

describe('GET /api/personagens', () => {
  it('deve listar personagens ordenados pelo campo "ordem"', async () => {
    // cria dois personagens fora de ordem, de propósito
    await request(app)
      .post('/api/personagens')
      .set('Authorization', `Bearer ${token}`)
      .send({ titulo: 'Segundo', conteudo: 'x', imagem: 'x.png', ordem: 2 });

    await request(app)
      .post('/api/personagens')
      .set('Authorization', `Bearer ${token}`)
      .send({ titulo: 'Primeiro', conteudo: 'x', imagem: 'x.png', ordem: 1 });

    const resposta = await request(app)
      .get('/api/personagens')
      .set('Authorization', `Bearer ${token}`);

    expect(resposta.status).toBe(200);
    expect(resposta.body).toHaveLength(2);
    expect(resposta.body[0].titulo).toBe('Primeiro'); // ordem 1 vem antes
    expect(resposta.body[1].titulo).toBe('Segundo');  // ordem 2 vem depois
  });
});

describe('GET /api/personagens/:id', () => {
  it('deve devolver 404 para um id que não existe', async () => {
    const resposta = await request(app)
      .get('/api/personagens/9999')
      .set('Authorization', `Bearer ${token}`);

    expect(resposta.status).toBe(404);
  });
});

describe('PUT /api/personagens/:id', () => {
  it('deve atualizar um personagem existente', async () => {
    const criado = await request(app)
      .post('/api/personagens')
      .set('Authorization', `Bearer ${token}`)
      .send({ titulo: 'Nome Errado', conteudo: 'x', imagem: 'x.png', ordem: 1 });

    const resposta = await request(app)
      .put(`/api/personagens/${criado.body.id}`)
      .set('Authorization', `Bearer ${token}`)
      .send({ titulo: 'Nome Certo', conteudo: 'x', imagem: 'x.png', ordem: 1 });

    expect(resposta.status).toBe(200);
    expect(resposta.body.titulo).toBe('Nome Certo');
  });
});

describe('DELETE /api/personagens/:id', () => {
  it('deve remover um personagem existente', async () => {
    const criado = await request(app)
      .post('/api/personagens')
      .set('Authorization', `Bearer ${token}`)
      .send({ titulo: 'Pra Deletar', conteudo: 'x', imagem: 'x.png', ordem: 1 });

    const respostaDelete = await request(app)
      .delete(`/api/personagens/${criado.body.id}`)
      .set('Authorization', `Bearer ${token}`);

    expect(respostaDelete.status).toBe(204);

    const respostaGet = await request(app)
      .get(`/api/personagens/${criado.body.id}`)
      .set('Authorization', `Bearer ${token}`);

    expect(respostaGet.status).toBe(404);
  });
});