(defstruct ponto2D
	x
	y
)

(defun distancia (p1 p2)
	(if 
		(or(null p1)(null p2)) 0
		(distanciaAux p1 p2)
	)
)

(defun distanciaAux (p1 p2)
	(setq diff1 (- (ponto2D-x p1) (ponto2D-x p2)))
	(setq diff2 (- (ponto2D-y p1) (ponto2D-y p2)))
	(setq diff1q (expt diff1 2))
	(setq diff2q (expt diff2 2))
	(sqrt (+ diff1q diff2q))
)

(defun colineares (p1 p2 p3)
	(if 
		(or (null p1) (null p2) (null p3)) NIL
		(if (= (determinante p1 p2 p3) 0)
			T
			NIL
		)
	)
)

(defun determinante (p1 p2 p3)
	(setq soma(+ (* (ponto2D-x p1) (ponto2D-y p2)) (* (ponto2D-y p1) (ponto2D-x p3)) (* (ponto2D-x p2) (ponto2D-y p3))) )
	(setq diferenca (+ (* (ponto2D-y p1) (ponto2D-x p2)) (* (ponto2D-x p1) (ponto2D-y p3)) (* (ponto2D-y p2) (ponto2D-x p3))) )
	(- soma diferenca)
)

(defun formaTriangulo (p1 p2 p3)
	(setq difabs (abs(- (distancia p2 p3) (distancia p1 p3))))
	(setq cond1 (< difabs (distancia p1 p2)))
	(setq cond2 (< (distancia p1 p2) (+ (distancia p2 p3) (distancia p1 p2) ) ))
	(and cond1 cond2)
)

(defun main()
	(setq p1 
		(make-ponto2D
			:x 0
			:y 5
		)
	)
	(setq p2 
		(make-ponto2D
			:x 1
			:y 3
		)
	)
	(setq p3 
		(make-ponto2D
			:x 2
			:y 1
		)
	)
	(write-line (write-to-string (distancia p1 p2)))
	(write-line (write-to-string (colineares p1 p2 p3)))
	(write-line (write-to-string (formaTriangulo p1 p2 p3)))
)

(main)