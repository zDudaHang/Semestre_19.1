(defun divisivel(a b)
	(cond 
		((= a 0) "É divisível")
		((= b 0) "Não é divisível")
		((= a b) "É divisível")
		((= (mod a b) 0) "É divisível")
		(t "Não é divisível")
	)
)


(defun main()
	(write-line "Primeiro valor:")
	(setq a (read))
	(write-line "Segundo valor:")
	(setq b (read))
	(write-line "Mod:")
	(write-line (write-to-string(mod a b)))
	(setq resultado (divisivel a b))
	(write-line (write-to-string resultado))
)

(main)