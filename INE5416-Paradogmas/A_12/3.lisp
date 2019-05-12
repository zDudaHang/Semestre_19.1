(defun minimo(lista valorMinimo)
	(cond 
		( (null lista) valorMinimo)
	    ( (< (car lista) valorMinimo) (minimo (cdr lista) (car lista)) )
		(t (minimo (cdr lista) valorMinimo))
	)

)


(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(write-line "Minimo: ")
	(write-line (write-to-string (minimo lista (car lista)) ) )
	(write-line (write-to-string (minimo () (car () )) ) )
)

(main)