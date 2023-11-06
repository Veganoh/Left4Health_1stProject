:- encoding(utf8).

%Base de conhecimento
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


% Método para receber todas as perguntas de todos os tipos de transtorno de maneira aleatória
perguntas_misturadas(ListaPerguntasMisturadas) :-
    todas_perguntas(TodasPerguntas),
    random_permutation(TodasPerguntas, ListaPerguntasMisturadas).

% Método para receber todas as perguntas de todos os tipos de transtorno
    todas_perguntas(ListaPerguntas) :-
        findall((ID, Pergunta), pergunta(_, ID, Pergunta), ListaPerguntas).

% Format the totals as plain text
format_totals([]).
format_totals([[Sindrome, Total] | Rest]) :-
    format('~w: ~w~n', [Sindrome, Total]),
    format_totals(Rest).

% Modified calcula_valores_totais/1 to return a list of syndrome names and totals
calcula_valores_totais(Resultados) :-
    calcular_valor_total_sindrome(ansiedade_Generalizada,[1,2,3,4,5], Total1),
    calcular_valor_total_sindrome(transtorno_de_Panico,[6,7,8,9,10], Total2),
    calcular_valor_total_sindrome(transtorno_de_Panico_com_Agorafobia,[11,12,13,14,15], Total3),
    calcular_valor_total_sindrome(agorafobia,[16,17,18,19,20], Total4),
    calcular_valor_total_sindrome(ansiedade_Social,[21,22,23,24,25], Total5),
    calcular_valor_total_sindrome(fobia_especifica,[26,27,28,29,30], Total6),
    calcular_valor_total_sindrome(mutismo_Seletivo,[31,32,33,34,35], Total7),
    calcular_valor_total_sindrome(ansiedade_de_separacao,[36,37,38,39,40], Total8),
    Resultados = [
        ['ansiedade_Generalizada', Total1],
        ['transtorno_de_Panico', Total2],
        ['transtorno_de_Panico_com_Agorafobia', Total3],
        ['agorafobia', Total4],
        ['ansiedade_Social', Total5],
        ['fobia_especifica', Total6],
        ['mutismo_Seletivo', Total7],
        ['ansiedade_de_separacao', Total8]
    ].

generate_resultados_text([], '').
generate_resultados_text([[Sindrome, Valor] | Rest], Text) :-
    generate_resultados_text(Rest, RestText),
    format(atom(Text), 'Resultados foram: ~w: ~w~n~w', [Sindrome, Valor, RestText]).

calcular_valor_total_sindrome(Transtorno, QuestionIds) :-
    findall(Valor, (
        member(QuestionId, QuestionIds),
        facto(QuestionId, pergunta(QuestionId, Valor))
    ), Valores),
    sum_list(Valores, Total),
    assertz(transtorno(Transtorno, total(Total))),
    %write('Valor Total para '), write(Transtorno), write(': '), 
    write(Total), nl.

calcular_valor_total_sindrome(Transtorno, QuestionIds, Total) :-
    findall(Valor, (
        member(QuestionId, QuestionIds),
        facto(QuestionId, pergunta(QuestionId, Valor))
    ), Valores),
    sum_list(Valores, Total),
    assertz(transtorno(Transtorno, total(Total))).
    %write(transtorno(Transtorno, total(Total))).


format_response([], '').
format_response([(ID, Pergunta) | Rest], Formatted) :-
    format(atom(FormattedPergunta), '~d~n~w~n', [ID, Pergunta]),
    format_response(Rest, RestFormatted),
    atom_concat(FormattedPergunta, RestFormatted, Formatted).



processar_corpo_numbers(Dados, Pares) :-
    split_string(Dados, "\r\n", "\r\n", Linhas),
    split_into_pairs(Linhas, Pares).

split_into_pairs([], []).
split_into_pairs([Number, Answer | Rest], [[NumberInt, AnswerInt] | Pairs]) :-
    atom_number(Number, NumberInt),
    atom_number(Answer, AnswerInt),
    split_into_pairs(Rest, Pairs).

reset_factos:-
    retractall(facto(_,_)),
    retract(ultimo_facto(N)),
    assertz(ultimo_facto(1)).

adicionar_factos([]).
adicionar_factos([[ID,Resposta]]) :-
    !,
    ultimo_facto(N),
    assertz(facto(N, pergunta(ID, Resposta))).
adicionar_factos([[ID,Resposta]|T]):-
    ultimo_facto(N),
    assertz(facto(N,pergunta(ID,Resposta))),
    N1 is N + 1,
    retract(ultimo_facto(N)),
    assertz(ultimo_facto(N1)),
    adicionar_factos(T).