tabuleiro([
[1,_,_,_,_,_],
[_,2,_,_,_,_],
[_,_,3,_,_,_],
[_,_,_,4,_,_],
[_,_,_,_,5,_],
[_,_,_,_,_,6],
]).

numero(1).
numero(2).
numero(3).
numero(4).
numero(5).
numero(6).

completa([X1,X2,X3,X4,X5, X6]) :- numero(X1), numero(X2), numero(X3), numero(X4), numero(X5), numero(X6)
			   todosDiferentes([X1,X2,X3,X4,X5,X6]).

% ---------------------------------------------- VERIFICAR SIMBOLOS

% Entre linhas e quadrados
% (i,j) < (i+1,j) => 0
verificarSimbolo(_,_,Tamanho,Tamanho).
verificarSimbolo(L, [0|T] , Index, Tamanho) :- nth0(Index,L,Elem1),
					  Index2 is Index+1,
					  nth0(Index2,L,Elem2),
					  Elem1 < Elem2,
					  NextIndex is Index+1,
					  verificarSimbolo(L,T,NextIndex,Tamanho).

% Entre linhas e quadrados
% (i,j) > (i+1,j) => 1
verificarSimbolo(_,_,Tamanho,Tamanho).
verificarSimbolo(L, [1|T] , Index, Tamanho) :- nth0(Index,L,Elem1),
					  Index2 is Index+1,
					  nth0(Index2,L,Elem2),
					  Elem1 > Elem2,
					  NextIndex is Index+1,
					  verificarSimbolo(L,T,NextIndex,Tamanho).
% Entre colunas
% (i,j) < (i,j+1) => 2
verificarSimbolo(_,_,Tamanho,Tamanho).
verificarSimbolo(L, [2|T] , Index, Tamanho) :- nth0(Index,L,Elem1),
					  Index2 is Index+1,
					  nth0(Index2,L,Elem2),
					  Elem1 < Elem2,
					  NextIndex is Index+1,
					  verificarSimbolo(L,T,NextIndex,Tamanho).

% Entre colunas
% (i,j) > (i,j+1) => 3
verificarSimbolo(_,_,Tamanho,Tamanho).
verificarSimbolo(L, [3|T] , Index, Tamanho) :- nth0(Index,L,Elem1),
					  Index2 is Index+1,
					  nth0(Index2,L,Elem2),
					  Elem1 > Elem2,
					  NextIndex is Index+1,
					  verificarSimbolo(L,T,NextIndex,Tamanho).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)),
			  todosDiferentes(T).

% ---------------------------------------------- SOLVING

solucao6x6(TabuleiroSolucao) :-TabuleiroSolucao =
	tabuleiro([
		  [X11, X12, X13, X14, X15, X16],
		  [X21, X22, X23, X24, X25, X26],
		  [X31, X32, X33, X34, X35, X36],
	 	  [X41, X42, X43, X44, X45, X46],
			[X51, X52, X53, X54, X55, X56],
			[X61, X62, X63, X64, X65, X66]]),

	%Linhas
	completa([X11, X12, X13, X14, X15, X16]),
	completa([X21, X22, X23, X24, X25, X26]),
	completa([X31, X32, X33, X34, X35, X36]),
	completa([X41, X42, X43, X44, X45, X46]),
	completa([X51, X52, X53, X54, X55, X56]),
	completa([X61, X62, X63, X64, X65, X66]),

	%Colunas
	completa([X11, X21, X31, X41, X51, X61]),
	completa([X12, X22, X32, X42, X52, X62]),
	completa([X13, X23, X33, X43, X53, X63]),
	completa([X14, X24, X34, X44, X54, X64]),
	completa([X15, X25, X35, X45, X55, X65]),
	completa([X16, X26, X36, X46, X56, X66]),

	%quadrados menores
	completa([X11, X12, X13, X21, X22, X23, X31, X32, X33]),
	completa([X41, X42, X43, X51, X52, X53, X61, X62, X63]),
	completa([X14, X15, X16, X24, X25, X26, X34, X35, X36]),
	completa([X44, X45, X46, X54, X55, X56, X64, X65, X66]).
