primo(0) :- !.
primo(1) :- !.
primo(2) :- !.
primo(N) :- not(divisivel(N,2)).

divisivel(X,Y) :- 0 is X mod Y, !.
divisivel(X,Y) :- X > Y+1, divisivel(X, Y+1).
