:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).

:- dynamic(facto/2).

servidor(Porta) :-
    http_server(http_dispatch, [port(Porta)]).

:- http_handler('/api/quizInitial', obter_ansiedade, [method(post)]).
obter_ansiedade(Request) :-
    member(method(post), Request),
    http_read_data(Request, Data, [to(string)]),
    Contador = 1, % Inicialize ContadorInicial com o valor desejado  
    processar_corpo(Data, Resultado, Contador),
    format('Content-type: text/plain; charset=UTF-8~n~n'),
    format('Outras informações, se necessário~n'),
    format('Número de fatos criados: ~d~n', [Contador]),
    format('~w', [Resultado]). % Saída em texto simples

:- servidor(8080).

processar_corpo(Dados, Resultado, Contador) :-
    split_string(Dados, "\n", " \n ", Linhas),
    %write(Linhas),    
    remover_espacos_e_linhas(Linhas, ListaSemEspacos),
    processar_pares(ListaSemEspacos, Pares, Contador, NovoContador),
    Resultado = Pares.

processar_pares([], [], Contador, Contador).

processar_pares([Pergunta, Resposta | RestoLinhas], [pergunta(Pergunta, Resposta) | RestoPares], Contador, NovoContador) :-
    assertz(facto(Contador, pergunta(Pergunta, Resposta))),
    NewContadorFactos is Contador + 1,
    processar_pares(RestoLinhas, RestoPares, NewContadorFactos, NovoContador).



remover_espacos_e_linhas([], []).
remover_espacos_e_linhas([Espaco | Resto], SemEspacos) :-
    Espaco = ' ', % Verifica se o elemento é um espaço em branco
    remover_espacos_e_linhas(Resto, SemEspacos).
remover_espacos_e_linhas([LinhaEmBranco | Resto], SemEspacos) :-
    LinhaEmBranco = '', % Verifica se o elemento é uma linha em branco
    remover_espacos_e_linhas(Resto, SemEspacos).
remover_espacos_e_linhas([Elemento | Resto], [Elemento | SemEspacos]) :-
    Elemento \= ' ', % Se o elemento não for um espaço em branco
    Elemento \= '',  % E não for uma linha em branco
    remover_espacos_e_linhas(Resto, SemEspacos).