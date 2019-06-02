mdc(X,X,X) :- !.
mdc(X,0,X) :- !.
mdc(X,Y,Resultado) :- R is mod(X,Y),
                      mdc(Y,R,Resultado).

mdc(X,Y,Z, Resultado) :- mdc(X,Y,R),
                         mdc(R, Z, Resultado).


/* Consultas:
?- mdc(9,3,3,R).
R = 3.

?- mdc(9,3,5,R).
R = 1.

?- mdc(9,3,27,R).
R = 3.

?- mdc(18,9,27,R).
R = 9.
*/
