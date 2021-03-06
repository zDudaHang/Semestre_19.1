(defun mdc(a b)
	(cond 
		((and (= b 0) (= a 0)) 0)
		((= b 0) a)
		((= b a) a)
		((< a b) (mdc a (mod b a)))
		(t (mdc b (mod a b)))
	)
)

(defun mdc3(a b c)
	(setq resultado (mdc a b))
	(mdc c resultado)
)

(defun main()
	(write-line "Primeiro valor:")
	(setq a (read))
	(write-line "Segundo valor:")
	(setq b (read))
	(write-line "Tericeiro valor:")
	(setq c (read))
	(setq resultado (mdc3 a b c))
	(write-line (write-to-string resultado))
)

(main)