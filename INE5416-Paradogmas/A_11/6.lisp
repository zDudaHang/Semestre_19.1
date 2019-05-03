(defun modulo(x)
	(cond
		((< x 0) (- 0 x))
		(t x)
	)
)

(defun ehTriangulo(a b c)
	(setq modulo (modulo (- b c) ) )
	(setq cond1 (> a modulo))
	(setq cond2 (< a (+ b c)) )
	(setq formaTriangulo (and cond1 cond2))
	(cond 
		(formaTriangulo "Forma um triângulo")
		(t "Não forma um triângulo1")
	)
)

(defun main()
	(setq a (read))
	(setq b (read))
	(setq c (read))
	(setq resultado (ehTriangulo a b c))
	(write resultado)
)

(main)