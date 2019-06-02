triangulo(A,B,C) :- abs(B - C) < A, A < B + C.

/* Consultas:
?- triangulo(10,5,4).
false.

?- triangulo(4,8,9).
true.
*/
