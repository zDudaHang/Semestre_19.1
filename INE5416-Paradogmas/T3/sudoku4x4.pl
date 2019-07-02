tabuleiro([
[_,_,_,_],
[_,_,_,_],
[_,_,_,_],
[_,_,_,_]
]).

numero(1).
numero(2).
numero(3).
numero(4).

% ---------------------------------------------- NUMEROS

completa([X1,X2,X3,X4]) :- numero(X1), numero(X2), numero(X3), numero(X4),
			   todosDiferentes([X1,X2,X3,X4]).

% ---------------------------------------------- VERIFICAR SIMBOLOS

% ---------------------------------------------- RIGHT

verificar_simbolos_dir(Quadrado, Simbolos, Tamanho, Tamanho).

verificar_simbolos_dir(Quadrado, [2|T], Index, Tamanho) :-
	NextIndex is Index+1,
	verificar_simbolos_esq(Quadrado, T, NextIndex, Tamanho).

verificar_simbolos_dir(Quadrado, [0|T], Index, Tamanho) :-
	nth0(Index,Quadrado,E1),
	SearchIndex is Index+1,
	nth0(SearchIndex,Quadrado, E2),
	E1 > E2,
	NextIndex is Index+1,
	verificar_simbolos_dir(Quadrado,T,NextIndex,Tamanho).

verificar_simbolos_dir(Quadrado, [1|T], Index, Tamanho) :-
	nth0(Index,Quadrado,E1),
	SearchIndex is Index+1,
	nth0(SearchIndex,Quadrado, E2),
	E1 < E2,
	NextIndex is Index+1,
verificar_simbolos_dir(Quadrado,T,NextIndex,Tamanho).

% ---------------------------------------------- LEFT

verificar_simbolos_esq(Quadrado,Simbolos,Tamanho, Tamanho).
verificar_simbolos_esq(Quadrado, [2|T], Index, Tamanho) :-
	NextIndex is Index+1,
	verificar_simbolos_esq(Quadrado,T,NextIndex,Tamanho).

verificar_simbolos_esq(Quadrado, [0|T], Index, Tamanho) :-
	nth0(Index,Quadrado,E1),
	SearchIndex is Index-1,
	nth0(SearchIndex, Quadrado, E2),
	E1 > E2,
	NextIndex is Index+1,
	verificar_simbolos_esq(Quadrado,T,NextIndex,Tamanho).

verificar_simbolos_esq(Quadrado, [1|T], Index, Tamanho) :-
	nth0(Index,Quadrado,E1),
	SearchIndex is Index-1,
	nth0(SearchIndex, Quadrado, E2),
	E1 < E2,
	NextIndex is Index+1,
	verificar_simbolos_esq(Quadrado,T,NextIndex,Tamanho).

% ---------------------------------------------- BOTTOM

verificar_simbolos_baixo(Quadrado,Simbolos,Tamanho, Tamanho).
verificar_simbolos_baixo(Quadrado, [2|T], Index, Tamanho) :-
	NextIndex is Index+1,
	verificar_simbolos_baixo(Quadrado,T,NextIndex,Tamanho).

verificar_simbolos_baixo(Quadrado, [0|T], Index, Tamanho) :-
	nth0(Index,Quadrado,E1),
	SearchIndex is Index+2,
	nth0(SearchIndex, Quadrado, E2),
	E1 > E2,
	NextIndex is Index+1,
	verificar_simbolos_baixo(Quadrado,T,NextIndex,Tamanho).

verificar_simbolos_baixo(Quadrado, [1|T], Index, Tamanho) :-
	nth0(Index,Quadrado,E1),
	SearchIndex is Index+2,
	nth0(SearchIndex, Quadrado, E2),
	E1 < E2,
	NextIndex is Index+1,
	verificar_simbolos_baixo(Quadrado,T,NextIndex,Tamanho).

% ---------------------------------------------- TOP

verificar_simbolos_cima(Quadrado,Simbolos,Tamanho, Tamanho).
verificar_simbolos_cima(Quadrado, [2|T], Index, Tamanho) :-
	NextIndex is Index+1,
	verificar_simbolos_cima(Quadrado,T,NextIndex,Tamanho).

verificar_simbolos_cima(Quadrado, [0|T], Index, Tamanho) :-
	nth0(Index,Quadrado,E1),
	SearchIndex is Index-2,
	nth0(SearchIndex, Quadrado, E2),
	E1 > E2,
	NextIndex is Index+1,
	verificar_simbolos_cima(Quadrado,T,NextIndex,Tamanho).

verificar_simbolos_cima(Quadrado, [1|T], Index, Tamanho) :-
	nth0(Index,Quadrado,E1),
	SearchIndex is Index-2,
	nth0(SearchIndex, Quadrado, E2),
	E1 < E2,
	NextIndex is Index+1,
	verificar_simbolos_cima(Quadrado,T,NextIndex,Tamanho).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)),
			  todosDiferentes(T).

% ---------------------------------------------- SOLVING

solucao4x4(TabuleiroSolucao) :-
	TabuleiroSolucao = tabuleiro([
		  [X11, X12, X13, X14],
		  [X21, X22, X23, X24],
		  [X31, X32, X33, X34],
	 	  [X41, X42, X43, X44]
			]),

	%Linhas
	completa([X11,X12,X13,X14]),
	completa([X21,X22,X23,X24]),
	completa([X31,X32,X33,X34]),
	completa([X41,X42,X43,X44]),

	%Colunas
	completa([X11, X21, X31, X41]),
	completa([X12, X22, X32, X42]),
	completa([X13, X23, X33, X43]),
	completa([X14, X24, X34, X44]),

	%quadrados menores
	completa([X11, X12, X21, X22]),
	completa([X31, X32, X41, X42]),
	completa([X13, X14, X23, X24]),
	completa([X33, X34, X43, X44]),

	verificar_simbolos_esq([X11, X12, X21, X22], [2,1,2,1],0,4),
	verificar_simbolos_esq([X13, X14, X23, X24], [2,1,2,0],0,4),
	verificar_simbolos_esq([X31, X32, X33, X34], [2,0,2,0],0,4),
	verificar_simbolos_esq([X33, X34, X43, X44], [2,0,2,1],0,4),

	verificar_simbolos_dir([X11, X12, X21, X22], [0,2,0,2],0,4),
	verificar_simbolos_dir([X13, X14, X23, X24], [0,2,1,2],0,4),
	verificar_simbolos_dir([X31, X32, X33, X34], [1,2,1,2],0,4),
	verificar_simbolos_dir([X33, X34, X43, X44], [1,2,0,2],0,4),

	verificar_simbolos_baixo([X11, X12, X21, X22], [0,1,2,2],0,4),
	verificar_simbolos_baixo([X13, X14, X23, X24], [0,1,2,2],0,4),
	verificar_simbolos_baixo([X31, X32, X33, X34], [1,0,2,2],0,4),
	verificar_simbolos_baixo([X33, X34, X43, X44], [1,0,2,2],0,4),

	verificar_simbolos_cima([X11, X12, X21, X22], [2,2,1,0],0,4),
	verificar_simbolos_cima([X13, X14, X23, X24], [2,2,1,0],0,4),
	verificar_simbolos_cima([X31, X32, X33, X34], [2,2,0,1],0,4),
	verificar_simbolos_cima([X33, X34, X43, X44], [2,2,0,1],0,4).
