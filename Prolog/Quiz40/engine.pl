%% Servidor
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_server)).
:- use_module(library(http/http_client)).

:- consult('aux_methods.pl').

:- encoding(utf8).

:-op(220,xfx,entao).
:-op(35,xfy,se).
:-op(240,fx,regra).
:-op(500,fy,nao).
:-op(600,xfy,e).

:-dynamic justifica/3.

%% Servidor

servidor(Port) :-
	carrega_bc,
    http_server(http_dispatch, [port(Port)]).

:- http_handler('/api/obtain40Questions', get_perguntas_40, [method(GET)]).
get_perguntas_40(Request) :-
    perguntas_misturadas(Perguntas),
    format_response(Perguntas, Response),
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-type: text/plain~n~n'),
    format('~s', [Response]).

:- http_handler('/api/answerQuiz40', quiz40, [method(POST)]).
quiz40(Request) :-
    member(method(POST), Request),
    http_read_data(Request, Data, [to(string)]),
    reset_factos,
    processar_corpo_numbers(Data, Resultado),
    adicionar_factos(Resultado),
    arranca_motor1,
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-type: text/plain~n~n'),
    format('').


:- http_handler('/api/resultados', resultados, [method(get)]).
resultados(Request) :-
    calcula_valores_totais(Resultados),
    format('Content-type: text/plain~n~n', []),
    format_totals(Resultados).


%% Motor de Inferência
carrega_bc:-
	consult('C:/Users/mafs6/Documents/GitHub/Left4Health_1stProject/Prolog/quiz40/rules.txt').

arranca_motor1:-
	findall(_,arranca_motor,_).

arranca_motor:-	
	calcula_valores_totais,
	facto(N,Facto),
	facto_dispara_regras1(Facto, LRegras),
	dispara_regras(N, Facto, LRegras),
	ultimo_facto(N).

verifica_condicoes([]).
verifica_condicoes([Condicao | Resto]) :-
    Condicao,
    verifica_condicoes(Resto).

facto_dispara_regras1(Facto, LRegras):-
	facto_dispara_regras(Facto, LRegras),
	!.
facto_dispara_regras1(_, []).
% Caso em que o facto n�o origina o disparo de qualquer regra.

dispara_regras(N, Facto, [ID|LRegras]):-
	regra ID se LHS entao RHS,
	facto_esta_numa_condicao(Facto,LHS),
	% Instancia Facto em LHS
	verifica_condicoes(LHS, LFactos),
	member(N,LFactos),
	concluir(RHS,ID,LFactos),
	!,
	dispara_regras(N, Facto, LRegras).

dispara_regras(N, Facto, [_|LRegras]):-
	dispara_regras(N, Facto, LRegras).

dispara_regras(_, _, []).


facto_esta_numa_condicao(F,[F  e _]).

facto_esta_numa_condicao(F,[avalia(F1)  e _]):- F=..[H,H1|_],F1=..[H,H1|_].

facto_esta_numa_condicao(F,[_ e Fs]):- facto_esta_numa_condicao(F,[Fs]).

facto_esta_numa_condicao(F,[F]).

facto_esta_numa_condicao(F,[avalia(F1)]):-F=..[H,H1|_],F1=..[H,H1|_].


verifica_condicoes([nao avalia(X) e Y],[nao X|LF]):- !,
	\+ avalia(_,X),
	verifica_condicoes([Y],LF).
verifica_condicoes([avalia(X) e Y],[N|LF]):- !,
	avalia(N,X),
	verifica_condicoes([Y],LF).

verifica_condicoes([nao avalia(X)],[nao X]):- !, \+ avalia(_,X).
verifica_condicoes([avalia(X)],[N]):- !, avalia(N,X).

verifica_condicoes([nao X e Y],[nao X|LF]):- !,
	\+ facto(_,X),
	verifica_condicoes([Y],LF).
verifica_condicoes([X e Y],[N|LF]):- !,
	facto(N,X),
	verifica_condicoes([Y],LF).

verifica_condicoes([nao X],[nao X]):- !, \+ facto(_,X).
verifica_condicoes([X],[N]):- facto(N,X).



concluir([cria_facto(F)|Y],ID,LFactos):-
	!,
	cria_facto(F,ID,LFactos),
	concluir(Y,ID,LFactos).

concluir([],_,_):-!.



cria_facto(F,_,_):-
	facto(_,F),!.

