apagar(0,[H|T],[H|T]) :- !.
apagar(N,[_|T1],T2) :- N1 is N-1, apagar(N1,T1,T2).

/*Consultas
?- apagar(2,[1,2,3,4],X).
X = [3,4].

?- apagar(0,[1,2,3,4],X).
X = [1,2,3,4].

?- apagar(1,[1,2,3,4],X).
X = [2,3,4].

?- apagar(3, [1,2,3,4],X).
X = [4].
*/
