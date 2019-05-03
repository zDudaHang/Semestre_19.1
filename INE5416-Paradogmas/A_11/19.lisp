(defun divisivel(a b)
	(cond 
		((= a 0) T)
		((= b 0) NIL)
		((= a b) T)
		((= (mod a b) 0) T)
		(t NIL)
	)
)

(defun primo(n)
	(cond
		( (= (primoAux n 1 0) 2) T)
		( (= (primoAux n 1 0) 1) T)
		(t NIL)
	)
)

(defun primoAux(n num num_primos)
	(cond 
		((= n 1) 1)
		((= n 0) 0)
		( (and (<= num n) (divisivel n num)) (primoAux n (+ num 1) (+ num_primos 1)) )
		( (and (<= num n) (not (divisivel n num)) ) (primoAux n (+ num 1) num_primos) )
		(t num_primos)
	)
)

(defun goldbach(n num)
	(cond
		((= n 0) 0)
		((= n 1) 0)
		((= n 2) 0)
		( (not (primo num)) goldbach n (+ num 1))
		((/= (mod n 2) 0) 0)
		( (primo (- n num)) num)
		(t goldbach n (+ num 1))
	)
)


(defun main()
	(write-line "Primeiro valor:")
	(setq a (read))
	(setq resultado (primo a))
	; (write-line (write-to-string(primoAux a 1 0)))
	(write-line resultado)
)

(main)