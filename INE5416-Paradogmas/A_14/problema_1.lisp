(defun main()
	(setq a (read))
	(setq b (read))
	(setq resultado
	((lambda (x y) 
		(or (and x (not y)) (and y (not x))) )a b))
	(write-line(write-to-string resultado))
)

(main)