ocorrencias([],X,0) :- !.
ocorrencias([X|T], X, N) :- ocorrencias(T,X,N1), N is N1+1.
ocorrencias([X1|T], X, N1) :- X1 \== X, ocorrencias(T,X,N1).

/* Consultas
?- ocorrencias([2,2,2,2,3],2,Cont).
Cont = 4;
false.

?- ocorrencias([2,2,2,2,3],3,Cont).
Cont = 1;
false.

?- ocorrencias([2,2,2,2,3],1,Cont).
Cont = 0.
*/
