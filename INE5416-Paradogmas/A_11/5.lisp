(defun aprovado(p1 p2 p3)
	(setq soma (+ p1 p2 p3))
	(setq media (/ soma 3.0))
	(cond 
		((>= media 6.0) "Aprovado")
		(t "Reprovado")
	)
)

(defun main()
	(setq p1 (read))
	(setq p2 (read))
	(setq p3 (read))
	(setq resultado (aprovado p1 p2 p3))
	(write resultado)
)

(main)