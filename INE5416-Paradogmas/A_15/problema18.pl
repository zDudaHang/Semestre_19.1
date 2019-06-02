mdc(X,X,X) :- !.
mdc(X,0,X) :- !.
mdc(X,Y,Resultado) :- R is mod(X,Y),
                      mdc(Y,R,Resultado).

coprimos(X,Y) :- mdc(X,Y,R), R == 1.

/* Consultas
?- coprimos(3,2).
true.

?- coprimos(3,6).
false.

?- coprimos(7,3).
true.
*/
