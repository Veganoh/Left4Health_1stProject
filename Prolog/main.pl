% Importar os módulos necessários
:- consult('initial/project.pl').
:- consult('quiz40/project.pl').


main :-   
    Path='C:/Users/mariana/Documents/GitHub/Left4Health_1stProject/Prolog/',
    main_initial(Path),
    main_quiz40(Path).

:-main.