% Importar os módulos necessários
:- consult('engine.pl').
:- consult('server.pl').
:-consult('aux_methods.pl').


main_initial(NBC) :-   
    carrega_bc(NBC),
    servidor(7070).
