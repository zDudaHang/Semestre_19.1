aprovado(A,B,C) :- Media is ((A+B+C)/3), Media >= 6.0.

/* Consultas:
?- aprovado(6,6,6).
true.

?- aprovado(6,6,5).
false.

?- aprovado(6,6,10).
true.

?- aprovado(0,0,10).
false.
*/
