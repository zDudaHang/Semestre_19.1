comprimento([],0).
comprimento([H|T],C) :- comprimento(T,C1), C is C1+1.

dividir([],[],[]) :- !.
dividir(L1,L2,L3) :- comprimento(L1,Comprimento),
                     Mtd is Comprimento/2,
                     primeiros(Mtd,L1,L2),
                     apagar(Mtd,L1,L3).

dividir(L1,L2,L3) :- comprimento(L1,Comprimento),
                     mod(Comprimento,2) \== 0,
                     Mtd1 is (Comprimento+1)/2,
                     primeiros(Mtd1,L1,L2),
                     apagar(Mtd1,L1,L3).

apagar(0,[H|T],[H|T]) :- !.
apagar(N,[_|T1],T2) :- N1 is N-1, apagar(N1,T1,T2).

primeiros(N,_,T2) :- N =< 0, !, N =:= 0, T2 = [].
primeiros(_,[],[]).
primeiros(N,[H1|T],[H1|T2]) :- N1 is N-1, primeiros(N1,T,T2).

/* Consultas
?- dividir([1,2,3,4],L2,L3).
L2 = [1,2],
L3 = [3,4];
false.

?- dividir([1,2,3],L2,L3).
L2 = [1,2],
L3 = [3].

?- dividir([],L2,L3).
L2 = L3, L3 = [].
*/
