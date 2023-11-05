% Importar os módulos necessários
:- consult('engine.pl').
:- consult('server.pl').
:-consult('aux_methods.pl').

:- dynamic(ultimo_facto/1).

main :-   
    Initial_facts=0, 
    assert(ultimo_facto(Initial_facts)),
     % Carrega as regras para o motor de inferência
    carrega_bc(Initial_facts,'C:/Users/mariana/Documents/GitHub/Left4Health_1stProject/Prolog/test/rules.txt'),
    % Chame a função para iniciar o servidor
    servidor(Initial_facts,7070).
