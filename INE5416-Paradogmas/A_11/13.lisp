(defun mdc(a b)
	(cond 
		((and (= b 0) (= a 0)) 0)
		((= b 0) a)
		((= b a) a)
		((< a b) (mdc a (mod b a)))
		(t (mdc b (mod a b)))
	)
)

(defun mmc(a b)
	(cond
		((= a 0) 0)
		((= b 0) 0)
		((= a b) a)
		(t (/ (* a b) (float(mdc a b))) )
	)
)

(defun main()
	(write-line "Primeiro valor:")
	(setq a (read))
	(write-line "Segundo valor:")
	(setq b (read))
	(setq resultado (mmc a b))
	(write-line (write-to-string resultado))
)

(main)