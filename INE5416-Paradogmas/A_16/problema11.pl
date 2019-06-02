primeiros(N,_,T2) :- N =< 0, !, N =:= 0, T2 = [].
primeiros(_,[],[]).
primeiros(N,[H1|T],[H1|T2]) :- N1 is N-1, primeiros(N1,T,T2).

/* Consultas
?- primeiros(2,[1,2,3,4],X).
X = [1,2].

?- primeiros(0,[1,2,3,4],X).
X = [].

?- primeiros(3,[1,2,3,4],X).
X = [1,2,3].

*/
