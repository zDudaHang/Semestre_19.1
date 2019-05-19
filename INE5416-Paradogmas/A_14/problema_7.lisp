(defun filtrar (f lista)
	(if (null lista)
		()
		(if (funcall f (car lista))
			(cons (car lista) (filtrar f (cdr lista)))
			(filtrar f (cdr lista))
		)
	)
)

(defun lista()
	'(1 2 3 4 5 6 7)
)

(defun main()
	(setq resultado 
		(filtrar
				(lambda (x) (if (/= (mod x 2) 0) T NIL))
		(lista))
	)
	(write-line(write-to-string resultado))
)

(main)