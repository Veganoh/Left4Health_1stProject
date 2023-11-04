:- module(contador, [iniciar_contador/1, obter_contador/1, atualizar_contador/1]).

% Inicializa o contador
iniciar_contador(0).

% Obtém o valor atual do contador
obter_contador(Contador) :-
    contador(Contador).

% Atualiza o contador
atualizar_contador(NovoValor) :-
    retract(contador(_)), % Remove o valor anterior do contador
    asserta(contador(NovoValor)). % Define o novo valor do contador

% Define a variável do contador como dinâmica
:- dynamic contador/1.