(defun operador(x y op)
	(cond 
		((eq op '+) (+ x y))
		((eq op '-) (- x y))
		((eq op '*) (* x y))
		( (and (eq op '/) (= y 0)) "Divisão por zero!")
		(t (/ x (float y)) )
	)
)


(defun main()
	(write-line "Primeiro valor:")
	(setq a (read))
	(write-line "Segundo valor:")
	(setq b (read))
	(write-line "Operador:")
	(setq op (read))
	(setq resultado (operador a b op))
	(write-line (write-to-string resultado))
)

(main)