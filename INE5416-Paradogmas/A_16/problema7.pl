palin([]).
palin([H]).
palin(L) :- reverso(L,Lreversa),
          ehIgual(Lreversa,L).

reverso([],[]) :- !.
reverso([H],[H]) :- !.
reverso([H|T], X) :- reverso(T,R),
                     append(R,[H],X).

ehIgual([],[]).
ehIgual([H1|T1],[H2|T2]) :- H1 == H2, ehIgual(T1,T2).

/* Consultas
?- palin([2,1]).
false.

?- palin(['a','n','a']).
true.

?- palin([1,2,1]).
true.

?- palin([1,2,2]).
false.

*/
