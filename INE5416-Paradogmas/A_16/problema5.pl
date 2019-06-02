soma([],0).
soma([H|T], X) :- soma(T,X1),
                  X is X1+H.

comprimento([],0).
comprimento([H|T],C) :- comprimento(T,C1), C is C1+1.

media([], 0).
media(L,X) :- soma(L,Soma),
              comprimento(L,C),
              X is Soma/C.

/* Consultas
?- media([6,6,6],M).
M = 6.

?- media([1,2,3],M).
M = 2.

?- media([1,2], M).
M = 1.5.
*/
