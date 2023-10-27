:- set_prolog_flag(encoding, utf8).

% Perguntas relacionas com o quiz Initial
pergunta(quizInitial, 41, "Possuí alguma condição clinica do diagnóstico diferencial pode explicar os sintomas?").
pergunta(quizInitial, 42, "Você sente ansiedade e preocupação excessiva em relação a várias áreas da sua vida na maioria dos dias há pelo menos seis meses?").
pergunta(quizInitial, 43, "Você sente que sua preocupação é desproporcional em relação à situação ou que você não consegue controlá-la?").
pergunta(quizInitial, 44, "Nos últimos seis meses, quantos sintomas dos seguintes sentiu na maioria dos dias: inquietação, fadiga, dificuldade de concentração, irritabilidade, tensão muscular ou problemas para dormir?").
pergunta(quizInitial, 45, "Você já foi diagnosticado ou acredita que sua ansiedade excessiva não pode ser explicada por outro problema de saúde mental, como transtorno de pânico, fobia social, transtorno obsessivo-compulsivo, ou outros transtornos similares?").
pergunta(quizInitial, 46, "Essa ansiedade, preocupação ou sintomas físicos causam um impacto significativo em sua vida social, profissional ou em outras áreas importantes?").
pergunta(quizInitial, 47, "Os sintomas podem ser explicados por uso de medicamentos, abuso de substâncias ou síndrome de abstinência?").


% Perguntas relacionadas à Síndrome de Ansiedade Generalizada
pergunta(sindrome_ansiedade_generalizada, 1, "Nas últimas semanas, com que frequência você se sentiu tenso, nervoso ou ansioso, mesmo quando não havia motivo óbvio para se sentir assim?").
pergunta(sindrome_ansiedade_generalizada, 2, "Você tem dificuldade em controlar seus pensamentos ansiosos, mesmo quando tenta concentrar-se em outras coisas?").
pergunta(sindrome_ansiedade_generalizada, 3, "Você sentiu-se agitado ou incapaz de se acalmar nos últimos dias?").
pergunta(sindrome_ansiedade_generalizada, 4, "Você tem experimentado sensações físicas de ansiedade, como batimentos cardíacos acelerados, sudorese ou tremores, mesmo quando não há uma razão física para esses sintomas?").
pergunta(sindrome_ansiedade_generalizada, 5, "Você evita situações ou atividades porque se sente excessivamente ansioso ou teme ter uma crise de ansiedade?").

% Perguntas relacionadas ao Transtorno de Pânico
pergunta(transtorno_panico, 6, "Você já teve ataques de pânico inesperados, nos quais você sentiu um medo intenso ou desconforto súbito, acompanhado por sintomas físicos como batimentos cardíacos acelerados, tremores, falta de ar, tonturas ou sensação de desmaio?").
pergunta(transtorno_panico, 7, "Você já teve um ataque de pânico inesperado que levou a uma sensação de formigamento ou dormência em partes do corpo, como mãos, pés ou rosto, acompanhado por um medo intenso de estar tendo um problema médico grave, como um ataque cardíaco ou um derrame?").
pergunta(transtorno_panico, 8, "Você já teve pensamentos recorrentes de que algo terrível poderia acontecer, mesmo quando não há uma razão óbvia para sentir medo?").
pergunta(transtorno_panico, 9, "Durante um ataque de pânico, você tem uma sensação de desrealização ou de estar fora de controle da situação?").
pergunta(transtorno_panico, 10, "Você experimenta ansiedade constante ou antecipatória sobre a possibilidade de ter outro ataque de pânico?").

% Perguntas relacionadas ao Transtorno de Pânico com Agorafobia
pergunta(transtorno_panico_agorafobia, 11, "Você tem ataques de pânico inesperados e, como resultado, evita lugares públicos, multidões ou situações em que se sente preso, como filas ou transportes públicos?").
pergunta(transtorno_panico_agorafobia, 12, "Você evita situações em que pode se sentir envergonhado ou incapaz de escapar facilmente, como ir a eventos sociais, fazer compras ou viajar sozinho(a)?").
pergunta(transtorno_panico_agorafobia, 13, "Você experimenta um medo intenso ou ansiedade ao pensar em entrar em situações específicas ou lugares, mesmo que você não tenha tido um ataque de pânico nesses lugares antes?").
pergunta(transtorno_panico_agorafobia, 14, "Você precisa ter um companheiro(a) de confiança presente para se sentir confortável ao enfrentar situações temidas ou sair de casa?").
pergunta(transtorno_panico_agorafobia, 15, "Você tem evitado ou teve dificuldade em enfrentar situações sociais ou públicas, mesmo que você queira superar esse medo?").

