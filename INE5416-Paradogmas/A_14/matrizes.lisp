
(setf numerosSudoku '(1 2 3 4 5 6 7 8 9))

(setf x (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '(
   (0 1 2 ) 
   (3 4 5) 
   (6 7 8))) ;inicializando a matriz com alguns valores
)

(setf y (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '(
   (1 2 3 ) 
   (4 5 6) 
   (7 8 9))) ;inicializando a matriz com alguns valores
)

(setf y2 (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '(
   (7 8 9) 
   (4 5 6) 
   (1 2 3 ))) ;inicializando a matriz com alguns valores
)

(setf ehPermutada (make-array '(4 4)
   :initial-contents '(
   (0 0 0 1) 
   (0 1 0 0) 
   (1 0 0 0) 
   (0 0 1 0))) ;inicializando a matriz com alguns valores
)

(setf naoEhPermutada (make-array '(4 4)
   :initial-contents '(
   (0 1 0 0) 
   (0 1 0 0) 
   (1 0 0 0) 
   (0 0 1 0))) ;inicializando a matriz com alguns valores
)

(setf sudokuValido (make-array '(9 9)
   :initial-contents '(
   (1 3 2 5 7 9 4 6 8)
   (4 9 8 2 6 1 3 7 5)
   (7 5 6 3 8 4 2 1 9)
   (6 4 3 1 5 8 7 9 2)
   (5 2 1 7 9 3 8 4 6)
   (9 8 7 4 2 6 5 3 1)
   (2 1 4 9 3 5 6 8 7)
   (3 6 5 8 1 7 9 2 4)
   (8 7 9 6 4 2 1 5 3))) ;inicializando a matriz com alguns valores
)

(setf sudokuInvalido (make-array '(9 9)
   :initial-contents '(
   (1 3 2 5 7 9 4 6 8)
   (4 4 8 2 6 1 3 7 5)
   (7 5 6 3 8 4 2 1 9)
   (6 4 3 1 5 8 7 9 2)
   (5 2 1 7 9 3 8 4 6)
   (9 8 7 4 2 6 5 3 1)
   (2 1 4 9 3 5 6 8 7)
   (3 6 5 8 1 7 9 2 4)
   (8 7 9 6 4 2 1 5 3))) ;inicializando a matriz com alguns valores
)


(defun maior(a) 
    (setq m (aref a 0 0)) ;aref permite acessar uma posição i j da matriz, neste caso acesso a posição 0,0 da matriz a
    (dotimes (i 3) ;dotimes permite realizar um número fixo de iterações
        (dotimes (j 3)
            (if (> (aref a i j) m)
                (setq m (aref a i j))
            )
        )
    )
    m ;é o retorno da minha função
)

; --------------------------------------------------------- QUESTAO 8

(defun lista (tamanho lNova)
    (dotimes (i (expt tamanho 2))
        (setq lNova (append lNova (list (+ i 1))))
    )
    lNova
)

