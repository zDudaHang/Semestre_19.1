xor(X,Y) :- (not(X),Y) ; (not(Y),X).

/* Consultas:
?- xor(true, true).
false.

?- xor(true, false).
true.

?- xor(false, true).
true.

?- xor(false, false).
false.
*/
