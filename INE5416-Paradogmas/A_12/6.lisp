(defun ocorrencias(lista valor count)
	(cond
		( (null lista) count)
		( (= (car lista) valor) (ocorrencias (cdr lista) valor (+ 1 count)) )
		(t (ocorrencias (cdr lista) valor count))
	)
)

(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(setq lista2 '(5 5 5 5 5 5))
	(write-line "Ocorrencias: ")
	(write-line (write-to-string (ocorrencias lista 3 0)))
	(write-line (write-to-string (ocorrencias lista2 5 0)))
)

(main)