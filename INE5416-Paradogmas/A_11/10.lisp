(defun maximo(a b)
	(cond 
		((> a b) a)
		(t b)
	)
)

(defun main()
	(write-line "Primeiro valor:")
	(setq a (read))
	(write-line "Segundo valor:")
	(setq b (read))
	(write-line "Terceiro valor:")
	(setq c (read))
	(setq max1 (maximo a b))
	(setq max2 (maximo c max1))
	(write-line (write-to-string max2))
)

(main)