% Importar os módulos necessários
:- consult('engine.pl').
:- consult('server.pl').
%:-consult('aux_methods.pl').


main_quiz40 :-   
    carrega_bc,
    servidor(7071).
