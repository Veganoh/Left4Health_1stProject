% Base de Conhecimento em Prolog sobre transtornos de ansiedade e fobias

transtorno("sindrome_de_panico").
transtorno("ansiedade_generalizada").
transtorno("sindrome_de_pânico_com_agorafobia").
transtorno("agorafobia").
transtorno("fobia_social").
transtorno("fobia_especifica").
transtorno("mutismo_seletivo").
transtorno("ansiedade_de_separacao").

% Perguntas sobre Síndrome de Pânicos
pergunta("sindrome_de_panico", "P1").
pergunta("sindrome_de_panico", "P2").
pergunta("sindrome_de_panico", "P3").
pergunta("sindrome_de_panico", "P4").
pergunta("sindrome_de_panico", "P5").

% Perguntas sobre Ansiedade Generalizada
pergunta("ansiedade_generalizada", "P1").
pergunta("ansiedade_generalizada", "P2").
pergunta("ansiedade_generalizada", "P3").
pergunta("ansiedade_generalizada", "P4").
pergunta("ansiedade_generalizada", "P5").

% Perguntas sobre Síndrome de Pânico com Agorafobia
pergunta("sindrome_de_pânico_com_agorafobia", "P1").
pergunta("sindrome_de_pânico_com_agorafobia", "P2").
pergunta("sindrome_de_pânico_com_agorafobia", "P3").
pergunta("sindrome_de_pânico_com_agorafobia", "P4").
pergunta("sindrome_de_pânico_com_agorafobia", "P5").

% Perguntas sobre Agorafobia
pergunta("agorafobia", "P1").
pergunta("agorafobia", "P2").
pergunta("agorafobia", "P3").
pergunta("agorafobia", "P4").
pergunta("agorafobia", "P5").

% Perguntas sobre Fobia Social
pergunta("fobia_social", "P1").
pergunta("fobia_social", "P2").
pergunta("fobia_social", "P3").
pergunta("fobia_social", "P4").
pergunta("fobia_social", "P5").

% Perguntas sobre Fobia Específica
pergunta("fobia_especifica", "P1").
pergunta("fobia_especifica", "P2").
pergunta("fobia_especifica", "P3").
pergunta("fobia_especifica", "P4").
pergunta("fobia_especifica", "P5").

% Perguntas sobre Mutismo Seletivo
pergunta("mutismo_seletivo", "P1").
pergunta("mutismo_seletivo", "P2").
pergunta("mutismo_seletivo", "P3").
pergunta("mutismo_seletivo", "P4").
pergunta("mutismo_seletivo", "P5").

% Perguntas sobre Ansiedade de Separação
pergunta("ansiedade_de_separacao", "P1").
pergunta("ansiedade_de_separacao", "P2").
pergunta("ansiedade_de_separacao", "P3").
pergunta("ansiedade_de_separacao", "P4").
pergunta("ansiedade_de_separacao", "P5").

% Predicado para gerar um questionário com todas as perguntas e suas ansiedades associadas
gerar_questionario(Questionario) :-
    findall([Ansiedade, Perguntas], obter_perguntas(Ansiedade,Perguntas), Questionario).


% Predicado para gerar um questionário com ansiedade associada a todas as perguntas
obter_perguntas(Ansiedade,Lista):-
    transtorno(Ansiedade),  
    findall(Pergunta,pergunta(Ansiedade,Pergunta),Lista).
