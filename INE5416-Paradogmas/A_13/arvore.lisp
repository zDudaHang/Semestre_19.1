(defstruct no
    n
    esq
    dir
)

(setq minhaArvore
    (make-no 
        :n 52
        :esq (make-no :n 32               ;pode omitir o NIL 
                      :esq (make-no :n 12 :esq NIL :dir NIL) 
                      :dir (make-no :n 35 :esq NIL :dir NIL)
             )
        :dir (make-no :n 56 
                      :esq (make-no :n 55 :esq NIL :dir NIL) 
                      :dir (make-no :n 64 :esq NIL :dir NIL)
             ) 
    )
)

(setq teste
    (make-no 
        :n 52
        :esq (make-no :n 32               ;pode omitir o NIL 
                      :esq (make-no :n NIL :esq NIL :dir NIL) 
                      :dir (make-no :n 35 :esq NIL :dir NIL)
             )
        :dir (make-no :n 56 
                      :esq (make-no :n 55 :esq NIL :dir NIL) 
                      :dir (make-no :n 64 :esq NIL :dir NIL)
             ) 
    )
)

(setq minhaArvore2
    (make-no 
        :n 2
        :esq (make-no :n 7              ;pode omitir o NIL 
                      :esq (make-no :n 2
                        :esq NIL 
                        :dir NIL) 
                      :dir (make-no :n 6 
                        :esq (make-no :n 5
                            :esq NIL
                            :dir NIL) 
                        :dir (make-no :n 11
                            :esq NIL
                            :dir NIL))
             )
        :dir (make-no :n 5
                      :esq NIL
                      :dir (make-no :n 9 
                        :esq (make-no :n 4
                            :esq NIL
                            :dir NIL) 
                        :dir NIL)
             ) 
    )
)

(setq repetida
    (make-no 
        :n 52
        :esq (make-no :n 32               ;pode omitir o NIL 
                      :esq (make-no :n 12 :esq NIL :dir NIL) 
                      :dir (make-no :n 35 :esq NIL :dir NIL)
             )
        :dir (make-no :n 32
                      :esq (make-no :n 55 :esq NIL :dir NIL) 
                      :dir (make-no :n 32 :esq NIL :dir NIL)
             ) 
    )
)

(defun soma (arv)
    (if (null arv)
        0
        (+ 
            (no-n arv) 
            (soma (no-esq arv)) 
            (soma (no-dir arv))
        )
    )
)

(defun buscaElemento (arv x)
    (if (null arv)
        NIL
        (or 
            (= (no-n arv) x)
            (buscaElemento (no-esq arv) x) 
            (buscaElemento (no-dir arv) x)
        )
    )
)

(defun minimo (x y)
    (if (< x y)
        x
        y
    )
)

(setq INF 1000)

(defun minimoElemento (arv)
    (if (null arv)
        INF
        (minimo 
            (no-n arv) 
            (minimo 
                (minimoElemento (no-esq arv)) 
                (minimoElemento (no-dir arv))
            )
        )
    )
)

(defun incrementa (arv x)
    (if (not (null arv))
        (progn
            (setf (no-n arv) (+ (no-n arv) x))
            (incrementa (no-esq arv) x)
            (incrementa (no-dir arv) x)
        )
    )
)

(defun ocorrenciasElemento (arv x)
    (cond
        ((null arv) 0)
        ((= (no-n arv) x) (+ 1 (ocorrenciasElemento (no-esq arv) x) (ocorrenciasElemento (no-dir arv) x) ))
        (t (+ (ocorrenciasElemento (no-esq arv) x) (ocorrenciasElemento (no-dir arv) x) ))
    )
)

(defun maioresQueElemento (arv x)
    (cond
        ((null arv) 0)
        ( (> (no-n arv) x) (+ 1 (maioresQueElemento (no-esq arv) x) (maioresQueElemento (no-dir arv) x)))
        (t (+ (maioresQueElemento (no-esq arv) x) (maioresQueElemento (no-dir arv) x)))
    )
)

(defun mediaElementos (arv)
    (setq somaElementos (soma arv))
    (setq quantidade (quantidadeElementos arv))
    (/ somaElementos (float quantidade))
)

(defun quantidadeElementos (arv)
    (if (null arv) 
        0
        (+ 1 (quantidadeElementos (no-esq arv)) (quantidadeElementos (no-dir arv)) )
    )
)

(defun elementos (arv)
    (if (null arv)
        ()
        (append (list (no-n arv)) (elementos (no-esq arv)) (elementos (no-dir arv)))
    )
)

(defun substituir (arv x y)
    (cond 
        ((null arv) "Alterado")
        ((eq x (no-n arv))
            (substituir (no-esq (alteraValor arv x y)) x y) (substituir (alteraValor arv x y) x y))
        (t (substituir (no-esq arv) x y) (substituir (no-dir arv) x y))
    )
)

