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

% Define a handler for the /api/quiz40 endpoint
:- http_handler('/api/quiz40', get_perguntas_40, [method(get)]).
% Handler for the GET request to /api/quiz40 endpoint
get_perguntas_40(Request) :-
    perguntas_misturadas(Perguntas),
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

