inverte([],[]) :- !.
inverte([H],[H]) :- !.
inverte([H|T], X) :- inverte(T,R),
                     append(R,[H],X).

/* Consultas
?- inverte([1,2,3,4],X).
X = [4,3,2,1].

?- inverte([4,3,2,1],X).
X = [1,2,3,4].
*/
