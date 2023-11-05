:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).

:-consult('aux_methods.pl'). 
:- consult('engine.pl').


:- dynamic facto/2. % Definindo a estrutura de fato (Pergunta, Resposta).
:- dynamic ultimo_facto/1. %Contador de factos inicias


% Inicia o servidor
servidor(Port) :-
    http_server(http_dispatch, [port(Port)]).

%Pedidos HTTPS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HTTP GET para enviar uma mensagem de sucesso
:- http_handler('/api/sayHello', sayHello, [method(get)]).
sayHello(Request):-
    format('Content-type: text/plain~n~n'),
    format('Hello World!').



% Define a handler for the /api/obtain40Questions endpoint
:- http_handler('/api/obtain40Questions', get_perguntas_40, [method(get)]).
% Handler for the GET request to /api/obtain40Questions endpoint
get_perguntas_40(Request) :-
    perguntas_misturadas(Perguntas),
    format_response(Perguntas, Response),
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-type: text/plain~n~n'),
    format('~s', [Response]).


% HTTP POST to receive answers for quiz40
:- http_handler('/api/answerQuiz40', quiz40, [method(post)]).
quiz40(Request) :-
    member(method(post), Request),
    http_read_data(Request, Data, [to(string)]),
    reset_factos,
    processar_corpo_numbers(Data, Resultado),
    adicionar_factos(Resultado),
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-type: text/plain~n~n'),
    format('').

% Define the route handler for the GET request
:- http_handler('/api/resultados', resultados, [method(get)]).
% Predicate to handle the GET request and send back the calculated results
resultados(Request) :-
    calcula_valores_totais(Resultados),
    format('Content-type: text/plain~n~n', []),
    format_totals(Resultados).

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Metodos auxiliares de manipulação dos pedidos

%format_response([], '').
%format_response([Pergunta|Rest], Formatted) :-
%    format(atom(FormattedPergunta), 'Pergunta: ~s~n', [Pergunta]),
%    format_response(Rest, RestFormatted),
%    atom_concat(FormattedPergunta, RestFormatted, Formatted).

%process_lines([], _).
%process_lines([QuestionIdString, "5"|Rest], QuestionId) :-
 %   atom_number(QuestionIdString, QuestionId),
 %   assertz(facto(QuestionId, pergunta(QuestionId, 5))),
 %   NextQuestionId is QuestionId + 1,
 %   process_lines(Rest, NextQuestionId).


format_response([], '').
format_response([(ID, Pergunta) | Rest], Formatted) :-
    format(atom(FormattedPergunta), '~d~n~w~n', [ID, Pergunta]),
    format_response(Rest, RestFormatted),
    atom_concat(FormattedPergunta, RestFormatted, Formatted).



processar_corpo_numbers(Dados, Pares) :-
    split_string(Dados, "\r\n", "\r\n", Linhas),
    split_into_pairs(Linhas, Pares),
    assertz(resposta(Pares)).
    %create_facts(Pares, FactosCriados, Contador, ContadorFinal),
    %Resultado = FactosCriados.

split_into_pairs([], []).
split_into_pairs([Number, Answer | Rest], [[NumberInt, AnswerInt] | Pairs]) :-
    atom_number(Number, NumberInt),
    atom_number(Answer, AnswerInt),
    split_into_pairs(Rest, Pairs).


%string_to_number([],[]).
%string_to_number([[Pergunta]],[]):-
    string_to_number().

create_facts([], [], Contador, Contador).
create_facts([[Pergunta, Resposta] | RestoLinhas], [pergunta(Pergunta, Resposta) | RestoPares], Contador, ContadorFinal) :-
    atom_codes(AtomPergunta, Pergunta),
    atom_number(AtomPergunta, PeguntaNumber),
    atom_codes(AtomResposta, Resposta),
    assertz(facto(Contador, pergunta(PeguntaNumber, Resposta))),
    NewContadorFactos is Contador + 1,
    create_facts(RestoLinhas, RestoPares, NewContadorFactos, ContadorFinal).

create_facts_numbers([], [], Contador, Contador).
create_facts_numbers([[Pergunta, Resposta] | RestoLinhas], [pergunta(Pergunta, Resposta) | RestoPares], Contador, ContadorFinal) :-
    atom_codes(AtomPergunta, Pergunta),
    atom_number(AtomPergunta, PeguntaNumber),
    atom_codes(AtomResposta, Resposta),
    atom_number(AtomResposta, RespostaNumber),
    assertz(facto(Contador, pergunta(PeguntaNumber, RespostaNumber))),
    NewContadorFactos is Contador + 1,
    create_facts(RestoLinhas, RestoPares, NewContadorFactos, ContadorFinal).
