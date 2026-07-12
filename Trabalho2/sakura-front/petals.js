
function createPetal() {
  const petal = document.createElement('div');
  petal.classList.add('petal');

  // posição horizontal aleatória
  petal.style.left = Math.random() * 100 + 'vw';

  // tamanho aleatório
  const size = Math.random() * 15 + 8 + 'px';
  petal.style.width = size;
  petal.style.height = size;

  // duração e atraso aleatórios
  petal.style.animationDuration = Math.random() * 4 + 4 + 's';
  petal.style.animationDelay = Math.random() * 5 + 's';

  document.body.appendChild(petal);

  // remove a pétala depois que cai
  petal.addEventListener('animationend', () => petal.remove());
}

// cria pétalas continuamente
setInterval(createPetal, 300);

// botões
    document.querySelectorAll('.tab-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            // Remove active de todos os botões e conteúdos
            document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
            document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));

            // Adiciona active no botão clicado e no conteúdo correspondente
            btn.classList.add('active');
            document.getElementById(btn.dataset.tab).classList.add('active');
        });
    });


// Cursor
const cursor = document.querySelector('.cursor');

document.addEventListener('mousemove', (e) => {
  // move o cursor
  cursor.style.left = e.clientX + 'px';
  cursor.style.top = e.clientY + 'px';

  // cria rastro
  const petal = document.createElement('div');
  petal.classList.add('trail');

  petal.style.left = e.clientX + 'px';
  petal.style.top = e.clientY + 'px';

  document.body.appendChild(petal);

  setTimeout(() => {
    petal.remove();
  }, 600);
});