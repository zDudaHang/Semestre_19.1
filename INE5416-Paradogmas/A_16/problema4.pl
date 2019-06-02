soma([],0).
soma([H|T], X) :- soma(T,X1),
                  X is X1+H.


/* Consultas
  -? soma([1,2,3,4],X).
  X = 10.

  -? soma([1,2,3,4,5],X).
  X = 15.
*/
