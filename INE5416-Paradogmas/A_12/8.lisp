(defun fatia (lista indexInit indexEnd count lNova)
	(cond 
		((null lista) NIL)
		( (and (>= count IndexInit) (< count indexEnd) ) 
			 ; (write-line (write-to-string (car lista)))
			 (fatia (cdr lista) indexInit indexEnd (+ count 1) (cons (car lista) lNova ))
		)
		(t lNova )
	)

)

(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(write-line "Fatia: ")
	(write-line (write-to-string (fatia lista 0 4 0 () )))
	(write-line (write-to-string (fatia lista 0 3 0 () )))
	(write-line (write-to-string (fatia lista 0 2 0 () )))
)

(main)