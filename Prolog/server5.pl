:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).
:- consult('Projeto Prolog.pl').

:- dynamic(facto/2). % Definindo a estrutura de fato (Pergunta, Resposta).

servidor(Porta) :-
    http_server(http_dispatch, [port(Porta)]).

:- http_handler('/api/quizInitial', quizInitial, [method(post)]).
quizInitial(Request) :-
    member(method(post), Request),
    http_read_data(Request, Data, [to(string)]),
    ContadorInicial = 1, % Inicialize ContadorInicial com o valor desejado
    processar_corpo(Data, Resultado, ContadorInicial, ContadorFinal),
    format('Content-type: text/plain; charset=UTF-8~n~n'),
    format('Numero de fatos criados: ~d~n', [ContadorFinal-1]),
    format('~w', [Resultado]). % Saída em texto simples

% Define a handler for the /quizInitial1 endpoint
:- http_handler('/api/quizInitial1', get_perguntas_iniciais, [method(GET)]).

% Handler for the GET request to /api/quizInitial1 endpoint
get_perguntas_iniciais(Request) :-
    todas_perguntas_iniciais(Perguntas),
    format_response(Perguntas, Response),
    format('Content-type: text/plain~n~n'),
    format('~s', [Response]).

% Define a handler for the /api/quiz40 endpoint
:- http_handler('/api/quiz40', get_perguntas_40, [method(GET)]).

% Handler for the GET request to /api/quiz40 endpoint
get_perguntas_40(Request) :-
    perguntas_misturadas(Perguntas),
    format_response(Perguntas, Response),
    format('Content-type: text/plain~n~n'),
    format('~s', [Response]).

format_response([], '').
format_response([Pergunta|Rest], Formatted) :-
    format(atom(FormattedPergunta), 'Pergunta: ~s~n', [Pergunta]),
    format_response(Rest, RestFormatted),
    atom_concat(FormattedPergunta, RestFormatted, Formatted).


:- servidor(8080).

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




