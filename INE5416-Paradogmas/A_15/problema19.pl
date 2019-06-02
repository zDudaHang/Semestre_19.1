mdc(X,X,X) :- !.
mdc(X,0,X) :- !.
mdc(X,Y,Resultado) :- R is mod(X,Y),
                      mdc(Y,R,Resultado).

coprimos(X,Y) :- mdc(X,Y,R), R == 1.

totienteEuler(N,K) :- totAux(N,K).