cria_facto(F,ID,LFactos):-

	ultimo_facto(LastFact),
	retract(ultimo_facto(N1)),
	N is LastFact+1,
	asserta(ultimo_facto(N)),
	assertz(justifica(N,ID,LFactos)),
	assertz(facto(N,F)).
	%write(facto(N,F)).
	%write('Foi concluído o facto nº '),write(N),write(' -> '),write(F),get0(_),!.



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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualiza��o da base de factos

mostra_factos:-
	findall(N, facto(N, _), LFactos),
	escreve_factos(LFactos).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geraçao de explicações do tipo "Como"

como(N) :-
    (facto(N, conclusao(Transtorno, Total, _)) ->
        write(Transtorno), write(' = '), write(Total), 
        (Total >= 15 ->
            write(' foi obtida com estas perguntas e é provável porque o resultado foi maior ou igual a 15:'), nl,
            get_ids_by_transtorno(Transtorno, QuestionIds),
            explain_questions(QuestionIds)
        ; write(' foi obtida com estas perguntas e não é provável porque o resultado foi menor que 15:'), nl,
            get_ids_by_transtorno(Transtorno, QuestionIds),
            explain_questions(QuestionIds)
        )
    ; write('Conclusão não encontrada para o número: '), write(N), nl
    ).

escreve_factos([I|R]):-facto(I,F), !,
	write('O facto nº '),write(I),write(' -> '),write(F),write(' � verdadeiro'),nl,
	escreve_factos(R).
escreve_factos([I|R]):-
	write('A condição '),write(I),write(' � verdadeira'),nl,
	escreve_factos(R).
escreve_factos([]).

explain_questions(QuestionIds) :-
    member(ID, QuestionIds),
    facto(ID, pergunta(_, Value)),
    pergunta(Transtorno, ID, Question),
    format('[~w] = ~w~n', [Value, Question]),
    fail.
explain_questions(_, _).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gera��o de explica��es do tipo "Porque nao"
% Exemplo: ?- whynot(classe(meu_ve�culo,ligeiro)).

whynot(Facto):-
	whynot(Facto,1).

whynot(Facto,_):-
	facto(_, Facto),
	!,
	write('O facto '),write(Facto),write(' n�o � falso!'),nl.
whynot(Facto,Nivel):-
	encontra_regras_whynot(Facto,LLPF),
	whynot1(LLPF,Nivel).
whynot(nao Facto,Nivel):-
	formata(Nivel),write('Porque:'),write(' O facto '),write(Facto),
	write(' � verdadeiro'),nl.
whynot(Facto,Nivel):-
	formata(Nivel),write('Porque:'),write(' O facto '),write(Facto),
	write(' n�o est� definido na base de conhecimento'),nl.

%  As explica��es do whynot(Facto) devem considerar todas as regras que poderiam dar origem a conclus�o relativa ao facto Facto

encontra_regras_whynot(Facto,LLPF):-
	findall((ID,LPF),
		(
		regra ID se LHS entao RHS,
		member(cria_facto(Facto),RHS),
		encontra_premissas_falsas(LHS,LPF),
		LPF \== []
		),
		LLPF).

whynot1([],_).
whynot1([(ID,LPF)|LLPF],Nivel):-
	formata(Nivel),write('Porque pela regra '),write(ID),write(':'),nl,
	Nivel1 is Nivel+1,
	explica_porque_nao(LPF,Nivel1),
	whynot1(LLPF,Nivel).

encontra_premissas_falsas([nao X e Y], LPF):-
	verifica_condicoes([nao X], _),
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([X e Y], LPF):-
	verifica_condicoes([X], _),
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([nao X], []):-
	verifica_condicoes([nao X], _),
	!.
encontra_premissas_falsas([X], []):-
	verifica_condicoes([X], _),
	!.
encontra_premissas_falsas([nao X e Y], [nao X|LPF]):-
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([X e Y], [X|LPF]):-
	!,
	encontra_premissas_falsas([Y], LPF).
encontra_premissas_falsas([nao X], [nao X]):-!.
encontra_premissas_falsas([X], [X]).
encontra_premissas_falsas([]).

explica_porque_nao([],_).
explica_porque_nao([nao avalia(X)|LPF],Nivel):-
	!,
	formata(Nivel),write('A condi��o nao '),write(X),write(' � falsa'),nl,
	explica_porque_nao(LPF,Nivel).
