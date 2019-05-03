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
		( (= (primoAux n 1 0) 2) "É um primo")
		( (= (primoAux n 1 0) 1) "É um primo")
		(t "Não é primo")
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


(defun main()
	(write-line "Primeiro valor:")
	(setq a (read))
	(setq resultado (primo a))
	; (write-line (write-to-string(primoAux a 1 0)))
	(write-line resultado)
)

(main)