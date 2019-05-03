(defun areaTriangulo(base altura)
	(/(* base altura) 2.0)
)

(defun main()
	(setq base (read))
	(setq altura (read))
	(setq resultado (areaTriangulo base altura))
	(write resultado)
)

(main)