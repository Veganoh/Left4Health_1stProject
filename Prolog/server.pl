:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).


servidor(Porta)
:- http_server(http_dispatch, [port(Porta)]).

% Exemplo
:- http_handler('/api/resource', handle_request, [method(GET)]).
handle_request(Request) :-
    % Lógica para lidar com a solicitação HTTP.
    format('Content-type: text/plain~n~n'),
    format('Hello, World!').


% :- http_handler('/api/prolog', obter_questionario, [method(GET)]).

% :- http_handler('/api/prolog', obter_ansiedade, [method(POST)]).


:- servidor(7000).

