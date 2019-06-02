maior(A,B,C,X) :- X is max(max(A,B),C).

/* Consultas
?- maior(100,0,10,X).
X = 100.

?- maior(100,0,200,X).
X = 200.
*/
