(defun soma(lista)
	(if (null lista)
		0
		(+ 
			(car lista) 
			(soma (cdr lista)) 
		)
	)
)


(defun comprimento(lista)
	(if (null lista)
		0
		(+ 1 (comprimento (cdr lista)) )

	)

)

(defun media(lista)
	(if (null lista)
		0
		(/ (soma lista) (comprimento lista))
	)
)

(defun main()
	(write-line "Soma de (5 5 5): ")
	(write-line (write-to-string (soma '(5 5 5)) ) )
	(write-line "Media (5 5 5): ")
	(write-line (write-to-string (media '(5 5 5)) ) )
)

(main)