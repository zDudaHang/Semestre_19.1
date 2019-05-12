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

(defun par (n)
	(setq resto (mod n 2))
	(= resto 0)
)

(defun goldbach(n num)
	(cond
		((<= n 2) 0)
		( (not (par n)) 0 )
		( (not (primo num)) (goldbach n (+ num 1)) )
		( (primo (- n num)) num)
		(t (goldbach n (+ num 1)))
	)
)


(defun main()
	(write-line "Número:")
	(setq a (read))
	(setq resultado (goldbach a 3))
	(write-line (write-to-string resultado))
)

(main)