% Importar os módulos necessários
:- consult('engine.pl').
:- consult('server.pl').

% Inicializa a variável global factoInitial com 0
%initial_facto(0).
%conclusion_facto(0).

main :-   
    % Carrega as regras para o motor de inferência
    carrega_bc('C:/Users/mariana/Documents/GitHub/Left4Health_1stProject/Prolog/test/rules.txt'),
    % Chame a função para iniciar o servidor
    servidor(7070).