explica_porque_nao([avalia(X)|LPF],Nivel):-
	!,
	formata(Nivel),write('A condi��o '),write(X),write(' � falsa'),nl,
	explica_porque_nao(LPF,Nivel).
explica_porque_nao([P|LPF],Nivel):-
	formata(Nivel),write('A premissa '),write(P),write(' � falsa'),nl,
	Nivel1 is Nivel+1,
	whynot(P,Nivel1),
	explica_porque_nao(LPF,Nivel).

formata(Nivel):-
	Esp is (Nivel-1)*5, tab(Esp).

% Novos predicados

calcula_valores_totais :-
    calcular_valor_total_sindrome(ansiedade_Generalizada,[1,2,3,4,5], Total1),
    calcular_valor_total_sindrome(transtorno_de_Panico,[6,7,8,9,10], Total2),
    calcular_valor_total_sindrome(transtorno_de_Panico_com_Agorafobia,[11,12,13,14,15], Total3),
    calcular_valor_total_sindrome(agorafobia,[16,17,18,19,20], Total4),
    calcular_valor_total_sindrome(ansiedade_Social,[21,22,23,24,25], Total5),
    calcular_valor_total_sindrome(fobia_especifica,[26,27,28,29,30], Total6),
    calcular_valor_total_sindrome(mutismo_Seletivo,[31,32,33,34,35], Total7),
    calcular_valor_total_sindrome(ansiedade_de_separacao,[36,37,38,39,40], Total8).
	%write('Total para ansiedade_Generalizada: '), write(Total1), nl,
    %write('Total para transtorno_de_Panico: '), write(Total2), nl,
    %write('Total para transtorno_de_Panico_com_Agorafobia: '), write(Total3), nl,
    %write('Total para agorafobia: '), write(Total4), nl,
    %write('Total para ansiedade_Social: '), write(Total5), nl,
    %write('Total para fobia_especifica: '), write(Total6), nl,
    %write('Total para mutismo_Seletivo: '), write(Total7), nl,
    %write('Total para ansiedade_de_separacao: '), write(Total8), nl.

calcular_valor_total_sindrome(Transtorno, QuestionIds, Total) :-
    findall(Valor, (
        member(QuestionId, QuestionIds),
        facto(QuestionId, pergunta(QuestionId, Valor))
    ), Valores),
    sum_list(Valores, Total),
	%write(transtorno(Transtorno, Total)),
	cria_facto(transtorno(Transtorno, Total), _, _).
    %assertz(transtorno(Transtorno, Total)).

conclusao_provavel(Lista) :-
    findall(X, facto(_, conclusao(X, _, provavel)), Lista).

conclusao_nao_provavel(Lista) :-
    findall(X, facto(_, conclusao(X, _, nao_provavel)), Lista).

fatos_provaveis(FatosProvaveis) :-
    conclusao_provavel(ListaProvavel),
    findall(Facto, (
        member(conclusao(N, _, provavel), ListaProvavel),
        facto(_, Facto)
    ), ListaFatosProvaveis),
	write(FatosProvaveis),
    list_to_set(ListaFatosProvaveis, FatosProvaveis).

fatos_nao_provaveis(FatosNaoProvaveis) :-
    conclusao_nao_provavel(ListaNaoProvavel),
    findall(Facto, (
        member(conclusao(N, _, provavel), ListaNaoProvavel),
        facto(_, Facto)
    ), ListaFatosNaoProvaveis),
	write(FatosNaoProvaveis),
    list_to_set(ListaFatosNaoProvaveis, FatosNaoProvaveis).

% Sample rules associating Transtorno with IDs
transtorno_ids(ansiedade_Generalizada, [1, 2, 3, 4, 5]).
transtorno_ids(transtorno_de_Panico, [6, 7, 8, 9, 10]).
transtorno_ids(transtorno_de_Panico_com_Agorafobia, [11, 12, 13, 14, 15]).
transtorno_ids(agorafobia, [16, 17, 18, 19, 20]).
transtorno_ids(ansiedade_Social, [21, 22, 23, 24, 25]).
transtorno_ids(fobia_especifica, [26, 27, 28, 29, 30]).
transtorno_ids(mutismo_Seletivo, [31, 32, 33, 34, 35]).
transtorno_ids(ansiedade_de_separacao, [36, 37, 38, 39, 40]).

get_ids_by_transtorno(Transtorno, IDs) :-
    transtorno_ids(Transtorno, IDs).