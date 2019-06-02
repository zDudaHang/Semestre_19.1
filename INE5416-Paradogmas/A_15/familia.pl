ehDono(duda, bebel).
ehDono(pam, mel).
ehDono(liz, tomas).
ehDono(jim, flor).

genitor(pam, bob).
genitor(tom, bob).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).

genitor(liz,bill).

genitor(bill, duda).

genitor(pat, jim).

mulher(pam).
mulher(liz).
mulher(pat).
mulher(ana).
mulher(duda).
homem(tom).
homem(bob).
homem(jim).
homem(bill).

animalDeEstimacao(bebel).
animalDeEstimacao(flor).
animalDeEstimacao(jorge).
animalDeEstimacao(mel).
animalDeEstimacao(tomas).
animalDeEstimacao(floquinho).

pai(X,Y) :- genitor(X,Y), homem(X).
mae(X,Y) :- genitor(X,Y), mulher(X).

avo(AvoX, X) :- genitor(GenitorX, X), genitor(AvoX, GenitorX), homem(AvoX).
avoh(AvohX, X) :- genitor(GenitorX, X), genitor(AvohX, GenitorX), mulher(AvohX).
irmao(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, homem(X).
irma(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, mulher(X).
irmaos(X,Y) :- (irmao(X,Y); irma(X,Y)), X \== Y.

ascendente(X,Y) :- genitor(X,Y). %recursão - caso base
ascendente(X,Y) :- genitor(X, Z), ascendente(Z, Y). %recursão - passo recursivo

tio(X,Y) :- (pai(Z,Y) ; mae(Z,Y)), irmao(X,Z). % X é tio de Y sse Z é pai/mãe de Y e X é irmão de Z
tia(X,Y) :-(pai(Z,Y) ; mae(Z,Y)), irma(X,Z). % X é tio de Y sse Z é pai/mãe de Y e X é irmã de Z

primo(X,Y) :- (tio(Z,X) ; tia(Z,X)), (pai(Z,Y) ; mae(Z,Y)), homem(X).  % X é o primo de Y -> Sse Z é tio/tia de X e Z é pai/mãe de Y, sendo que Y deve ser homem.
prima(X,Y) :-  (tio(Z,X) ; tia(Z,X)), (pai(Z,Y) ; mae(Z,Y)), mulher(X).
primos(X,Y) :- primo(X,Y) ; prima(X,Y), X \== Y.

bisavo(Bisavo, Bisneto) :- genitor(PaiOuMae, Bisneto), genitor(AvoOUAvoh, PaiOuMae), genitor(Bisavo, AvoOUAvoh), homem(Bisavo).

bisavoh(Bisavoh, Bisneto) :- genitor(PaiOuMae, Bisneto), genitor(AvoOUAvoh, PaiOuMae), genitor(Bisavoh, AvoOUAvoh), mulher(Bisavoh).

% onde X é descendente de Y.
descendente(X, Y) :- ascendente(Y,X).

% onde X é feliz se possui filhos
feliz(X) :- genitor(X, Y).

% onde X tem um dono e X é um animal de estimação.
temDono(X) :- ehDono(Y, X), animalDeEstimacao(X).

/* Consultas:
?- tio(X,Y).
X = bob, Y = bill.

?- tia(X,Y).
X = liz, Y = ana;
X = liz, Y = pat;
X = ana, Y = jim.

?- primo(X,Y).
X = bill, Y = ana;
X = bill, Y = pat.

?- prima(X,Y).
X = ana, Y = bill;
X = pat, Y = bill.

?- primos(X,Y).
X = bill, Y = ana;
X = bill, Y = pat;
X = ana, Y = bill;
X = pat, Y = bill.

?- bisavo(X,Y).
X = tom, Y = duda;
X = tom, Y = jim.

?- bisavoh(X,Y).
X = pam, Y = jim.

?- descendente(X, tom).
X = bob; X = liz; X = ana;
X = jim; X = bill/ X = duda.

?- descendente(X, pam).
X = bob; X = ana;
X = pat; X = jim.

?- feliz(X).
X = pam; X = tom; X = tom;
X = bob; X = bob; X = liz;
X = bill; X = pat.

?- temDono(X).
X = bebel; X = mel;
X = tomas; X = flor.
*/
