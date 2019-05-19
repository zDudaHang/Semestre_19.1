(defun main()
	(setq a (read))
	(setq b (read))
	(setq c (read))
	(setq resultado ( ( lambda (x y z) (max z (max x y)) ) a b c ))
	(write-line (write-to-string resultado))
)

(main)