(defun alteraValor (arv x y)
    (setf (no-n arv) y)
    ; (write-line (write-to-string arv))
    arv
)

(defun posOrdem (arv) 
    (if (null arv)
        NIL
        (append (posOrdem (no-esq arv)) (posOrdem (no-dir arv)) (list (no-n arv)))
    )
)

(defun emOrdem (arv)
    (if (null arv)
        NIL
        (append (emOrdem (no-esq arv)) (list (no-n arv)) (emOrdem (no-dir arv)))
    )
)

(defun preOrdem (arv)
    (if (null arv)
        NIL
        (append (list (no-n arv)) (preOrdem (no-esq arv)) (preOrdem (no-dir arv)))
    )
)

(defun subtraiParesImpares (arv)
    (setq pares (pegarPares arv))
    (setq impares (pegarImpares arv))
    (- (somaLista pares) (somaLista impares))

)

(defun filtrar (f lista)
    (if (null lista)
        ()
        (if (funcall f (car lista))
            (cons (car lista) (filtrar f (cdr lista)))
            (filtrar f (cdr lista))
        )
    )
)

(defun ehPar (x)
    (= (mod x 2) 0)
)

(defun ehImpar (x)
    (/= (mod x 2) 0)
)

(defun pegarPares (arv)
    (filtrar (function ehPar) (elementos arv))
)

(defun pegarImpares (arv)
    (filtrar (function ehImpar) (elementos arv))
)

(defun somaLista(lista)
    (if (null lista)
        0
        (+ 
            (car lista) 
            (somaLista (cdr lista)) 
        )
    )
)

(defun novoNo (x)
    (setq nova
    (make-no 
        :n x
        :esq NIL
        :dir NIL
    ))
    nova
)

(defun inserir (arv x)
    ; (write-line "Arv:")
    ; (write-line (write-to-string (no-n arv)))
    (cond
        ( (null arv) ())
        ((and 
            (null (no-esq arv)) (not (null (no-dir arv)) ))
            (mudarFilho (no-esq arv) x T)
        )
        ((and 
            (null (not (no-esq arv)) ) (null (no-dir arv) ))
            (mudarFilho (no-dir arv) x NIL)
        )
        ( (ehFolha arv) (transformarFolha arv x))
        (t (inserir (no-esq arv) x))
    )
    arv
)

(defun ehFolha (arv)
    (if 
        (and (null (no-esq arv)) (null (no-dir arv)) )
        T
        NIL
    )
)

; lado == 1 -> esquerda, lado == 0 -> direita
(defun mudarFilho (arv x lado)
    (if (lado)
        (setf (no-esq arv) (novoNo x))
        (setf (no-dir arv) (novoNo x))
    )
    arv
)

(defun transformarFolha (arv x)
    (setf (no-esq arv) (novoNo x))
    arv
)

(defun main()
    (write-line (write-to-string (soma minhaArvore)))
    (write-line (write-to-string (buscaElemento minhaArvore 35)))
    (write-line (write-to-string (buscaElemento minhaArvore 36)))
    (write-line (write-to-string (minimoElemento minhaArvore)))
    ; (write-line (write-to-string (incrementa minhaArvore 2)))
    (write-line (write-to-string minhaArvore))
    (write-line "Ocorrencias:")
    (write-line (write-to-string (ocorrenciasElemento minhaArvore 64)))
    (write-line (write-to-string (ocorrenciasElemento repetida 32)))
    (write-line "maiores que elemento 50:")
    (write-line (write-to-string (maioresQueElemento minhaArvore 50)))
    (write-line (write-to-string (maioresQueElemento repetida 50)))
    (write-line "Media:")
    (write-line (write-to-string (mediaElementos minhaArvore)))
    (write-line (write-to-string (mediaElementos repetida)))
    (write-line "Elementos:")
    (write-line (write-to-string (elementos minhaArvore)))
    (write-line "PosOrdem:")
    (write-line (write-to-string (posOrdem minhaArvore2)))
    (write-line "EmOrdem:")
    (write-line (write-to-string (emOrdem minhaArvore2)))
    (write-line "PreOrdem:")
    (write-line (write-to-string (preOrdem minhaArvore2)))
    (write-line "SubtraiParesImpares:")
    (write-line (write-to-string (subtraiParesImpares minhaArvore)))
    (write-line "novoNo:")
    (write-line (write-to-string (novoNo 22)))
    (write-line "Inserir:")
    (write-line (write-to-string (inserir minhaArvore 22)))
    (write-line "Inserir:")
    (write-line (write-to-string (inserir teste 22)))
)

(main)