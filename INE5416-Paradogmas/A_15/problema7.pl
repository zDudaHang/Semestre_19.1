absoluto(N,X) :- N >= 0 -> X is N; X is (-N).

/* Consultas:
?- absoluto(4,X).
X = 4.

?- absoluto(-4,X).
X = 4.
*/
