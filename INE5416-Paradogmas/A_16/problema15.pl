membro(X,[X|_]) :- !.
membro(X,[_|T]) :- membro(X,T), !.

diferenca([],_,[]) :- !.
diferenca([H1|T1],S2,[H1|S3]) :- not(membro(H1,S2)), diferenca(T1,S2,S3).
diferenca([H1|T1],S2,S3) :- membro(H1,S2), diferenca(T1,S2,S3).

/* Consultas
?- diferenca([1,2,3,4],[1,2],X).
X = [3,4];
false.

?- diferenca([1,2],[1,2,3,4],X).
X = [].

?- diferenca([],[1,2,3,4],X).
X = [].
*/
