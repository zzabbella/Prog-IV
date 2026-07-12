document.addEventListener('DOMContentLoaded', () => {
  exigirAutenticacao();
  carregarPersonagem();
});

async function carregarPersonagem() {
  const container = document.getElementById('conteudo-personagem');

  // pega o id da URL, ex: personagem.html?id=3
  const parametros = new URLSearchParams(window.location.search);
  const id = parametros.get('id');

  if (!id) {
    container.innerHTML = '<p class="mensagem-status">Personagem não especificado.</p>';
    return;
  }

  try {
    const personagem = await buscarPersonagem(id);

    document.getElementById('titulo-pagina').textContent = `${personagem.titulo} — Sakura Card Captors`;

    container.innerHTML = `
      <img src="${personagem.imagem}" alt="${personagem.titulo}">
      <div class="personagem-info">
        <h1>${personagem.titulo}</h1>
        ${personagem.subtitulo ? `<h3>${personagem.subtitulo}</h3>` : ''}
        <br><br>
        <div class="personagem-conteudo">${personagem.conteudo}</div>
      </div>
    `;
  } catch (erro) {
    container.innerHTML = `<p class="mensagem-status">Erro ao carregar personagem: ${erro.message}</p>`;
  }
}