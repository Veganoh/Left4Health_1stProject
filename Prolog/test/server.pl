:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).

:-consult('aux_methods.pl'). 

:- dynamic ultimo_facto/1. %Contador de factos inicias
:- dynamic facto/2. % Definindo a estrutura de fato (Pergunta, Resposta).


% Inicia o servidor
servidor(Initial_facts,Port) :-
    assert(ultimo_facto(Initial_facts)),
    http_server(http_dispatch, [port(Port)]).

%Pedidos HTTPS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HTTP GET para enviar uma mensagem de sucesso
:- http_handler('/api/sayHello', sayHello, [method(get)]).
sayHello(Request):-
    format('Content-type: text/plain~n~n'),
    format('Hello World!').

% Define a handler for the /quizInitial endpoint
:- http_handler('/api/quizInitial', get_perguntas_iniciais, [method(get)]).
% Handler for the GET request to /api/quizInitial endpoint
get_perguntas_iniciais(Request) :-
    todas_perguntas_iniciais(Perguntas),
    format_response(Perguntas, Response),
    format('Content-type: text/plain~n~n'),
    format('~s', [Response]).

% HTTP POST para receber as respostas do quizInitial
:- http_handler('/api/answersQuizInitial', quizInitial, [method(post)]).
quizInitial(Request) :-
    member(method(post), Request),
    http_read_data(Request, Data, [to(string)]),
    ContadorInicial = 1, % Inicialize ContadorInicial com o valor desejado
    processar_corpo(Data, Resultado, ContadorInicial, ContadorFinal),
    %update_last_facts(Initial_facts),
    ValorUltimoFacto is ContadorFinal-1,
    retractall(ultimo_facto(_)), % Remove the existing ultimo_facto
    assert(ultimo_facto(ValorUltimoFacto)), % Assert the new value
    format('Content-type: text/plain; charset=UTF-8~n~n'),
    format('Numero de fatos criados: ~d~n', [ValorUltimoFacto]),
    format('~w', [Resultado]). % Saída em texto simples

% Define a handler for the /api/quiz40 endpoint
:- http_handler('/api/quiz40', get_perguntas_40, [method(get)]).
% Handler for the GET request to /api/quiz40 endpoint
get_perguntas_40(Request) :-
    perguntas_misturadas(Perguntas),
    format_response(Perguntas, Response),
    format('Content-type: text/plain~n~n'),
    format('~s', [Response]).

% Define a handler for the /answersQuiz40 endpoint
%:- http_handler('/api/answersQuiz40', answers_quiz40_handler, [methods([post])]).

% Handler for the POST request to /answersQuiz40 endpoint
%answers_quiz40_handler(Request) :-
%    http_read_data(Request, Data, []),
%    process_input(Data, Response),
%    format('Content-type: text/plain~n~n'),
%    format('~s', [Response]).

answers_quiz40_handler(Request) :-
    http_read_data(Request, Data, []),
    processar_corpo(Data),
    format('Content-type: text/plain~n~n'),
    format('Answers processed and asserted as facts.').

process_and_assert_answers(InputData) :-
    split_string(InputData, "\n", "", Lines),
    process_lines(Lines, 1).

process_lines([], _).
process_lines([QuestionIdString, "5"|Rest], QuestionId) :-
    atom_number(QuestionIdString, QuestionId),
    assertz(facto(QuestionId, pergunta(QuestionId, 5))),
    NextQuestionId is QuestionId + 1,
    process_lines(Rest, NextQuestionId).

% HTTP POST to receive answers for quiz40
:- http_handler('/api/answersQuiz40', quiz40, [method(post)]).
quiz40(Request) :-
    member(method(post), Request),
    http_read_data(Request, Data, [to(string)]),
    processar_corpo(Data, Resultado, 1, ContadorFinal),
    ValorUltimoFacto is ContadorFinal - 1,
    retractall(ultimo_facto(_)), % Remove the existing ultimo_facto
    assert(ultimo_facto(ValorUltimoFacto)), % Assert the new value
    format('Content-type: text/plain; charset=UTF-8~n~n'),
    format('Numero de fatos criados: ~d~n', [ValorUltimoFacto]),
    format('~w', [Resultado]). % Saída em texto simples

