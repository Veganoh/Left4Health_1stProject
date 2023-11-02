:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

% Defina o tratamento de rota para o servidor
:- http_handler('/rota', seu_predicado, [method(get)]).

% Defina o seu predicado para tratar as solicitações HTTP
seu_predicado(Request) :-
    % Lógica para tratar a solicitação HTTP aqui
    format('Content-type: text/plain~n~n'),
    format('Sua resposta HTTP aqui~n').

% Defina seu servidor aqui
iniciar_servidor :-
    http_server(http_dispatch,[port(8080)]).