(defun verificarNQuadrado (matriz tamanho) 
    (setq lElementos (pegarElementos matriz tamanho))
    (setq lQuadrado (lista tamanho ()))
    (setq lElSorted (sort lElementos #'<))
    (equal lElSorted lQuadrado)
)

(defun pegarElementos (matriz tamanho)
    (setq lista (make-list 0))
    (dotimes (i tamanho)
        (dotimes (j tamanho)
            (setq lista (append lista (list (aref matriz i j))))
        )
    )
    lista
)

(defun splitAll(l intervalo)
    (setq listas (make-list 0))
    (dotimes (i intervalo)
        (setq par (split l intervalo))
        (setq l (cdr par))
        (setq lsplited (first par))
        (setq listas (cons lsplited listas))
    )
    (reverse listas)
)

(defun split (l tamanho)
    (setq lista (make-list 0))
    (dotimes (i tamanho)
        (setq lista (append lista(list (pop l))))
    )
    (cons lista l)
)

(defun somaLinha (matriz indice tamanho)
    (setf soma 0)
    (dotimes (j tamanho)
        (setf soma (+ soma (aref matriz indice j)))
    )
    soma
)

(defun somaLinhas(matriz tamanho)
    (setf somas 0)
    (dotimes (i tamanho)
        (setf somas(+ (somaLinha matriz i tamanho) somas))
    )
    somas
)

(defun somaColuna (matriz indice tamanho)
   (setf soma 0)
    (dotimes (i tamanho)
        (setf soma (+ soma (aref matriz i indice)))
    )
    soma
)

(defun somaColunas(matriz tamanho)
    (setf somas 0)
    (dotimes (j tamanho)
        (setf somas(+ (somaColuna matriz j tamanho) somas))
    )
    somas
)

(defun somaDiagonalPrincipal (matriz tamanho)
    (setf soma 0)
    (dotimes (i tamanho)
        (setf soma (+ soma (aref matriz i i)))
    )
    soma
)

(defun somaDiagonalSecundaria (matriz tamanho)
    (setf soma 0)
    (dotimes (i tamanho)
        (setf soma (+ soma (aref matriz (- (- tamanho 1) i) i)))
    )
    soma
)

(defun ehQuadradoMagico (matriz tamanho)
    (setf somaCol (somaColunas matriz tamanho))
    (setf somaLin (somaLinhas matriz tamanho))
    (setf somaDigP (somaDiagonalPrincipal matriz tamanho))
    (setf somaDigS (somaDiagonalSecundaria matriz tamanho))
    (setf contem (verificarNQuadrado matriz tamanho))
    (if 
        (and contem 
            (= somaCol somaLin)
            (= somaDigP somaDigS)
        )
        T 
        NIL
    )
)

; --------------------------------------------------------- QUESTAO 9

(defun contaValor (matriz tamanho valor)
    (setf qtd 0)
    (dotimes (i tamanho)
        (dotimes (j tamanho)
            (setf elemento (aref matriz i j))
            (if (= elemento valor) 
                (setf qtd (+ qtd 1))
            )
        )
    )
    qtd
)

(defun verficiarLinhas (listaLinhas)
    (setf resultado NIL)
    (dotimes (i (list-length listaLinhas))
        (setq l1 (nth i listaLinhas))
        (setq l2 (nth (+ i 1) listaLinhas))
        (setf resultado 
            (or resultado 
                (equal l1 l2)
            )
        )
    )
    resultado
)

(defun verificarMatriz (matriz tamanho)
    (setq listaElementos (pegarElementos matriz tamanho))
    (setq listaLinhas (splitAll listaElementos tamanho))
    (verficiarLinhas listaLinhas)
)

(defun ehMatrizDePermutacao (matriz tamanho)
    (setf qtdZero (contaValor matriz tamanho 0))
    (setf qtdUm (contaValor matriz tamanho 1))
    (setf resultado (verificarMatriz matriz tamanho))
    (and (not resultado) 
        (= qtdZero (* tamanho (- tamanho 1)))
        (= qtdUm tamanho)
    )
)

; --------------------------------------------------------- QUESTAO 10

(defun fragmentarMatriz(matriz)
    (setq 3x3 (make-list 0))
    (setq lElementos (pegarElementos matriz 9))
    (setq lLinhas (splitAll lElementos 9))
    (dotimes (i 9)
        (setq linha (nth i lLinhas))
        (setq 3x3 (cons (splitAll linha 3) 3x3))
    )
    (reverse 3x3)
)

(defun pegarCaixas (matrizFragmentada)
    (setq caixa (make-list 0))
    (do ((j 0 (+ 3 j)) ; declara j, inicialmente como 0, e j + 3 para cada iteracao
        (cur 0 next) ; declara cur, inicialmente 0, o antigo valor de next
        (next 3 (+ cur next))) ; declara next, inicialmente 3, então a soma do (antigo) cur e next
        ((= 9 j) ; condicao do fim do "do"
        cur) ; valor de retorno
        (dotimes (i 3)
            (setq l1 (nth i (nth j matrizFragmentada)))
            (setq l2 (nth i (nth (+ j 1) matrizFragmentada)))
            (setq l3 (nth i (nth (+ j 2) matrizFragmentada)))
            (setq caixa (cons (append l1 l2 l3) caixa))
        )
    )
    (reverse caixa)
)

(defun validarCaixasAux (lCaixas)
    (setf resultado T)
    (dotimes (i 9)
        (setq caixa (nth i lCaixas))
        (setq caixaSorted (sort caixa #'<))
        (setf resultado (and resultado (equal caixaSorted numerosSudoku)))   
    )
    resultado
)


(defun pegarLinhas (matriz)
    (setq lElementos (pegarElementos matriz 9))
    (splitAll lElementos 9)
)


(defun pegarColuna (lLinhas indice)
    (setq coluna (make-list 0))
    (dotimes (i (list-length lLinhas))
        (setq linha (nth i lLinhas))
        (setq elemento (nth indice linha))
        (setq coluna (append coluna (list elemento)))
    )
    coluna
)

(defun pegarColunas (matriz)
    (setq colunas (make-list 0))
    (setq lElementos (pegarElementos matriz 9))
    (setq lLinhas (splitAll lElementos 9))
    (dotimes (i 9)
        (setq colunaI (pegarColuna lLinhas i))
        (setq colunas (cons colunaI colunas))
    )
    (reverse colunas)
)

(defun validarLinhas (matriz)
    (setq linhas (pegarLinhas matriz))
    (setf resultado T)
    (dotimes (i 9)
        (setq linha (nth i linhas))
        (setq linhaSorted (sort linha #'<))
        (setf resultado (and resultado (equal linhaSorted numerosSudoku)))
    )
    resultado
)

(defun validarColunas (matriz)
    (setq colunas (pegarColunas matriz))
    (setf resultado T)
    (dotimes (i 9)
        (setq coluna (nth i colunas))
        (setq colunaSorted (sort coluna #'<))
        (setf resultado (and resultado (equal colunaSorted numerosSudoku)))
    )
    resultado
)

(defun validarCaixas (matriz)
    (setq lCaixas (pegarCaixas (fragmentarMatriz matriz)))
    (setf resultadoMatriz (validarCaixasAux lCaixas))
    resultadoMatriz
)

(defun ehSoduku (matriz)
    (setf vLinhas (validarLinhas matriz))
    (setf vColunas (validarColunas matriz))
    (setf vCaixas (validarCaixas matriz))
    (and vLinhas vColunas vCaixas)
)

(defun main()
    (write-line "Matriz x:")
    (write-line (write-to-string x)) ;imprimindo uma matriz

    (write-line "Matriz y:")
    (write-line (write-to-string y)) ;imprimindo uma matriz
    
    (write-line (write-to-string (aref x 0 0)))
    (write-line (write-to-string (aref x 1 1)))
    
    (write-line (write-to-string (maior x))) ;passando uma matriz como parâmetro
    
    (setf (aref x 0 1) 33) ;alrerando o elemento da posição 0,1 para 33
    
    (write-line (write-to-string (maior x)))

    (write-line "A matriz x é um quadrado mágico?")

    (write-line (write-to-string (ehQuadradoMagico x 3)))

    (write-line "A matriz y é um quadrado mágico?")

    (write-line (write-to-string (ehQuadradoMagico y 3)))

    (write-line "A matriz y2 é um quadrado mágico?")

    (write-line (write-to-string (ehQuadradoMagico y2 3)))

    (write-line "A matriz ehPermutada é uma matriz de permutação ?")

    (write-line (write-to-string (ehMatrizDePermutacao ehPermutada 4)))

    (write-line "A matriz naoEhPermutada é uma matriz de permutação ?")

    (write-line (write-to-string (ehMatrizDePermutacao naoEhPermutada 4)))

    (write-line "A matriz sudokuValido representa um sudoku válido?")

    (write-line (write-to-string (ehSoduku sudokuValido)))

    (write-line "A matriz sudokuInvalido representa um sudoku válido?")

    (write-line (write-to-string(ehSoduku sudokuInvalido)))
)

(main)