(defun fmap (f lista lNova)
	(if (null lista)
		lNova
		(fmap f
			(cdr lista) 
			(cons (funcall f (car lista)) lNova ) 

		)
	)
)

(defun incrementa(x)
	(+ x 1)
)

(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(write-line "Fmap: ")
	(write-line (write-to-string (fmap (function incrementa) lista () )))
)

(main)