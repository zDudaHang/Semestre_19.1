(defun main()
	(setq x (read))
	(setq y (read))
	(setq resultado (expt x y))
	(write (write-to-string resultado))
)

(main)