:- encoding(utf8).

%Base de conhecimento
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Perguntas relacionas com o quiz Initial
pergunta_inicial(quizInitial, 41, "Possuí alguma condição clinica do diagnóstico diferencial pode explicar os sintomas?").
pergunta_inicial(quizInitial, 42, "Você sente ansiedade e preocupação excessiva em relação a várias áreas da sua vida na maioria dos dias há pelo menos seis meses?").
pergunta_inicial(quizInitial, 43, "Você sente que sua preocupação é desproporcional em relação à situação ou que você não consegue controlá-la?").
pergunta_inicial(quizInitial, 44, "Nos últimos seis meses, quantos sintomas dos seguintes sentiu na maioria dos dias: inquietação, fadiga, dificuldade de concentração, irritabilidade, tensão muscular ou problemas para dormir?").
pergunta_inicial(quizInitial, 45, "Você já foi diagnosticado ou acredita que sua ansiedade excessiva não pode ser explicada por outro problema de saúde mental, como transtorno de pânico, fobia social, transtorno obsessivo-compulsivo, ou outros transtornos similares?").
pergunta_inicial(quizInitial, 46, "Essa ansiedade, preocupação ou sintomas físicos causam um impacto significativo em sua vida social, profissional ou em outras áreas importantes?").
pergunta_inicial(quizInitial, 47, "Os sintomas podem ser explicados por uso de medicamentos, abuso de substâncias ou síndrome de abstinência?").

%Conclusões 
conclusao(anxiety_as_normal_factor, "Ansiedade como condição do ser humano").
conclusao(anxiety_secondary_factor, "Tratar condição clínica e reavaliar persistência ou não dos sintomas de ansiedade após tratamento").
conclusao(anxiety_meds_factor, "Reavaliar necessidade dos medicamentos, tratar abuso de substância ou síndrome de abstinência e após reavaliar persistência ou não dos sintomas ansiosos.").
conclusao(check_the_doctor, "Contactar um Especialista").
conclusao(start_quiz40, "Vai iniciar um questionário de 40 perguntas").

%Manipulação de perguntas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Método para receber todas as perguntas iniciais todos os tipos de transtorno
todas_perguntas_iniciais(ListaPerguntasInicias) :-
    findall((ID, Pergunta), pergunta_inicial(_, ID, Pergunta), ListaPerguntasInicias).

    format_response([], '').
format_response([(ID, Pergunta) | Rest], Formatted) :-
    format(atom(FormattedPergunta), '~d~n~w~n', [ID, Pergunta]),
    format_response(Rest, RestFormatted),
    atom_concat(FormattedPergunta, RestFormatted, Formatted).


processar_corpo(Dados, Pares) :-
    split_string(Dados, "\r\n", "\r\n", Linhas),
    split_into_pairs(Linhas, Pares),
    assertz(resposta(Pares)).

split_into_pairs([], []).
split_into_pairs([Number, Answer | Rest], [[Number, Answer] | Pairs]) :-
    split_into_pairs(Rest, Pairs).

reset_factos:-
    retractall(facto(_,_)),
    retract(ultimo_facto(N)),
    assertz(ultimo_facto(1)).
