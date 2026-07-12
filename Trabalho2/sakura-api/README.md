# Sakura API

API REST para gerenciamento de personagens da wiki de Cardcaptor Sakura, desenvolvida como parte do trabalho prático de Integração Front-end e Back-end (Programação IV).

Construída com Node.js, Express e MySQL, com autenticação via JWT.

## Índice

- [Tecnologias](#tecnologias)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Configuração do ambiente](#configuração-do-ambiente)
- [Banco de dados](#banco-de-dados)
- [Executando o projeto](#executando-o-projeto)
- [Executando os testes](#executando-os-testes)
- [Endpoints da API](#endpoints-da-api)
- [Estrutura de pastas](#estrutura-de-pastas)

## Tecnologias

- Node.js + Express
- MySQL (via `mysql2`)
- JWT (`jsonwebtoken`) para autenticação
- `bcryptjs` para hash de senhas
- Jest + Supertest para testes automatizados

## Pré-requisitos

- [Node.js](https://nodejs.org/) instalado (versão 18 ou superior recomendada)
- [MySQL](https://dev.mysql.com/downloads/) instalado e rodando localmente

## Instalação

Clone o repositório e instale as dependências:

```bash
git clone <url-do-repositorio>
cd sakura-api
npm install
```

## Configuração do ambiente

Crie um arquivo `.env` na raiz do projeto, com base no `.env.example`:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=sua_senha_do_mysql
DB_NAME=sakura_db
DB_PORT=3306

PORT=3001
JWT_SECRET=alguma_string_secreta_grande
```

Para rodar os testes automatizados, crie também um `.env.test`, apontando para um banco separado (recomendado, para não misturar dados de teste com dados reais):

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=sua_senha_do_mysql
DB_NAME=sakura_db_test
DB_PORT=3306

PORT=3001
JWT_SECRET=alguma_string_secreta_grande
```

## Banco de dados

Crie o banco de dados principal:

```sql
CREATE DATABASE sakura_db;
```

Depois, rode o script disponível em `sql/schema.sql`, que cria as tabelas `usuarios` e `personagens`, e já popula `personagens` com os 7 personagens principais da série:

```bash
mysql -u root -p sakura_db < sql/schema.sql
```

Se for rodar os testes automatizados, crie também o banco de teste (vazio, sem dados iniciais):

```sql
CREATE DATABASE sakura_db_test;
USE sakura_db_test;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NOT NULL,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE personagens (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  subtitulo VARCHAR(100),
  conteudo TEXT NOT NULL,
  imagem VARCHAR(500) NOT NULL,
  ordem INT NOT NULL DEFAULT 0,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Executando o projeto

Modo desenvolvimento (reinicia automaticamente a cada alteração):

```bash
npm run dev
```

Modo normal:

```bash
npm start
```

O servidor sobe em `http://localhost:3001` (ou na porta definida em `PORT`, no `.env`).

## Executando o front-end

O front-end (`sakura-front/`) é um projeto separado, feito em HTML/CSS/JS puro (sem framework, sem build). Ele não usa `npm` — não precisa instalar nada nele.

1. Certifique-se de que o back-end está rodando (`npm run dev`, dentro de `sakura-api`)
2. Abra o arquivo `sakura-front/login.html` diretamente no navegador (clique duas vezes nele, ou use a extensão "Live Server" do VS Code)
3. Faça login com um usuário já registrado (ver seção de endpoints, `POST /api/auth/register`, para criar um novo)
4. Após o login, você será redirecionado para `index.html`, onde os personagens são carregados dinamicamente a partir da API

**Observação:** apenas a aba "Principais" (personagens) consome a API dinamicamente. As demais seções do site (Outros, Anime, Clear Card, Cartas Clow) permanecem com conteúdo estático, já que a entidade migrada para o back-end, conforme escopo do trabalho, foi apenas "Personagens".

## Executando os testes

```bash
npm test
```

Os testes usam o banco `sakura_db_test` (via `.env.test`) e cobrem:

- Registro de usuário (sucesso, username duplicado, campos faltando)
- Login (sucesso, senha errada, usuário inexistente)
- Proteção das rotas de personagens (sem token, token inválido)
- CRUD completo de personagens (criar, listar ordenado, buscar por id, atualizar, remover)

## Endpoints da API

### Autenticação

Rotas públicas, não exigem token.

| Método | Rota | Descrição | Body |
|--------|------|-----------|------|
| POST | `/api/auth/register` | Cria um novo usuário | `{ "username": "string", "senha": "string" }` |
| POST | `/api/auth/login` | Autentica e devolve um token JWT | `{ "username": "string", "senha": "string" }` |

**Resposta de sucesso do login:**
```json
{ "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." }
```

O token deve ser enviado no header `Authorization` de todas as requisições às rotas de personagens, no formato:

```
Authorization: Bearer <token>
```

### Personagens

Todas as rotas abaixo exigem token JWT válido (retornam `401` sem ele).

| Método | Rota | Descrição | Body |
|--------|------|-----------|------|
| GET | `/api/personagens` | Lista todos os personagens, ordenados pelo campo `ordem` | — |
| GET | `/api/personagens/:id` | Busca um personagem pelo id | — |
| POST | `/api/personagens` | Cria um novo personagem | `{ "titulo": "string", "subtitulo": "string", "conteudo": "string", "imagem": "string", "ordem": number }` |
| PUT | `/api/personagens/:id` | Atualiza um personagem existente | mesmos campos do POST |
| DELETE | `/api/personagens/:id` | Remove um personagem | — |

**Campos obrigatórios em POST/PUT:** `titulo`, `conteudo`, `imagem`. `subtitulo` e `ordem` são opcionais.

**Exemplo de personagem retornado:**
```json
{
  "id": 1,
  "titulo": "Sakura Kinomoto",
  "subtitulo": "Guardiã das Cartas",
  "conteudo": "Sakura é uma garota alegre e determinada...",
  "imagem": "https://exemplo.com/sakura.png",
  "ordem": 1,
  "criado_em": "2026-07-11T02:29:51.000Z"
}
```

### Códigos de status usados

| Código | Significado |
|--------|-------------|
| 200 | Sucesso (GET, PUT, login) |
| 201 | Recurso criado (POST) |
| 204 | Sucesso sem conteúdo (DELETE) |
| 400 | Requisição inválida (campos faltando) |
| 401 | Não autenticado (token ausente, inválido ou expirado; credenciais erradas no login) |
| 404 | Recurso não encontrado |
| 409 | Conflito (username já em uso) |
| 500 | Erro interno do servidor |

## Estrutura de pastas

```
sakura-api/
├── src/
│   ├── app.js                       # ponto de entrada, configuração do Express
│   ├── config/
│   │   └── db.js                    # pool de conexões MySQL
│   ├── controllers/
│   │   ├── authController.js        # lógica de registro e login
│   │   └── personagemController.js  # lógica do CRUD de personagens
│   ├── middlewares/
│   │   └── authMiddleware.js        # validação do token JWT
│   ├── models/
│   │   ├── userModel.js             # queries da tabela usuarios
│   │   └── personagemModel.js       # queries da tabela personagens
│   └── routes/
│       ├── authRoutes.js
│       └── personagemRoutes.js
├── tests/
│   ├── auth.test.js
│   └── personagens.test.js
├── sql/
│   └── schema.sql
├── .env.example
└── package.json
