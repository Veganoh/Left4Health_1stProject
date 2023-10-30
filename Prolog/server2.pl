:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

:- consult('base_conhecimento.pl').

servidor(Porta)
:- http_server(http_dispatch, [port(Porta)]).

% Exemplo
:- http_handler('/api/resource', handle_request, [method(GET)]).
handle_request(Request) :-
    % Lógica para lidar com a solicitação HTTP.
    format('Content-type: text/plain~n~n'),
    format('Hello, World!').


:- http_handler('/api/prolog', obter_questionario, [method(GET)]).
obter_questionario(Request) :-
    format('Content-type: text/plain~n~n'),
    catch(gerar_questionario(Questionario), _, fail),
    format('Content-type: application/json~n~n'),
    format('~q.', [Questionario]).

%:- http_handler('/api/prolog', obter_ansiedade, [method(POST)]).
%readfacts:-
%    open('C:/Users/mariana/Documents/GitHub/Left4Health_1stProject/Prolog/response.txt', read, Str),
%    read_file(Str,Lines),
%    close(Str),
%    write(Lines), nl.

%read_file(Stream,[]) :-
%    at_end_of_stream(Stream).

%read_file(Stream,[X|L]) :-
%    \+ at_end_of_stream(Stream),
%    read(Stream,X),
%    read_file(Stream,L).


readfacts:-
    %working_directory(CurrentDir, CurrentDir),  % Obtém o diretório de trabalho atual
    %concat_atom([CurrentDir, 'response.txt'], FilePath),  % Concatena o diretório atual com o nome do arquivo
    %open(FilePath, read, Str),
    FilePath = 'C:/Users/mariana/Documents/GitHub/Left4Health_1stProject/Prolog/response.txt',
    exists_file(FilePath),
    open(FilePath, read, Str), 
    read_and_assert_facts(Str,1), % Começa com o número da pergunta 1
    close(Str).

read_and_assert_facts(Stream, FactNumber) :-
    \+ at_end_of_stream(Stream),
    read(Stream, QuestionId), % Lê o id da pergunta
    read(Stream, Response),% Lê a resposta
    assertz(facto(FactNumber, pergunta(QuestionId, Response))),
    NextFactNumber is FactNumber + 1,
    read_and_assert_facts(Stream, NextFactNumber).

read_and_assert_facts(_, _).


:- servidor(7000).

