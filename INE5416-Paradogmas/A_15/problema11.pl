fib(0,0) :- !.
fib(1,1) :- !.
fib(N,K) :- N > 1,
            N1 is N-1,
            fib(N1, K1),
            N2 is N-2,
            fib(N2, K2),
            K is K1+K2.


/* Consultas:
?- fib(0,K).
K = 0;

?- fib(1,K).
K = 1;

?- fib(2,K).
K = 1;

?- fib(3,K).
K = 2;

?- fib(4,K).
K = 3;

?- fib(5,K).
K = 5;

?- fib(6,K).
K = 8;
*/
