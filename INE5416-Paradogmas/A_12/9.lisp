(defun inverte (lista lNova)
	(if (null lista)
		lNova
		(inverte (cdr lista) (cons (car lista) lNova))
	)

)

(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(write-line "Inverte: ")
	(write-line (write-to-string (inverte lista () )))
)

(main)