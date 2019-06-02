divisivel(N,K) :- 0 is mod(N,K).

/* Consultas:
?- divisivel(4,2).
true.

?- divisivel(5,2).
false.

?- divisivel(10,2).
true.

?- divisivel(11,2).
false.

*/
