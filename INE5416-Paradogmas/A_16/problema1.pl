/*
Crie uma regra posicao(X,L,P) que receba um elemento X, uma lista L
e retorne a posição P do elemento
X na lista L. Não utilize nenhuma função pronta to Prolog para esta tarefa.
*/
posicao(X,[X|_],0) :- !.
posicao(X,[_|T],P) :- posicao(X,T,P1),
                      P is P1+1.

/* Consultas
-? posicao(1,[1,2,3,4], X).
X = 0.

-? posicao(1,[4,3,2,1],X).
X = 3.

-? posicao(1,[],X).
false.

-? posicao(1,[1,1,1,1],X).
X = 0.
*/
