operacao(Op, X, Y, Resultado) :-
  Op == '+' -> Resultado is X + Y;
  Op == '-' -> Resultado is X - Y;
  Op == '/' -> Resultado is X / Y;
  Op == '*' -> Resultado is X * Y;
  Resultado is X.

/* Consultas
?- operacao(@,2,2,Resultado).
Resultado = 2.

?- operacao(+,2,2,Resultado).
Resultado = 4.

?- operacao(-,2,2,Resultado).
Resultado = 0.

?- operacao(/,2,2,Resultado).
Resultado = 1.

?- operacao(*,2,2,Resultado).
Resultado = 4.
*/
