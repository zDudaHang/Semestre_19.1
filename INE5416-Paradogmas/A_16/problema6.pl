menor([H1], H1).
menor([H1,H2|T], X) :- H1 =< H2, menor([H1|T],X).
menor([H1,H2|T], X) :- H1 > H2, menor([H2|T],X).

/* Consultas
?- menor([6,10,5,4],X).
X = 4;
false.

?- menor([6,-10,5,4],X).
X = -10;
false.

*/
