:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).

:- dynamic(facto/2). % Definindo a estrutura de fato (Pergunta, Resposta).

servidor(Porta) :-
    http_server(http_dispatch, [port(Porta)]).

:- http_handler('/api/quizInitial', obter_ansiedade, [method(post)]).
obter_ansiedade(Request) :-
    member(method(post), Request),
    http_read_data(Request, Data, [to(string)]),
    ContadorInicial = 1, % Inicialize ContadorInicial com o valor desejado
    processar_corpo(Data, Resultado, ContadorInicial, ContadorFinal),
    format('Content-type: text/plain; charset=UTF-8~n~n'),
    format('Post recebido com sucesso~n'),
    format('Numero de fatos criados: ~d~n', [ContadorFinal]),
    format('~w', [Resultado]). % Saída em texto simples


:- servidor(8080).

processar_corpo(Dados, Resultado, Contador, ContadorFinal) :-
    %Linhas= Dados.split('\r\n'),
    split_string(Dados, "\r\n", "\r\n", Linhas),
    remover_espacos_e_linhas(Linhas, ListaSemEspacos),
    split_into_pairs(ListaSemEspacos, Pares),
    processar_pares(Pares, FactosCriados, Contador, ContadorFinal),
    Resultado = FactosCriados.

split_into_pairs([], []).
split_into_pairs([Number, Answer | Rest], [[Number, Answer] | Pairs]) :-
    split_into_pairs(Rest, Pairs).


processar_pares([], [], Contador, Contador).
processar_pares([[Pergunta, Resposta] | RestoLinhas], [pergunta(Pergunta, Resposta) | RestoPares], Contador, ContadorFinal) :-
    atom_codes(AtomPergunta, Pergunta),
    atom_number(AtomPergunta, PeguntaNumber),
    atom_codes(AtomResposta, Resposta),
    assertz(facto(Contador, pergunta(PeguntaNumber, AtomResposta))),
    NewContadorFactos is Contador + 1,
    processar_pares(RestoLinhas, RestoPares, NewContadorFactos, ContadorFinal).




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