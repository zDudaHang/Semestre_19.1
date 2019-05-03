(defun mdc(a b)
	(cond 
		((and (= b 0) (= a 0)) 0)
		((= b 0) a)
		((= b a) a)
		((< a b) (mdc a (mod b a)))
		(t (mdc b (mod a b)))
	)
)

(defun coprimos(a b)
	(cond 
		((= (mdc a b) 1) T)
		(t NIL)
	)
)

(defun main()
	(write-line "Primeiro valor:")
	(setq a (read))
	(write-line "Segundo valor:")
	(setq b (read))
	(setq resultado (coprimos a b))
	(write-line (write-to-string resultado))
)

(main)