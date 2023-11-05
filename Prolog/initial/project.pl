% Importar os módulos necessários
:- consult('engine.pl').
:- consult('server.pl').
:-consult('aux_methods.pl').


main :-   
    carrega_bc,
    servidor(7070).
