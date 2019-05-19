(defun fmap (f lista lNova)
	(if (null lista)
		lNova
		(fmap f
			(cdr lista) 
			(cons (funcall f (car lista)) lNova ) 

		)
	)
)

(defun lista()
	'(1 2 3 4 5 6 7)
)

(defun main()
	(setq resultado 
		(fmap
				(lambda (x) (if (= (mod x 2) 0) T NIL))
		(lista) () )
	)
	(write-line(write-to-string resultado))
)

(main)