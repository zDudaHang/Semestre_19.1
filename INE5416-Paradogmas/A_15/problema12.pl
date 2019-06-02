distancia3D(ponto(X1,Y1,Z1),ponto(X2,Y2,Z2), Dist) :- DeltaX is (X1-X2)**2,
                                                      DeltaY is (Y1-Y2)**2,
                                                      DeltaZ is (Z1-Z2)**2,
                                                      Dist is sqrt(DeltaX + DeltaY + DeltaZ).
/* Consultas
?- distancia3D(ponto(0,0,0), ponto(1,0,0), Dist).
Dist = 1.0.

?- distancia3D(ponto(7,4,3), ponto(17,6,2), Dist).
Dist = 10.24695.

?- distancia3D(ponto(2,2,2), ponto(5,6,2), Dist).
Dist = 5.
*/