% Perguntas relacionadas à Agorafobia
pergunta(agorafobia, 16, "Você evita lugares públicos ou situações onde poderia se sentir constrangido(a) ou onde seria difícil escapar ou obter ajuda em caso de emergência?").
pergunta(agorafobia, 17, "Você tem medo de estar em espaços abertos, como parques ou praças, ou em espaços fechados, como lojas ou cinemas?").
pergunta(agorafobia, 18, "Você evita viajar em transportes públicos, como ônibus ou metrô, devido ao medo de ter um ataque de pânico ou outra situação desconfortável?").
pergunta(agorafobia, 19, "Você sente ansiedade intensa ao pensar em estar em uma fila, em um local lotado ou em meio a multidões?").
pergunta(agorafobia, 20, "Você tem medo de sair de casa sozinho(a) e, portanto, raramente o faz, mesmo para atividades simples como ir à mercearia ou ao correio?").

% Perguntas relacionadas à Ansiedade Social
pergunta(ansiedade_social, 21, "Você sente um medo intenso e persistente de situações sociais ou de performance, onde você poderia ser avaliado por outras pessoas, como falar em público, participar de reuniões ou mesmo interagir em pequenos grupos?").
pergunta(ansiedade_social, 22, "Você evita ou sente uma grande ansiedade ao enfrentar situações sociais, muitas vezes antecipando-as com medo dias ou semanas antes?").
pergunta(ansiedade_social, 23, "Você tem um medo excessivo de ser humilhado, criticado ou rejeitado em situações sociais, levando a evitar essas situações sempre que possível?").
pergunta(ansiedade_social, 24, "Você evita fazer atividades do dia a dia, como comer em público, usar banheiros públicos ou falar ao telefone em presença de outras pessoas, devido ao medo do julgamento alheio?").
pergunta(ansiedade_social, 25, "A ansiedade social interfere significativamente na sua vida diária, trabalho ou relacionamentos, levando a uma diminuição da qualidade de vida?").

% Perguntas relacionadas à Fobia Específica
pergunta(fobia_especifica, 26, "Você tem um medo intenso e persistente de um objeto, animal, situação ou atividade específica, como voar, altura, aranhas ou agulhas?").
pergunta(fobia_especifica, 27, "Você evita consistentemente o objeto ou a situação temida, ou a enfrenta com intensa ansiedade ou medo?").
pergunta(fobia_especifica, 28, "O seu medo é irracional ou desproporcional em relação ao perigo real representado pelo objeto ou situação específica?").
pergunta(fobia_especifica, 29, "Você sente ansiedade ou pânico apenas ao pensar na presença ou na possibilidade de encontrar o objeto ou situação temidos?").
pergunta(fobia_especifica, 30, "Se confrontado com o objeto ou situação temidos, você experimenta sintomas físicos como palpitações, sudorese, tremores ou falta de ar?").

% Perguntas relacionadas ao Mutismo Seletivo
pergunta(mutismo_seletivo, 31, "A pessoa é capaz de falar em algumas situações, mas recusa falar em situações sociais específicas, mesmo que a necessidade de falar seja esperada ou esperada socialmente?").
pergunta(mutismo_seletivo, 32, "Evitação persistente de interações sociais que envolvem a necessidade de falar, mesmo que seja necessário para o trabalho ou relacionamentos pessoais?").
pergunta(mutismo_seletivo, 33, "Intensa ansiedade ou pânico ao deparar-se com situações em que é esperado que fale, levando à evitação dessas situações sempre que possível?").
pergunta(mutismo_seletivo, 34, "A incapacidade de falar em determinadas situações sociais interfere significativamente na vida diária, profissional ou pessoal da pessoa, causando prejuízos em sua vida?").
pergunta(mutismo_seletivo, 35, "Consciência da dificuldade de falar em determinadas situações e angústia associada a essa incapacidade, mas ainda assim, não consegue superar essa barreira?").

