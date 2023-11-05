:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).

:- dynamic(facto/2). % Definindo a estrutura de fato (Pergunta, Resposta).


servidor(Porta) :-
    http_server(http_dispatch, [port(Porta)]).

:- http_handler('/api/quizInitial', obter_ansiedade, [method(post)]).
obter_ansiedade(Request) :-
    member(method(post), Request), % Verifica se o método é POST
    http_read_data(Request, Data, [to(string)]), % Lê o corpo da solicitação POST como texto
    % Realize o processamento necessário com os dados recebidos no formato Data
    % Por exemplo, você pode chamar um predicado Prolog para lidar com os dados.
    processar_corpo(Data, Resultado, 1),
    format('Content-type: text/plain; charset=UTF-8~n~n'),
    format('Outras informações, se necessário~n').
    %format('Contador: ~d~n', [Contador]), % Envia o contador como resposta em texto 
    %format('Contador de factos: ~d~n', [Contador]).
    %format('~w', [Resultado]). % Saída em texto simples
    

:- servidor(7000).

   

processar_corpo(Dados, Resultado, Contador) :-
    % Aqui, você pode processar as respostas recebidas no formato Dados e gerar um Resultado.
    % Substitua esta lógica pelo processamento real que você deseja realizar.
    split_string(Dados, "\n", "\n", Linhas),
    processar_pares(Linhas, Pares, Contador), 
    Resultado = Pares.
    %Resultado = "Dados processados com sucesso".

processar_pares([], [], 0).
processar_pares([_, _ | Resto], Pares, Contador) :-        
    assertz(facto(Contador, pergunta(Pergunta, Resposta))),
    NewContadorFactos is ContadorFactos + 1,
    processar_respostas(Resto, Pares, NewContadorFactos).
