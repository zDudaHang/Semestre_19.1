(defun fib(n)
	(cond
		((= n 0) 0)
		((= n 1) 1)
		(t (+ (fib (- n 1)) (fib (- n 2)) ) )
	)
)

(defun main()
	(setq n (read))
	(setq resultado (fib n))
	(write resultado)
)

(main)