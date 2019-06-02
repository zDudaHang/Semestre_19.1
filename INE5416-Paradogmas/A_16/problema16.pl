membro(X,[X|_]) :- !.
membro(X,[_|T]) :- membro(X,T), !.

interseccao([],_,[]) :- !.
interseccao([H1|T1],S2,[H1|S3]) :- membro(H1,S2), interseccao(T1,S2,S3).
interseccao([H1|T1],S2,S3) :- not(membro(H1,S2)), interseccao(T1,S2,S3).

uniao([],[],[]) :- !.
uniao([],S2,S2) :- !.
uniao([H1|T1],S2,[H1|S3]) :- not(membro(H1,S2)), uniao(T1,S2,S3).
uniao([H1|T1],S2,S3) :- membro(H1,S2), uniao(T1,S2,S3).

diferenca([],_,[]) :- !.
diferenca([H1|T1],S2,[H1|S3]) :- not(membro(H1,S2)), diferenca(T1,S2,S3).
diferenca([H1|T1],S2,S3) :- membro(H1,S2), diferenca(T1,S2,S3).

interseccao(S1,S2,S3,S4) :- interseccao(S1,S2,In), interseccao(In,S3,S4).

uniao(S1,S2,S3,S4) :- uniao(S1,S2,U), uniao(U,S3,S4).

diferenca(S1,S2,S3,S4) :- diferenca(S1,S2,D), diferenca(D,S3,S4).

/* Consultas
?- interseccao([1,2,3,4,5],[2,3,4],[3,4],X).
X = [3,4];
false.

?- uniao([1,2,3,4,5],[2,3,4],[3,4],X).
X = [1,5,2,3,4];
false.

?- diferenca([1,2,3,4,5],[2,3,4],[3,4],X).
X = [1,5];
false.
*/
