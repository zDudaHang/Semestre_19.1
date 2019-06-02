mdc(X,X,X) :- !.
mdc(X,0,X) :- !.
mdc(X,Y,Resultado) :- R is mod(X,Y),
                      mdc(Y,R,Resultado).

/* Consultas:
?- mdc(3,9,Resultado).
Resultado = 3.

?- mdc(0,9,Resultado).
Resultado = 9.

?- mdc(9,0,Resultado).
Resultado = 9.

?- mdc(28,9,Resultado).
Resultado = 1.

?- mdc(27,9,Resultado).
Resultado = 9.

*/
