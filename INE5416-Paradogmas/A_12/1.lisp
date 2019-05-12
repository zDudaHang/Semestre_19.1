(defun soma(lista)
	(if (null lista)
		0
		(+ 
			(car lista) 
			(soma (cdr lista)) 
		)
	)
)


(defun main()
	(write-line "Soma de (5 5 5): ")
	(write-line (write-to-string (soma '(5 5 5)) ) )
)

(main)