% Importar os módulos necessários
:- consult('engine.pl').
:- consult('server.pl').
:-consult('aux_methods.pl').

% Inicializa a variável global factoInitial com 0
%initial_facto(0).
%conclusion_facto(0).

:- dynamic ultimo_facto/1.

main :-   
    Initial_facts=0,
     % Carrega as regras para o motor de inferência
    carrega_bc(Initial_facts,'C:/Users/mariana/Documents/GitHub/Left4Health_1stProject/Prolog/test/rules.txt'),
    % Chame a função para iniciar o servidor
    servidor(Initial_facts,7070).
