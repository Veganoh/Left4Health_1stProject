:- set_prolog_flag(encoding, utf8).

:-op(220,xfx,entao).
:-op(35,xfy,se).
:-op(240,fx,regra).
:-op(600,xfy,e).

:-dynamic justifica/3.

% Carregamento da Base de Conhecimento

carrega_bc:-
	write('NOME DA BASE DE CONHECIMENTO (terminar com .)-> '),
% usar se necessario caminho absoluto com / e colocar entre plicas
		read(NBC),
		consult(NBC).

% Arranque do Motor de Inferencia

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
	assertz(facto(N,F)),
	write('Foi concluido o facto n: '),write(N),write(' -> '),write(F),get0(_),!.



% Visualizacao da base de factos

mostra_factos:-
	findall(N, facto(N, _), LFactos),
	escreve_factos(LFactos).

escreve_factos([I|R]):-facto(I,F),
	write('O facto n: '),write(I),write(' -> '),write(F),nl,
	escreve_factos(R).
escreve_factos([]).

calcular_valor_total_sindrome(Transtorno, QuestionIds) :-
    findall(Valor, (
        member(QuestionId, QuestionIds),
        facto(QuestionId, pergunta(QuestionId, Valor))
    ), Valores),
    sum_list(Valores, Total),
    assertz(transtorno(Transtorno, total(Total))),
    %write('Valor Total para '), write(Transtorno), write(': '), 
    write(Total), nl.

calcula_valores_totais :-
    calcular_valor_total_sindrome(ansiedade_Generalizada,[1,2,3,4,5], Total1),
    calcular_valor_total_sindrome(transtorno_de_Panico,[6,7,8,9,10], Total2),
    calcular_valor_total_sindrome(transtorno_de_Panico_com_Agorafobia,[11,12,13,14,15], Total3),
    calcular_valor_total_sindrome(agorafobia,[16,17,18,19,20], Total4),
    calcular_valor_total_sindrome(ansiedade_Social,[21,22,23,24,25], Total5),
    calcular_valor_total_sindrome(fobia_especifica,[26,27,28,29,30], Total6),
    calcular_valor_total_sindrome(mutismo_Seletivo,[31,32,33,34,35], Total7),
    calcular_valor_total_sindrome(ansiedade_de_separacao,[36,37,38,39,40], Total8),
    asserta(su(total(Total1, Total2, Total3, Total4, Total5, Total6, Total7, Total8))),
	write('Total para ansiedade_Generalizada: '), write(Total1), nl,
    write('Total para transtorno_de_Panico: '), write(Total2), nl,
    write('Total para transtorno_de_Panico_com_Agorafobia: '), write(Total3), nl,
    write('Total para agorafobia: '), write(Total4), nl,
    write('Total para ansiedade_Social: '), write(Total5), nl,
    write('Total para fobia_especifica: '), write(Total6), nl,
    write('Total para mutismo_Seletivo: '), write(Total7), nl,
    write('Total para ansiedade_de_separacao: '), write(Total8), nl.

calcular_valor_total_sindrome(Transtorno, QuestionIds, Total) :-
    findall(Valor, (
        member(QuestionId, QuestionIds),
        facto(QuestionId, pergunta(QuestionId, Valor))
    ), Valores),
    sum_list(Valores, Total).



