:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).

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



