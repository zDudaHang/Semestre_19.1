(defun apagarEnquanto (lista f )
	(if (funcall f (car lista )) 
		(apagarEnquanto (cdr lista) f)
		lista
	)
)

(defun ehpar(x)
	(if (= (mod x 2) 0)
		T 
		NIL
	)
)

(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(write-line "Apagar: ")
	(write-line (write-to-string (apagarEnquanto lista (function ehpar))))
)

(main)