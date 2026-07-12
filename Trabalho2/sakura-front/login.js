document.addEventListener('DOMContentLoaded', () => {
  // se já tiver um token salvo, não faz sentido ficar na tela de login
  if (obterToken()) {
    window.location.href = 'index.html';
    return;
  }

  const form = document.getElementById('form-login');
  const mensagemErro = document.getElementById('mensagem-erro');

  form.addEventListener('submit', async (evento) => {
    evento.preventDefault(); // impede o recarregamento padrão da página

    const username = document.getElementById('username').value.trim();
    const senha = document.getElementById('senha').value;

    const botao = form.querySelector('button');
    botao.disabled = true;
    botao.textContent = 'Entrando...';
    mensagemErro.textContent = '';

    try {
      const token = await apiLogin(username, senha);
      salvarToken(token);
      window.location.href = 'index.html';
    } catch (erro) {
      mensagemErro.textContent = erro.message;
      botao.disabled = false;
      botao.textContent = 'Entrar';
    }
  });
});