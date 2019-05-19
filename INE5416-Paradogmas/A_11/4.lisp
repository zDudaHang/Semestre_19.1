(defun xor(a b)
	(setq notA (not a))
	(setq notB (not b))
	(setq and1 (and a notB))
	(setq and2 (and notA b))
	(or and1 and2)
)

(defun main()
	(setq a (read))
	(setq b (read))
	(setq resultado (xor a b))
	(write resultado)
)

(main)