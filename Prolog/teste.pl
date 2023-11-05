:- set_prolog_flag(encoding, utf8).

% :-dynamic (facto/2, ultimo_facto/1).

ultimo_facto(2).
ultima_regra(2).

regra1
    se [pergunta(1, sim)]
    então [cria_facto(conclusao(Ansiedade como fator secundário))].

regra2
    se [pergunta(2, não)]
    então [cria_facto(conclusao(Ansiedade normal))].

facto(1,resposta(1, sim)).
facto(2,resposta(2, sim )).