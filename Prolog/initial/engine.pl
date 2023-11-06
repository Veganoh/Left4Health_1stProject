%% Servidor
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).


:-consult('aux_methods.pl').

:- encoding(utf8).

:-op(220,xfx,entao).
:-op(35,xfy,se).
:-op(240,fx,regra).
:-op(600,xfy,e).

:- dynamic justifica/3.


%% Servidor

servidor(Port) :-
	carrega_bc,
    http_server(http_dispatch, [port(Port)]).

:- http_handler('/api/obtainInitialQuestions', get_perguntas_iniciais, [method(GET)]).
get_perguntas_iniciais(Request) :-
    todas_perguntas_iniciais(Perguntas),
    format_response(Perguntas, Response),
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-type: text/plain~n~n'),
    format('~s', [Response]).

:- http_handler('/api/answerQuizInitial', quizInitial, []).
quizInitial(Request) :-
    http_read_data(Request, Data, [to(string)]),
    reset_factos,
    processar_corpo(Data, Resultado),
    adicionar_factos(Resultado),
	arranca_motor1,
	facto(8,conclusao(C)),
    conclusao(C,Resposta),
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-type: text/plain~n~n'),
    format('~s', [Resposta]).

carrega_bc:-
		consult('C:/Users/mafs6/Documents/GitHub/Left4Health_1stProject/Prolog/initial/rules.txt').

% Arranque do Motor de Infer�ncia

arranca_motor1:-
	findall(_,arranca_motor,_).

arranca_motor:-facto(N,Facto),
		regra ID se LHS entao RHS,
		facto_dispara_regra(N,Facto,ID,LHS,RHS),
		ultimo_facto(N),ultima_regra(ID).

% Verificar se o LHS da regra tem sucesso

facto_dispara_regra(N,Facto,ID,LHS,RHS):-
	facto_esta_numa_condicao(Facto,LHS),
	verifica_condicoes(LHS,LFactos),
	member(N,LFactos),
	concluir(RHS,ID,LFactos),
	!.

facto_dispara_regra(_,_,_,_,_).


facto_esta_numa_condicao(F,[F  e _]).

facto_esta_numa_condicao(F,[avalia(F1)  e _]):- F=..[X,X1|_],F1=..[X,X1|_].

facto_esta_numa_condicao(F,[_ e Fs]):-
	facto_esta_numa_condicao(F,[Fs]).

facto_esta_numa_condicao(F,[F]).

facto_esta_numa_condicao(F,[avalia(F1)]):-F=..[X,X1|_],F1=..[X,X1|_].



verifica_condicoes([X e Y],[N|LF]):-
	facto(N,X),!,
	verifica_condicoes([Y],LF).

verifica_condicoes([avalia(X) e Y],[N|LF]):-
	avalia(N,X),!,
	verifica_condicoes([Y],LF).

verifica_condicoes([X],[N]):- facto(N,X),!.

verifica_condicoes([avalia(X)],[N]):- avalia(N,X).


avalia(N,P):-	P=..[Functor,Entidade,Operando,Valor],
		P1=..[Functor,Entidade,Valor1],
		facto(N,P1),
		compara(Valor1,Operando,Valor).

compara(V1,==,V):- V1==V.
compara(V1,\==,V):- V1\==V.
compara(V1,>,V):-V1>V.
compara(V1,<,V):-V1<V.
compara(V1,>=,V):-V1>=V.
compara(V1,=<,V):-V1=<V.


% Aplicar o RHS da regra que foi disparada com sucesso

concluir([cria_facto(F)|Y],ID,LFactos):-
	!,
	cria_facto(F,ID,LFactos),
	concluir(Y,ID,LFactos).

concluir([],_,_):-!.

cria_facto(F,_,_):-
	facto(_,F),!.

cria_facto(F,ID,LFactos):-
	retract(ultimo_facto(N1)),
	N is N1+1,
	asserta(ultimo_facto(N)),
	assertz(justifica(N,ID,LFactos)),
	assertz(facto(N,F)).
	%write('Foi conclu�do o facto n� '),write(N),write(' -> '),write(F),get0(_),!.


% Visualiza��o da base de factos

mostra_factos:-
	findall(N, facto(N, _), LFactos),
	escreve_factos(LFactos).

escreve_factos([I|R]):-facto(I,F),
	write('O facto n� '),write(I),write(' -> '),write(F),nl,
	escreve_factos(R).
escreve_factos([]).

%Funções feitas por nos

adicionar_factos([]).
adicionar_factos([[ID,Resposta]]) :-
    !,
    ultimo_facto(N),
    assertz(facto(N, pergunta(ID, Resposta))).
adicionar_factos([[ID,Resposta]|T]):-
    ultimo_facto(N),
    assertz(facto(N,pergunta(ID,Resposta))),
    N1 is N + 1,
    retract(ultimo_facto(N)),
    assertz(ultimo_facto(N1)),
    adicionar_factos(T).