diferencaMaiorMenor([], 0) :- !.
diferencaMaiorMenor(L,X) :- maior(L,Maior), menor(L,Menor),
                            X is Maior-Menor.

menor([H1], H1).
menor([H1,H2|T], X) :- H1 =< H2, menor([H1|T],X).
menor([H1,H2|T], X) :- H1 > H2, menor([H2|T],X).

maior([H1], H1).
maior([H1,H2|T], X) :- H1 >= H2, maior([H1|T], X).
maior([H1,H2|T], X) :- H1 < H2, maior([H2|T], X).

/* Consultas
?- diferencaMaiorMenor([1,2,3,4,5],X).
X = 4;
false.

?- diferencaMaiorMenor([1,2,3,4,100],X).
X = 99;
false.

?- diferencaMaiorMenor([-50,2,3,4,100],X).
X = 150;
false.

*/
