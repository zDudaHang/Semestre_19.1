eqSegundoGrau(A,B,C,X1,X2) :- D is ( ( (B)*(B) ) -(4*(A)*(C))),
                              D >= 0,
                              Atemp is 2*(A),
                              X1 is ((-(B) + sqrt(D))/Atemp),
                              X2 is ((-(B) - sqrt(D))/Atemp).

/* Consultas:
?- eqSegundoGrau(1,12,-13,X1,X2).
X1 = 1.0, X2 = -13.0.

?- triangulo(2,-16,-18,X1,X2).
X1 = 9.0, X2 = -1.0.
*/
