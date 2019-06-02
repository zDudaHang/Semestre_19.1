% x é um estudante que estuda em uma disciplina Y.

% estudantes de SO1
estudante(thiago, ine5412).
estudante(maria, ine5412).
estudante(balde, ine5412).
estudante(caue, ine5412).

% estudantes de Grafos
estudante(thiago, ine5413).
estudante(maria, ine5413).
estudante(balde, ine5413).
estudante(matheus, ine5413).

% estudantes de TC
estudante(thiago, ine5415).
estudante(maria, ine5415).
estudante(joao, ine5415).

% estudantes de Paradigmas
estudante(thiago, ine5416).
estudante(eduardo, ine5416).
estudante(maria, ine5416).

% estudantes de ES1
estudante(thiago, ine5417).
estudante(maria, ine5417).
estudante(evaristo, ine5417).
estudante(ricardo, ine5417).
estudante(dias, ine5417).
estudante(arthur, ine5417).

% o professor X leciona uma disciplina Y
leciona(marcio, ine5412).
leciona(marcio, ine5410).
leciona(rafael, ine5413).
leciona(jerusa, ine5415).
leciona(maicon, ine5416).
leciona(ricardo, ine5417).

% X trabalha
trabalha(thiago).
trabalha(balde).
trabalha(eduardo).

/* Um professor ensina um aluno
se o professor leciona uma disciplina em que o aluno estuda.
X ensina Y sse X está na matéria que Y leciona
*/
ensina(Professor,Aluno) :- leciona(Professor, Disciplina), estudante(Aluno, Disciplina).
/*
Dois estudantes são colegas
de classe se estudam a mesma disciplina e não são o mesmo aluno.
*/
colegas(X,Y) :- estudante(X, Disciplina), estudante(Y, Disciplina), X \== Y.

% onde X trabalha e estuda em uma disciplina Y.
estudanteQueTrabalha(X) :- estudante(X,Y), trabalha(X).
/* Consultas:
?- leciona(marcio, Y).
Y = ine5412; Y = ine5410.

?- leciona(jerusa,Y).
Y = ine5413.

?- ensina(marcio, Y).
Y = thiago; Y = maria;
Y = balde; Y = caue; false.

?- ensina(ricardo, Y).
Y = thiago; Y = maria;
Y = evaristo; Y = ricardo;
Y = dias; Y = arthur.

?- colegas(thiago, Y).
Y = maria; Y = balde; Y = caue; Y = maria;
Y = balde; Y = matheus ; Y = maria; Y = joao;
Y = eduardo; Y = maria; Y = maria; Y = evaristo;
Y = ricardo ; Y = dias ; Y = dias.

?- colegas(caue, maria).
true

?- colegas(caue,evaristo).
false.

?- estudanteQueTrabalha(X).
X = thiago; X = balde;
X = thiago; X = balde;
X = thiago; X = thiago;
X = eduardo; X = thiago;
false.
*/
