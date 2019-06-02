inserirElementoPosicao(Elemento,_,[],[Elemento]) :- !.
inserirElementoPosicao(Elemento,0,L1, [Elemento|L1]) :- !.
inserirElementoPosicao(Elemento, Posicao, [H1|T1], [H1|L2]) :- P1 is Posicao-1,
                                                               inserirElementoPosicao(Elemento,P1,T1,L2).

/* Consultas
  -? inserirElementoPosicao(x,2,[1,2,3,4],X).
  X = [1,2,x,3,4].

  -? posicao(x,2,[],X).
  X = [x].

  -? inserirElementoPosicao(x,3,[1,2,3,4,5],X).
  X = [1,2,3,x,4,5].
*/
