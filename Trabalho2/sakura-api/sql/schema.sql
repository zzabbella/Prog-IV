-- ============================================
-- Schema do banco sakura_db
-- ============================================

CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NOT NULL,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS personagens (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  subtitulo VARCHAR(100),
  conteudo TEXT NOT NULL,
  imagem VARCHAR(500) NOT NULL,
  ordem INT NOT NULL DEFAULT 0,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Seed: personagens principais (ordem = aba "Principais")
-- biografias completas
-- ============================================

INSERT INTO personagens (titulo, subtitulo, conteudo, imagem, ordem) VALUES
('Sakura Kinomoto', 'Guardiã das Cartas',
 '<h2>Biografia</h2>
<p>Sakura Kinomoto é a protagonista da série, uma garota alegre e cheia de energia que mora na cidade fictícia de Tomoeda, no Japão. Ela perdeu sua mãe, <strong>Nadeshiko</strong>, quando tinha apenas 3 anos — e desde então foi criada pelo pai, o professor de arqueologia <strong>Fujitaka</strong>, e pelo irmão mais velho <strong>Touya</strong>.</p>
<p>Tudo muda quando ela encontra o misterioso <strong>Livro Clow</strong> na biblioteca de seu pai e libera acidentalmente as 19 Cartas Clow pelo mundo. Kerberos, o Guardião do Lacre, a designa como a nova <strong>Card Captor</strong> — e sua aventura começa.</p>
<br><br>
<h2>Personalidade</h2>
<p>Sakura é conhecida por sua gentileza, determinação e amor incondicional pelas pessoas ao seu redor. Ela é atlética, boa em esportes e líder de torcida na escola — mas também é bastante desastrada e tem um medo enorme de fantasmas! Apesar das dificuldades, nunca desiste e sempre encontra uma forma de superar os desafios com coragem e carinho.</p>
<br><br>
<h2>Poderes e Habilidades</h2>
<p>Sakura possui um poder mágico inato extremamente raro — foi justamente esse poder que lhe permitiu abrir o Livro Clow. Com seu <strong>báculo mágico</strong>, ela captura e controla as Cartas Clow, usando os poderes de cada carta em batalha. Ao longo da série, ela evolui e passa a transformar as cartas em <strong>Cartas Sakura</strong>, alimentadas pela sua própria magia — tornando-se uma das mágicas mais poderosas já vistas.</p>
<br><br>
<h2>Relacionamentos</h2>
<p>Sua melhor amiga é <strong>Tomoyo</strong>, sua prima de segundo grau, que a apoia em todas as aventuras. Seu irmão <strong>Touya</strong>, apesar de viver a chamando de "monstrenga", a protege com muito amor. Ela tem uma queda por <strong>Yukito</strong>, o melhor amigo de Touya — mas com o tempo, seus sentimentos se voltam para <strong>Syaoran</strong>, seu rival que se torna seu maior aliado e, por fim, seu par romântico.</p>
<br><br>
<h2>Curiosidades</h2>
<p>
 - Seu nome significa <strong>"flor de cerejeira"</strong> em japonês — e o sobrenome Kinomoto pode ser traduzido como "a origem da árvore", fazendo referência ao Livro Clow que deu início a tudo.<br><br>
 - Seu aniversário é <strong>1º de abril</strong> e seu tipo sanguíneo é A.<br><br>
 - Ela odeia matemática e adora Educação Física e Música.<br><br>
 - Sakura ganhou o prêmio <strong>Animage Grand Prix de Melhor Personagem Feminina</strong> em 1999 e 2000, e venceu o <strong>Anime Saimoe Tournament</strong> em 2002.<br><br>
 - O próprio <strong>Clow Reed</strong> planejou desde antes de morrer que Sakura — ainda nem nascida — seria a escolhida para herdar as cartas e continuar sua magia.
</p>',
 'https://static.wikia.nocookie.net/ccs/images/b/b0/Sakura_Thumb.png/revision/latest/scale-to-width-down/147?cb=20180902112732', 1),

('Syaoran Li', 'O Rival Aliado',
 '<h2>Biografia</h2>
<p>Syaoran Li é originário de <strong>Hong Kong</strong> e pertence ao famoso <strong>Clã Li</strong>, uma linhagem de poderosos feiticeiros que tem ligação direta com o Mago Clow Reed — a mãe de Clow era do próprio clã. Por isso, Syaoran acredita ser o legítimo herdeiro das Cartas Clow, e chega ao Japão determinado a tomá-las de Sakura.</p>
<p>Ele é o filho mais novo de <strong>Yelan Li</strong> e o único menino da família — antes dele nasceram quatro irmãs: Fuutie, Shiefa, Fanren e Feimei. Seu pai já faleceu, e é mencionado como responsável pela fortuna da família.</p>
<br><br>
<h2>Personalidade</h2>
<p>No início, Syaoran é frio, sério e bastante arrogante — ele não tem paciência para Sakura e a considera fraca demais para ser Card Captor. Com o tempo, no entanto, sua rigidez vai cedendo. Ele começa a respeitar Sakura, depois a admirar, depois a proteger — e por fim, a amar. Essa evolução é um dos arcos mais queridos pelos fãs da série. Por baixo de toda a seriedade, Syaoran é leal, corajoso e profundamente dedicado às pessoas que ama.</p>
<br><br>
<h2>Poderes e Habilidades</h2>
<p>Syaoran é um mago treinado desde criança. Ele domina <strong>magia elemental</strong> — fogo, vento, água e raio — através do uso de <strong>ofudas</strong> (papéis encantados). Também utiliza um <strong>Rashinban</strong> (tabuleiro mágico) para detectar a presença de cartas e forças sobrenaturais. Além disso, é praticante de <strong>kung fu e artes marciais chinesas</strong>, tornando-o um combatente eficaz mesmo sem magia. Fala pelo menos três idiomas: cantonês, japonês e inglês.</p>
<br><br>
<h2>Relacionamentos</h2>
<p>Sua relação com <strong>Sakura</strong> começa como rivalidade e evolui para o maior romance da série. Ele também nutria sentimentos por <strong>Yukito</strong> no início — mas isso se revelou ser uma atração pelo poder mágico da Lua de Yue, não um amor verdadeiro. <strong>Tomoyo</strong> torna-se sua confidente no segundo arco, ajudando-o a entender e expressar seus sentimentos por Sakura. No anime, sua prima <strong>Meilin</strong> chega ao Japão com ele e se autodenomina sua noiva, mas esse elemento é exclusivo da adaptação animada.</p>
<br><br>
<h2>Curiosidades</h2>
<p>
- Seu nome em chinês, <strong>Xiǎoláng</strong>, significa <em>"pequeno lobo"</em> — uma referência à sua personalidade feroz e independente.<br><br>
- Seu aniversário é <strong>13 de julho</strong> e seu tipo sanguíneo é O. Suas matérias favoritas são Educação Física e Matemática.<br><br>
- Ao longo da série, Syaoran aprende a costurar para fazer um ursinho de pelúcia de presente — uma das cenas mais fofas e marcantes do mangá.<br><br>
- Sua magia é regida pela <strong>Lua</strong>, assim como Yue — o que explica por que ele inicialmente se sentia atraído por Yukito.<br><br>
- Na versão americana do anime, Syaoran foi elevado a protagonista junto com Sakura, pois os primeiros 7 episódios — onde ele não aparece — foram cortados.<br><br>
- O CLAMP revelou que Syaoran foi o <strong>terceiro personagem criado</strong> para a série, logo após Sakura e Tomoyo — e que originalmente ele seria japonês, não chinês.
</p>',
 'https://static.wikia.nocookie.net/ccs/images/5/51/Syaoran_Thumb.png/revision/latest/scale-to-width-down/147?cb=20180903035037', 2),

('Tomoyo Daidouji', 'A Melhor Amiga',
 '<h2>Biografia</h2>
<p>Tomoyo Daidouji é a melhor amiga de Sakura e sua prima de segundo grau — a mãe de Tomoyo, <strong>Sonomi Daidouji</strong>, é prima da mãe de Sakura, Nadeshiko. Ela mora em uma mansão enorme em Tomoeda, com várias empregadas e uma equipe de guarda-costas femininas, pois sua mãe é presidente de uma grande empresa de brinquedos.</p>
<p>Desde o início, Tomoyo é uma das poucas pessoas que sabe do segredo de Sakura como Card Captor — e em vez de se assustar, decide apoiar a amiga de todas as formas possíveis: costurando seus figurinos de batalha e filmando cada aventura com sua câmera.</p>
<br><br>
<h2>Personalidade</h2>
<p>Tomoyo é elegante, calma e extremamente generosa. Ela nunca pensa em si mesma — sua maior felicidade é ver Sakura feliz e segura. Apesar de toda a riqueza e sofisticação, é completamente sem vaidade e dedica seu tempo, talento e recursos inteiramente às pessoas que ama. Nutre sentimentos muito profundos por Sakura, que ela mesma descreve como um amor que vai além da amizade — e aceita com maturidade que Sakura não a ama da mesma forma.</p>
<br><br>
<h2>Habilidades</h2>
<p>Tomoyo não possui poderes mágicos, mas suas habilidades são igualmente impressionantes. É uma <strong>costureira talentosíssima</strong> — cria sozinha todos os elaborados figurinos que Sakura usa nas capturas, cada um único e cheio de detalhes. Também possui uma <strong>voz de cantora excepcional</strong>, sendo destaque no coral da escola e realizando solos em eventos. Além disso, domina tecnologia avançada da empresa da mãe, fornecendo câmeras, celulares e equipamentos para Sakura e Kero ao longo da série.</p>
<br><br>
<h2>Relacionamentos</h2>
<p>Sua relação com <strong>Sakura</strong> é o centro de tudo — ela é confidente, estilista, fotógrafa e apoio emocional. No segundo arco da série, torna-se também confidente de <strong>Syaoran</strong>, ajudando-o a entender e expressar seus sentimentos por Sakura. Sua mãe, <strong>Sonomi</strong>, espelha essa dinâmica: assim como Tomoyo ama Sakura, Sonomi amava profundamente a prima Nadeshiko.</p>
<br><br>
<h2>Curiosidades</h2>
<p>
- Seu aniversário é <strong>3 de setembro</strong> e seu tipo sanguíneo é A.<br><br>
- Suas matérias favoritas são <strong>Música e Japonês</strong>, e ela participa do clube de coral da escola.<br><br>
- Sua mãe Sonomi fez Tomoyo deixar o cabelo comprido porque ele lembra o cabelo de <strong>Nadeshiko</strong>, a prima que ela amava.<br><br>
- Tomoyo tem um estúdio de gravação próprio no quarto — e uma coleção enorme de vídeos das aventuras de Sakura.<br><br>
- O CLAMP revelou que Mokona, ao desenhar Tomoyo inicialmente, a retratou como apaixonada por <strong>Touya</strong> — e ficou surpresa ao receber o roteiro revelando que ela na verdade ama Sakura.<br><br>
- Na versão americana do anime, os sentimentos de Tomoyo por Sakura foram <strong>completamente removidos</strong> pela censura, sendo retratada apenas como uma amiga comum.
</p>',
 'https://static.wikia.nocookie.net/ccs/images/0/07/Tomoyo_Thumb.png/revision/latest/scale-to-width-down/147?cb=20180902112736', 3),

('Kero', 'Guardião do Lacre',
 '<h2>Biografia</h2>
<p>Cerberus — carinhosamente chamado de <strong>Kero</strong> por Sakura — é um dos dois Guardiões das Cartas Clow, criado pelo poderoso Mago <strong>Clow Reed</strong>. Antes de morrer, Clow o designou para uma missão importantíssima: escolher o próximo mestre das cartas. Kero ficou guardando o Livro Clow por décadas — até que Sakura o abriu acidentalmente e libertou todas as cartas. A partir daí, ele escolheu Sakura como a nova Card Captor e passou a ser seu guia, professor e companheiro inseparável.</p>
<p>Ele vive escondido no quarto de Sakura, se passando por um simples bichinho de pelúcia para não despertar suspeitas — especialmente do desconfiado irmão Touya.</p>
<br><br>
<h2>Personalidade</h2>
<p>Kero é barulhento, guloso, um tanto mandão e vive se achando — mas no fundo é um guardião genuinamente dedicado e leal. Ele se preocupa profundamente com Sakura e acredita nela quando mais ninguém acredita. Adora videogame, doces de todo tipo e ser filmado pela Tomoyo — ao contrário de Sakura, ele <em>adora</em> aparecer nas gravações e se exibir nos figurinos. O CLAMP descreve sua coisa favorita como <strong>"diversão barulhenta"</strong> e sua menos favorita como <strong>"tristeza e solidão"</strong>.</p>
<br><br>
<h2>Duas Formas</h2>
<p>Kero possui duas formas muito diferentes. Sua <strong>forma falsa</strong> — a que aparece durante quase toda a série — é a de um pequeno filhotinho de leão com pelagem alaranjada e asinhas brancas, parecido com um bichinho de pelúcia. Já sua <strong>forma verdadeira</strong> é imponente: um enorme leão alado sem juba, com asas angélicas brancas e uma armadura metálica com uma grande pedra vermelha no centro. Para recuperar essa forma, Sakura precisava capturar as Cartas <strong>The Firey</strong> e <strong>The Earthy</strong>, que são a fonte do poder de Kero — regido pelo <strong>Sol</strong>.</p>
<br><br>
<h2>Relacionamentos</h2>
<p>Kero é o "irmão guardião" de <strong>Yue</strong> — os dois foram criados juntos por Clow Reed, mas têm personalidades completamente opostas. Com <strong>Sakura</strong>, desenvolve uma relação de amizade genuína que vai muito além do dever. E com <strong>Syaoran</strong>? Pura rivalidade desde o primeiro dia — Kero o chama de "moleque" e Syaoran o chama de "pelúcia", e os dois adoram discutir.</p>
<br><br>
<h2>Curiosidades</h2>
<p>
 - Seus poderes são derivados do <strong>Sol</strong>, e suas cartas regentes são The Firey e The Earthy — o oposto de Yue, que é regido pela Lua.<br><br>
 - Apesar de não precisar comer para sobreviver — ele gera energia do sol — Kero é <strong>absolutamente obcecado por doces</strong>. No anime, ele chega a ficar "bêbado" depois de comer chocolates recheados com licor!<br><br>
 - Seu aniversário é <strong>29 de fevereiro</strong> — sim, ele só faz aniversário a cada 4 anos! — e sua cor favorita é vermelho e laranja.<br><br>
 - O nome <strong>Cerberus</strong> vem da mitologia grega: era o cão de três cabeças que guardava as portas do Submundo. A referência é perfeita — assim como o Cerberus mítico guardava uma entrada, Kero guarda as cartas do Livro Clow.<br><br>
 - Ao criar o design de Kero, a artista Nekoi do CLAMP tentou várias formas — cachorros, esquilos — antes de chegar ao visual final de filhotinho de leão.<br><br>
 - Kero também aparece em <strong>Tsubasa: Reservoir Chronicle</strong>, guardando um país inteiro chamado "País de Kero" em uma dimensão paralela.
</p>',
 'https://static.wikia.nocookie.net/ccs/images/5/56/Kero_Thumb.png/revision/latest/scale-to-width-down/147?cb=20180902112734', 4),

('Touya', 'O Irmão Protetor',
 '<h2>Biografia</h2>
<p>Touya Kinomoto é o irmão mais velho de Sakura, sete anos mais velho que ela. Estudante do colégio Seijou, ele é talentoso em praticamente tudo: vai bem nos estudos, é ótimo em esportes, cozinha muito bem e ainda cuida das tarefas de casa. Trabalha em vários empregos de meio período ao longo da série — mais tarde revelado que o faz para pagar a própria faculdade sem depender do pai.</p>
<p>Ele perdeu a mãe, <strong>Nadeshiko</strong>, quando ainda era criança — e desde então carrega uma maturidade e senso de proteção que se refletem em tudo que faz, especialmente em relação à Sakura.</p>
<br><br>
<h2>Personalidade</h2>
<p>Touya é sério, direto e aparentemente frio — mas por baixo dessa fachada existe um irmão extremamente dedicado e amoroso. Ele vive chamando Sakura de <strong>"monstrenga"</strong> (kaijuu) e fingindo que não liga para o que ela faz, mas na prática está sempre de olho nela, muitas vezes aparecendo exatamente quando ela mais precisa. Yukito, seu melhor amigo, brinca que ele tem um <em>"complexo de irmã"</em>. É popular na escola, mas é basicamente um solitário — seus únicos amigos próximos são Yukito e a professora Kaho Mizuki.</p>
<br><br>
<h2>Poderes</h2>
<p>Touya nasceu com poderes mágicos naturais — diferentes dos de Sakura, mas igualmente impressionantes. Ele consegue <strong>ver espíritos</strong> (incluindo o da própria mãe, Nadeshiko), <strong>sentir quando Sakura está em perigo</strong> e detectar a presença de seres mágicos. É por isso que Kero sempre evita ficar perto dele — Touya claramente sabe que "o bichinho de pelúcia" é mais do que parece. Ele também descobre cedo a verdadeira forma de Yukito, de Nakuru e de outros seres mágicos.</p>
<p>Em um dos momentos mais marcantes da série, Touya <strong>entrega todos os seus poderes mágicos a Yue</strong> para salvá-lo de desaparecer — um sacrifício enorme feito por amor a Yukito.</p>
<br><br>
<h2>Relacionamentos</h2>
<p>Seu relacionamento mais importante é com <strong>Yukito</strong> — seu melhor amigo e par romântico. Os dois são um dos casais mais queridos da série, e o CLAMP os descreve como um <strong>"Soul Pair"</strong> (par de almas), destinados a estar juntos em qualquer universo. Com Sakura, apesar das provocações constantes, o amor fraternal é incondicional. Com <strong>Syaoran</strong>, mantém uma desconfiança permanente — mas no fundo aprova o relacionamento dele com Sakura, chegando a dizer que se Sakura fosse ficar com alguém, ele queria que fosse Syaoran.</p>
<br><br>
<h2>Curiosidades</h2>
<p>
- Seu nome <strong>Touya</strong> significa <em>"flor de pessegueiro"</em> em japonês — e essa é também sua flor favorita.<br><br>
- Seu aniversário é <strong>29 de fevereiro</strong> — ou seja, assim como Kero, ele é um bebê de ano bissexto e só comemora oficialmente a cada 4 anos!<br><br>
- Touya sabe desde cedo que Sakura é uma Card Captor, mas finge que não sabe — para não tirar dela a chance de crescer e enfrentar seus próprios desafios.<br><br>
- Tem faixa preta em karatê e jogava no clube de futebol no colégio.<br><br>
- Touya e Yukito aparecem juntos em <strong>Tsubasa: Reservoir Chronicle</strong>, onde Touya é rei de um país e Yukito seu assistente — mais um exemplo do "Soul Pair" do CLAMP.<br><br>
- A piada recorrente de Touya aparecendo nos empregos mais improváveis é uma das marcas mais queridas do anime — e foi mantida até em outras obras do CLAMP.
</p>',
 'https://static.wikia.nocookie.net/ccs/images/2/24/Touya_Thumb.png/revision/latest/scale-to-width-down/147?cb=20180902112735', 5),

('Yukito', 'Duas Almas',
 '<h2>Biografia</h2>
<p>Yukito Tsukishiro é, na superfície, um estudante do colégio Seijou — melhor amigo de Touya, querido por todos e conhecido por seu sorriso gentil e seu apetite descomunal. Mas por baixo dessa personalidade calorosa existe sua verdadeira natureza: <strong>Yue</strong>, o segundo e último Guardião das Cartas Clow, criado pelo Mago Clow Reed.</p>
<p>Yue foi criado para ser o <strong>juiz do Juízo Final</strong> — enquanto Kero escolhe o candidato a novo mestre das cartas, é Yue quem o testa para verificar se é digno. Por anos ficou em hibernação dentro de Yukito, que não tinha consciência alguma de sua outra forma.</p>
<br><br>
<h2>Duas Personalidades, Duas Formas</h2>
<p><strong>Yukito</strong> é gentil, otimista, extremamente popular e adora comer — literalmente qualquer coisa e em grande quantidade. Ele é atlético, cozinha bem e é um excelente jogador de basquete. Sua personalidade calorosa contrasta completamente com a de sua outra forma.</p>
<p><strong>Yue</strong> é frio, reservado, stoico e distante. Com longos cabelos prateados trançados e asas angelicais brancas, sua aparência é tão imponente quanto sua personalidade é difícil. Ele é profundamente leal ao seu criador, Clow Reed, e levou tempo para aceitar Sakura como nova mestra — mas quando o fez, tornou-se um guardião igualmente dedicado a ela.</p>
<br><br>
<h2>Poderes</h2>
<p>Os poderes de Yue são regidos pela <strong>Lua</strong> e pela magia oriental. Suas cartas regentes principais são <strong>The Dark, The Watery e The Windy</strong>. Diferente de Kero, cuja energia vem do Sol, Yue depende diretamente do poder mágico de seu mestre para sobreviver — o que gerou uma crise no segundo arco, quando a magia de Sakura ainda era insuficiente para sustentá-lo. Isso se refletia em Yukito através de um apetite cada vez maior e um cansaço extremo.</p>
<br><br>
<h2>Relacionamentos</h2>
<p>Yukito é namorado de <strong>Touya</strong> — e os dois são um dos pares mais queridos da série. Touya chega a sacrificar todos os seus poderes mágicos para salvar Yue de desaparecer, em um dos momentos mais emocionantes do manga. Com <strong>Sakura</strong>, Yukito mantém uma amizade profunda e sincera — ele a rejeita gentilmente quando ela confessa seus sentimentos, dizendo que ela encontrará outra pessoa para amar. Com <strong>Kero</strong>, são "irmãos guardiões" criados juntos por Clow, mas com personalidades completamente opostas.</p>
<br><br>
<h2>Curiosidades</h2>
<p>
- O nome <strong>Yue</strong> significa <em>"lua"</em> em chinês mandarim — uma referência direta à sua fonte de poder.<br><br>
- O nome <strong>Yukito</strong> (雪兎) significa <em>"coelho de neve"</em>, e seu sobrenome Tsukishiro (月城) pode ser traduzido como <em>"castelo da lua"</em> — uma referência ao folclore chinês que fala de um coelho que vive na lua.<br><br>
- O aniversário de Yukito é <strong>25 de dezembro</strong> — dia de Natal! — e ele não tem matéria favorita nem comida que não goste.<br><br>
- A razão do apetite enorme de Yukito é que, inconscientemente, ele <strong>come pelos dois</strong> — por ele e por Yue, cuja forma verdadeira não consegue comer.<br><br>
- Tanto Sakura quanto Syaoran sentiam atração por Yukito — mas isso era na verdade uma <strong>atração inconsciente pelo poder lunar de Yue</strong>, não um sentimento real por Yukito em si.<br><br>
- Yukito e Touya aparecem juntos em <strong>Tsubasa: Reservoir Chronicle</strong>, onde Touya é rei e Yukito seu sacerdote e conselheiro — o CLAMP os mantém sempre unidos em qualquer universo.
</p>',
 'https://static.wikia.nocookie.net/ccs/images/a/a2/Yukito_Thumb.png/revision/latest/scale-to-width-down/147?cb=20180902112733', 6),

('Yue', 'Duas Almas',
 '<h2>Biografia</h2>
<p>Yukito Tsukishiro é, na superfície, um estudante do colégio Seijou — melhor amigo de Touya, querido por todos e conhecido por seu sorriso gentil e seu apetite descomunal. Mas por baixo dessa personalidade calorosa existe sua verdadeira natureza: <strong>Yue</strong>, o segundo e último Guardião das Cartas Clow, criado pelo Mago Clow Reed.</p>
<p>Yue foi criado para ser o <strong>juiz do Juízo Final</strong> — enquanto Kero escolhe o candidato a novo mestre das cartas, é Yue quem o testa para verificar se é digno. Por anos ficou em hibernação dentro de Yukito, que não tinha consciência alguma de sua outra forma.</p>
<br><br>
<h2>Duas Personalidades, Duas Formas</h2>
<p><strong>Yukito</strong> é gentil, otimista, extremamente popular e adora comer — literalmente qualquer coisa e em grande quantidade. Ele é atlético, cozinha bem e é um excelente jogador de basquete. Sua personalidade calorosa contrasta completamente com a de sua outra forma.</p>
<p><strong>Yue</strong> é frio, reservado, stoico e distante. Com longos cabelos prateados trançados e asas angelicais brancas, sua aparência é tão imponente quanto sua personalidade é difícil. Ele é profundamente leal ao seu criador, Clow Reed, e levou tempo para aceitar Sakura como nova mestra — mas quando o fez, tornou-se um guardião igualmente dedicado a ela.</p>
<br><br>
<h2>Poderes</h2>
<p>Os poderes de Yue são regidos pela <strong>Lua</strong> e pela magia oriental. Suas cartas regentes principais são <strong>The Dark, The Watery e The Windy</strong>. Diferente de Kero, cuja energia vem do Sol, Yue depende diretamente do poder mágico de seu mestre para sobreviver — o que gerou uma crise no segundo arco, quando a magia de Sakura ainda era insuficiente para sustentá-lo. Isso se refletia em Yukito através de um apetite cada vez maior e um cansaço extremo.</p>
<br><br>
<h2>Relacionamentos</h2>
<p>Yukito é namorado de <strong>Touya</strong> — e os dois são um dos pares mais queridos da série. Touya chega a sacrificar todos os seus poderes mágicos para salvar Yue de desaparecer, em um dos momentos mais emocionantes do manga. Com <strong>Sakura</strong>, Yukito mantém uma amizade profunda e sincera — ele a rejeita gentilmente quando ela confessa seus sentimentos, dizendo que ela encontrará outra pessoa para amar. Com <strong>Kero</strong>, são "irmãos guardiões" criados juntos por Clow, mas com personalidades completamente opostas.</p>
<br><br>
<h2>Curiosidades</h2>
<p>
- O nome <strong>Yue</strong> significa <em>"lua"</em> em chinês mandarim — uma referência direta à sua fonte de poder.<br><br>
- O nome <strong>Yukito</strong> (雪兎) significa <em>"coelho de neve"</em>, e seu sobrenome Tsukishiro (月城) pode ser traduzido como <em>"castelo da lua"</em> — uma referência ao folclore chinês que fala de um coelho que vive na lua.<br><br>
- O aniversário de Yukito é <strong>25 de dezembro</strong> — dia de Natal! — e ele não tem matéria favorita nem comida que não goste.<br><br>
- A razão do apetite enorme de Yukito é que, inconscientemente, ele <strong>come pelos dois</strong> — por ele e por Yue, cuja forma verdadeira não consegue comer.<br><br>
- Tanto Sakura quanto Syaoran sentiam atração por Yukito — mas isso era na verdade uma <strong>atração inconsciente pelo poder lunar de Yue</strong>, não um sentimento real por Yukito em si.<br><br>
- Yukito e Touya aparecem juntos em <strong>Tsubasa: Reservoir Chronicle</strong>, onde Touya é rei e Yukito seu sacerdote e conselheiro — o CLAMP os mantém sempre unidos em qualquer universo.
</p>',
 'https://static.wikia.nocookie.net/ccs/images/1/1f/Yue_Thumb.png/revision/latest/scale-to-width-down/147?cb=20180914004207', 7);
