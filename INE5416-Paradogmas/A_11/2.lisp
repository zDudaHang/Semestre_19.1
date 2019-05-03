(defun modulo(x)
	(cond
		((< x 0) (- 0 x))
		(t x)
	)
)

(defun main()
	(setq x (read))
	(setq resultado (modulo x))
	(write (write-to-string resultado))
)

(main)