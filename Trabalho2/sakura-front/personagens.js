document.addEventListener('DOMContentLoaded', () => {
  // bloqueia a página se não houver token salvo
  exigirAutenticacao();

  carregarPersonagens();

  const botaoLogout = document.getElementById('btn-logout');
  if (botaoLogout) {
    botaoLogout.addEventListener('click', (evento) => {
      evento.preventDefault();
      logout();
    });
  }
});

async function carregarPersonagens() {
  const container = document.getElementById('lista-personagens-principais');

  try {
    const personagens = await listarPersonagens();

    if (!personagens || personagens.length === 0) {
      container.innerHTML = '<p class="mensagem-status">Nenhum personagem cadastrado ainda.</p>';
      return;
    }

    // monta o HTML de todos os cards e substitui o "Carregando..."
    container.innerHTML = personagens.map(criarCardHTML).join('');
  } catch (erro) {
    container.innerHTML = `<p class="mensagem-status">Erro ao carregar personagens: ${erro.message}</p>`;
  }
}

function criarCardHTML(personagem) {
  const resumo = extrairResumo(personagem.conteudo, 120);

  return `
    <div class="card">
      <a href="personagem.html?id=${personagem.id}">
        <div class="personagem-card">
          <img src="${personagem.imagem}" alt="${personagem.titulo}">
          <div class="personagem-card-corpo">
            <h3>${personagem.titulo}</h3>
            ${personagem.subtitulo ? `<p class="subtitulo">${personagem.subtitulo}</p>` : ''}
            <p class="resumo">${resumo}</p>
          </div>
        </div>
      </a>
    </div>
  `;
}

// o campo "conteudo" pode ter HTML (parágrafos, negrito etc);
// aqui a gente tira as tags e corta o texto pra caber num resumo curto no card
function extrairResumo(conteudoHtml, tamanhoMaximo) {
  const textoPuro = conteudoHtml.replace(/<[^>]*>/g, ' ').replace(/\s+/g, ' ').trim();

  if (textoPuro.length <= tamanhoMaximo) {
    return textoPuro;
  }

  return textoPuro.slice(0, tamanhoMaximo).trim() + '...';
}