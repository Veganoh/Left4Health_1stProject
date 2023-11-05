% Importar os módulos necessários
:- consult('Initial/project.pl').
:- consult('Quiz40/project.pl').


main :-   
    main_initial,
    main_quiz40.

:-main.