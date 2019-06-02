numerosParaPalavras([],[]) :- !.
numerosParaPalavras([H1|T1],[H2|T2]) :-(H1 == 1 -> H2 = 'um';
                                        H1 == 2 -> H2 = 'dois';
                                        H1 == 3 -> H2 = 'tres';
                                        H1 == 4 -> H2 = 'quatro';
                                        H1 == 5 -> H2 = 'cinco';
                                        H1 == 6 -> H2 = 'seis';
                                        H1 == 7 -> H2 = 'sete';
                                        H1 == 8 -> H2 = 'oito';
                                        H1 == 9 -> H2 = 'nove'),
                                        numerosParaPalavras(T1,T2).

/* Consultas
    -? numerosParaPalavras([1,2,3,4],X).
    X = ['um','dois','tres','quatro'].

    -? numerosParaPalavras([1,2,3,4,5,6,7,8,9],X).
    X = ['um','dois','tres','quatro','cinco','seis','sete','oito','nove'].
*/