calcular_valor_total_sindrome(Transtorno, QuestionIds) :-
    findall(Valor, (
        member(QuestionId, QuestionIds),
        facto(QuestionId, pergunta(QuestionId, Valor))
    ), Valores),
    sum_list(Valores, Total),
    assertz(transtorno(Transtorno, total(Total))),
    %write('Valor Total para '), write(Transtorno), write(': '), 
    write(Total), nl.

calcula_valores_totais :-
    calcular_valor_total_sindrome(ansiedade_Generalizada,[1,2,3,4,5], Total1),
    calcular_valor_total_sindrome(transtorno_de_Panico,[6,7,8,9,10], Total2),
    calcular_valor_total_sindrome(transtorno_de_Panico_com_Agorafobia,[11,12,13,14,15], Total3),
    calcular_valor_total_sindrome(agorafobia,[16,17,18,19,20], Total4),
    calcular_valor_total_sindrome(ansiedade_Social,[21,22,23,24,25], Total5),
    calcular_valor_total_sindrome(fobia_especifica,[26,27,28,29,30], Total6),
    calcular_valor_total_sindrome(mutismo_Seletivo,[31,32,33,34,35], Total7),
    calcular_valor_total_sindrome(ansiedade_de_separacao,[36,37,38,39,40], Total8),
    assertz(total_calculado(ansiedade_Generalizada, Total1)),
    assertz(total_calculado(transtorno_de_Panico, Total2)),
    assertz(total_calculado(transtorno_de_Panico_com_Agorafobia, Total3)),
    assertz(total_calculado(agorafobia, Total4)),
    assertz(total_calculado(ansiedade_Social, Total5)),
    assertz(total_calculado(fobia_especifica, Total6)),
    assertz(total_calculado(mutismo_Seletivo, Total7)),
    assertz(total_calculado(ansiedade_de_separacao, Total8)),
	write('Total para ansiedade_Generalizada: '), write(Total1), nl,
    write('Total para transtorno_de_Panico: '), write(Total2), nl,
    write('Total para transtorno_de_Panico_com_Agorafobia: '), write(Total3), nl,
    write('Total para agorafobia: '), write(Total4), nl,
    write('Total para ansiedade_Social: '), write(Total5), nl,
    write('Total para fobia_especifica: '), write(Total6), nl,
    write('Total para mutismo_Seletivo: '), write(Total7), nl,
    write('Total para ansiedade_de_separacao: '), write(Total8), nl.

calcular_valor_total_sindrome(Transtorno, QuestionIds, Total) :-
    findall(Valor, (
        member(QuestionId, QuestionIds),
        facto(QuestionId, pergunta(QuestionId, Valor))
    ), Valores),
    sum_list(Valores, Total).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Metodos auxiliares de manipulação dos pedidos

format_response([], '').
format_response([Pergunta|Rest], Formatted) :-
    format(atom(FormattedPergunta), 'Pergunta: ~s~n', [Pergunta]),
    format_response(Rest, RestFormatted),
    atom_concat(FormattedPergunta, RestFormatted, Formatted).

processar_corpo(Dados, Resultado, Contador, ContadorFinal) :-
    split_string(Dados, "\r\n", "\r\n", Linhas),
    split_into_pairs(Linhas, Pares),
    create_facts(Pares, FactosCriados, Contador, ContadorFinal),
    Resultado = FactosCriados.

split_into_pairs([], []).
split_into_pairs([Number, Answer | Rest], [[Number, Answer] | Pairs]) :-
    split_into_pairs(Rest, Pairs).


create_facts([], [], Contador, Contador).
create_facts([[Pergunta, Resposta] | RestoLinhas], [pergunta(Pergunta, Resposta) | RestoPares], Contador, ContadorFinal) :-
    atom_codes(AtomPergunta, Pergunta),
    atom_number(AtomPergunta, PeguntaNumber),
    atom_codes(AtomResposta, Resposta),
    assertz(facto(Contador, pergunta(PeguntaNumber, AtomResposta))),
    NewContadorFactos is Contador + 1,
    create_facts(RestoLinhas, RestoPares, NewContadorFactos, ContadorFinal).
