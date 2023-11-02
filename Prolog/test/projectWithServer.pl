% Importar os módulos necessários
:- consult(server).
:- consult(motorInferencia).

% Defina sua main aqui
main :-
    iniciar_servidor, % Chame a função para iniciar o servidor
    realizar_inferencia. % Chame a função para o motor de inferência

% Inicie a main
main.