% Perguntas relacionadas à Ansiedade de Separação
pergunta(ansiedade_separacao, 36, "Tem um sentimento excessivo de ansiedade quando se aproxima o momento de se separar de pessoas significativas, como parceiro(a), familiares ou amigos próximos?").
pergunta(ansiedade_separacao, 37, "Tem uma preocupação constante com o bem-estar da pessoa de quem estão se separando, mesmo que esteja apenas temporariamente ausente?").
pergunta(ansiedade_separacao, 38, "Evita atividades ou situações que envolvem separação, mesmo quando são necessárias para o trabalho, socialização ou outras atividades diárias?").
pergunta(ansiedade_separacao, 39, "Há pesadelos frequentes envolvendo a ideia da separação ou da perda de uma pessoa significativa?").
pergunta(ansiedade_separacao, 40, "Tem sintomas físicos de ansiedade, como palpitações, sudorese, tremores ou falta de ar, ao pensar na ideia de se separar da pessoa significativa?").

% Conclusões
% --------------------------------------------------------------------------------------------------

resposta(nenhum_transtorno, "Não atinge os valores suficientes para nenhum dos transtornos, consulte um profissional para receber uma solução melhor. Pedimos desculpa que não o consegimos ajudar.").



% Método para receber todas as perguntas de todos os tipos de transtorno
todas_perguntas(ListaPerguntas) :-
    findall(Pergunta, pergunta(_, _, Pergunta), ListaPerguntas).

% Método para receber todas as perguntas de todos os tipos de transtorno de maneira aleatória
perguntas_misturadas(ListaPerguntasMisturadas) :-
    todas_perguntas(TodasPerguntas),
    random_permutation(TodasPerguntas, ListaPerguntasMisturadas).

% Predicado para armazenar todas as respostas
armazenar_todas_respostas(ListaRespostas) :-
    findall(resposta_valor(Pergunta, Valor), resposta_valor(Pergunta, Valor), ListaRespostas).

% Predicado para receber uma resposta
receber_resposta(Pergunta) :-
    pergunta(Pergunta, _),
    read(Resposta),
    asserta(resposta_valor(Pergunta, Resposta)).
    
pergunta_valor(1, 1).  
pergunta_valor(2, 2).  
pergunta_valor(3, 3).  
pergunta_valor(4, 4).  
pergunta_valor(5, 5).

% pergunta_valor(IdPergunta, Resposta, Valor).

% Estrutura de dados para armazenar respostas e valores
resposta_valor(Pergunta, Valor) :- pergunta_valor(Pergunta, Valor).

% Predicado para calcular a soma total das respostas
soma_total(Soma) :-
    findall(Valor, resposta_valor(_, Valor), Valores),
    sum_list(Valores, Soma).

% Predicado para verificar a presença da resposta quando nenhum transtorno passou do minimo
nenhum_transtorno :-
    findall(Valor, resposta_valor(_, Valor), Valores),
    max_list(Valores, MaiorValor),
    MaiorValor =< 15.

% Predicado para verificar a presença da resposta que devolve os tipos e os valores de transtorno que ultrapassaram o 14
transtorno_maior_14 :-
    findall(Valor, resposta_valor(_, Valor), Valores),
    member(Valor, Valores),
    Valor >= 15.

% Predicado para calcular a soma dos valores para um tipo de transtorno específico
processar_respostas(Resposta) :-
    soma_total(SomaTotal),
    (nenhum_transtorno -> Resposta = 'A';
    transtorno_entre_15_e_20 -> findall(TipoTranstorno-Soma, (resposta_valor(TipoTranstorno, Soma), Soma >= 15, Soma =< 20), Resposta);
    SomaTotal > 160 -> Resposta = 'C').

processar_respostas_teste(Resposta) :-
    soma_total(SomaTotal),
    (nenhum_transtorno ->
        resposta(nenhum_transtorno, Mensagem),
        Resposta = (nenhum_transtorno, Mensagem);
    transtorno_maior_14 ->
        findall(TipoTranstorno-Soma, (resposta_valor(TipoTranstorno, Soma), Soma >= 15, Soma =< 20), [TipoTranstorno-_|_]),
        pergunta(TipoTranstorno, Resposta);
    SomaTotal > 160 -> Resposta = 'C').
