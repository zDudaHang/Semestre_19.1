(defun busca(lista valor)
	(cond
		((null lista) NIL)
		( (= valor (car lista)) T)
		(t (busca (cdr lista) valor))
	)
)

(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(write-line "Busca: ")
	(write-line (write-to-string (busca lista 3)))
	(write-line (write-to-string (busca lista 300)))
)

(main)