(defun enesimo (lista index count)
	(if (= index count)
		(car lista)
		(enesimo (cdr lista) index (+ count 1))
	)

)

(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(write-line "Enesimo: ")
	(write-line (write-to-string (enesimo lista 0 0)))
	(write-line (write-to-string (enesimo lista 1 0)))
	(write-line (write-to-string (enesimo lista 2 0)))
	(write-line (write-to-string (enesimo lista 3 0)))
	(write-line (write-to-string (enesimo lista 4 0)))
)

(main)