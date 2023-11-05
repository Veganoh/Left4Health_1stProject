% Importar os módulos necessários
:- consult('engine.pl').
:- consult('server.pl').
%:-consult('aux_methods.pl').


main_quiz40(NBC) :-   
    carrega_bc(NBC),
    servidor(7071).