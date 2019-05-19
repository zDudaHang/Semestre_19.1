(defun main()
	(setq p1 (read))
	(setq p2 (read))
	(setq p3 (read))
	(setq resultado ( 
		(lambda (x y z) 
			(/(+ x y z)3.0)
			)p1 p2 p3)
	)
	(setq aprovado ( (lambda (x) (if (>= x 6.0) "Aprovado" "Não aprovado") ) resultado ) )
	(write-line aprovado)
)

(main)