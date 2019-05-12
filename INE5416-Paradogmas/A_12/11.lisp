(defun primeiros (lista n count lNova)
	(cond 
		((null lista) ())
		((< count n) 
			 (primeiros (cdr lista) n (+ count 1) (cons (car lista) lNova))
		)
		(t (inverte lNova ()) )
	)

)

(defun inverte (lista lNova)
	(if (null lista)
		lNova
		(inverte (cdr lista) (cons (car lista) lNova))
	)

)


(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(write-line "Primeiros: ")
	(write-line (write-to-string (primeiros lista 4 0 () )))
	(write-line (write-to-string (primeiros lista 3 0 () )))
	(write-line (write-to-string (primeiros lista 2 0 () )))
	(write-line (write-to-string (primeiros lista 1 0 () )))
)

(main)