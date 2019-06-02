mdc(X,X,X) :- !.
mdc(X,0,X) :- !.
mdc(X,Y,Resultado) :- R is mod(X,Y),
                      mdc(Y,R,Resultado).

mmc(X,Y,Resultado) :- mdc(X,Y,R),
                      Resultado is ((X*Y)/R).


/* Consultas:
?- mmc(16,36,R).
R = 144.

?- mmc(28,8,R).
R = 56.

?- mmc(12,2,R).
R = 12.
*/
