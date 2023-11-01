:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).

servidor(Porta) :-
    http_server(http_dispatch, [port(Porta)]).

:- http_handler('/api/quizInitial', obter_ansiedade, [method(post)]).
obter_ansiedade(Request) :-
    member(method(post), Request), % Verifica se o método é POST
    http_read_data(Request, Data, [to(string)]), % Lê o corpo da solicitação POST como texto
    % Realize o processamento necessário com os dados recebidos no formato Data
    % Por exemplo, você pode chamar um predicado Prolog para lidar com os dados.
    format('Content-type: text/plain; charset=UTF-8~n~n'),
    processar_dados(Data, Resultado),
    format('~w', [Resultado]). % Saída em texto simples

:- servidor(8080).

% Exemplo de processamento de dados (substitua por sua lógica real)
processar_dados(Dados, Resultado) :-
    % Aqui, você pode processar os dados recebidos no formato Dados e gerar um Resultado.
    % Substitua esta lógica pelo processamento real que você deseja realizar.
    Resultado = "Dados processados com sucesso".
