const express = require('express');
const cors = require('cors');
const path = require('path');

// carrega .env.test quando NODE_ENV=test, senão carrega .env normal
// (precisa acontecer ANTES de importar rotas/models, que dependem dessas variáveis)
const envFile = process.env.NODE_ENV === 'test' ? '.env.test' : '.env';
require('dotenv').config({ path: path.resolve(process.cwd(), envFile) });

const authRoutes = require('./routes/authRoutes');
const personagemRoutes = require('./routes/personagemRoutes');

const app = express();

app.use(cors());
app.use(express.json());

app.use('/api/auth', authRoutes);
app.use('/api/personagens', personagemRoutes);

// rota simples só pra checar se a API está no ar
app.get('/', (req, res) => {
  res.json({ mensagem: 'Sakura API está no ar' });
});

const PORT = process.env.PORT || 3001;

// só sobe o servidor de verdade se este arquivo for executado diretamente
// (nos testes, o app é importado sem chamar listen)
if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:${PORT}`);
  });
}

module.exports = app;