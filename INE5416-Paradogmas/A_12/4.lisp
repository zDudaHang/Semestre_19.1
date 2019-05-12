(defun minimo(lista valorMinimo)
	(cond 
		( (null lista) valorMinimo)
	    ( (< (car lista) valorMinimo) (minimo (cdr lista) (car lista)) )
		(t (minimo (cdr lista) valorMinimo))
	)
)

(defun maximo (lista valorMaximo)
	(cond
		( (null lista) valorMaximo)
		( (> (car lista) valorMaximo) (maximo (cdr lista) (car lista)) )
		(t (maximo (cdr lista) valorMaximo) )
	)
)

(defun diffMaxMin (lista)
	(setq maximoLista (maximo lista 0) )
	(setq minimoLista (minimo lista (car lista)) )
	(- maximoLista minimoLista)
)


(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(write-line "Diferenca entre maximo e minimo: ")
	(write-line (write-to-string (diffMaxMin lista)))
)

(main)