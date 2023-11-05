:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).

:- consult('aux_methods.pl'). 
:- consult('engine.pl').

:- dynamic facto/2.
:- dynamic ultimo_facto/1.

% Inicia o servidor
servidor(Port) :-
    http_server(http_dispatch, [port(Port)]).


% Define a handler for the /quizInitial endpoint
:- http_handler('/api/obtainInitialQuestions', get_perguntas_iniciais, [method(GET)]).
% Handler for the GET request to /api/quizInitial endpoint
get_perguntas_iniciais(Request) :-
    todas_perguntas_iniciais(Perguntas),
    format_response(Perguntas, Response),
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-type: text/plain~n~n'),
    format('~s', [Response]).


:- http_handler('/api/submitQuizInitial', quizInitial, [method(POST)]).
quizInitial(Request) :-
    member(method(POST), Request),
    http_read_data(Request, Data, [to(string)]),
    reset_factos,
    processar_corpo(Data, Resultado),
    adicionar_factos(Resultado),
    arranca_motor,
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-type: text/plain~n~n'),
    format('').


:- http_handler('/api/obtainInitialAnswers', obtainInitialAnswers, [method(GET)]).
obtainInitialAnswers(Request) :-
    facto(8,conclusao(C)),
    conclusao(C,Resposta),
    reset_factos,
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-type: text/plain~n~n'),
    format('~s', [Resposta]).


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
