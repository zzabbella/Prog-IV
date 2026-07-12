// URL base da API - se o back-end mudar de porta/endereço, só muda aqui
const API_BASE_URL = 'http://localhost:3001/api';

// --- Funções de token (localStorage) ---

function salvarToken(token) {
  localStorage.setItem('sakura_token', token);
}

function obterToken() {
  return localStorage.getItem('sakura_token');
}

function removerToken() {
  localStorage.removeItem('sakura_token');
}

// Se não houver token salvo, manda pra tela de login.
// Deve ser chamada no topo de qualquer página que exige estar logado.
function exigirAutenticacao() {
  const token = obterToken();
  if (!token) {
    window.location.href = 'login.html';
  }
  return token;
}

function logout() {
  removerToken();
  window.location.href = 'login.html';
}

// --- Chamada de login (não precisa de token) ---

async function apiLogin(username, senha) {
  const resposta = await fetch(`${API_BASE_URL}/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, senha })
  });

  const dados = await resposta.json();

  if (!resposta.ok) {
    // dados.erro vem do back-end (ex: "usuário ou senha inválidos")
    throw new Error(dados.erro || 'Erro ao fazer login');
  }

  return dados.token;
}

// --- Wrapper de fetch que já inclui o token e trata erro de autenticação ---

async function apiFetch(caminho, opcoes = {}) {
  const token = obterToken();

  const resposta = await fetch(`${API_BASE_URL}${caminho}`, {
    ...opcoes,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`,
      ...opcoes.headers
    }
  });

  // token ausente/expirado/inválido -> manda de volta pro login
  if (resposta.status === 401) {
    removerToken();
    window.location.href = 'login.html';
    return null;
  }

  if (!resposta.ok) {
    const dadosErro = await resposta.json().catch(() => ({}));
    throw new Error(dadosErro.erro || `Erro na requisição (status ${resposta.status})`);
  }

  // DELETE devolve 204 sem corpo, então não tenta fazer .json() nesse caso
  if (resposta.status === 204) {
    return null;
  }

  return resposta.json();
}

// --- Funções específicas de personagens, usando o apiFetch acima ---

function listarPersonagens() {
  return apiFetch('/personagens');
}

function buscarPersonagem(id) {
  return apiFetch(`/personagens/${id}`);
}