(defun apagar (lista n count) 
	(if (>= count n)
		lista
		(apagar (cdr lista) n (+ count 1))
	)
)

(defun main()
	(setq lista '( 200 100 50 10 1 2 3) )
	(write-line "Apagar enquanto: ")
	(write-line (write-to-string (apagar lista 3 0)))
)

(main)