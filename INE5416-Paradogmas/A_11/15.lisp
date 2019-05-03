(defun mdc(a b)
	(cond 
		((and (= b 0) (= a 0)) 0)
		((= b 0) a)
		((= b a) a)
		((< a b) (mdc a (mod b a)))
		(t (mdc b (mod a b)))
	)
)

(defun coprimos(a b)
	(cond 
		((= (mdc a b) 1) T)
		(t NIL)
	)
)

(defun totienteEuler (n num numCoprimos)
	(cond
		( (and (< num n) (coprimos n num)) (totienteEuler n (+ num 1) (+ numCoprimos 1)) )
		( (and (< num n) (not (coprimos n num)) ) (totienteEuler n (+ num 1) numCoprimos) )
		(t numCoprimos)
	)
)

(defun main()
	(write-line "Valor:")
	(setq a (read))
	(setq resultado (totienteEuler a 1 0))
	(write-line (write-to-string resultado))
)

(main)