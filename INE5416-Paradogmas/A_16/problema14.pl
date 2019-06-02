membro(X,[X|_]) :- !.
membro(X,[_|T]) :- membro(X,T), !.

uniao([],[],[]) :- !.
uniao([],S2,S2) :- !.
uniao([H1|T1],S2,[H1|S3]) :- not(membro(H1,S2)), uniao(T1,S2,S3).
uniao([H1|T1],S2,S3) :- membro(H1,S2), uniao(T1,S2,S3).

/* Consultas
?- uniao([1,2,3,4],[1,2,6],X).
X = [3,4,1,2,6];
false.

?- uniao([a,d,e,f,g],[a,b,c,],X).
X = [d,e,f,g,a,b,c];
false.
*/
