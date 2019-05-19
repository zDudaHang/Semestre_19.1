
(defun comprimento(lista)
  (if (null lista)
    0
    (+ 1 (comprimento (cdr lista)) )
  )
)

(defun alunos()
    '(
      (1 "Bob" (5.6 8 9.3))
      (2 "Ana" (8.2 9 7 6.5))
      (3 "Tom" (3.2 7 5.7 8.3))
      (4 "Bin" (7.5 5.3 8.5 6.2 3.1))
      (5 "Bia" (6.7 4.1 5.5))
    )
)

(defun getNotasAluno(aluno)
  (if (null aluno) 
    ()
    (car (cdr ( cdr aluno)))
  )
)

(defun getNotasAlunos(alunos)
  (if (null alunos) 
    ()
    (cons (getNotasAluno (car alunos)) (getNotasAlunos (cdr alunos)))
  )
)

(defun getNome (aluno)
    (car (cdr aluno))
)

(defun getNomes (lista)
    (if (null lista)
        ()
        (cons (getNome (car lista)) (getNomes (cdr lista)))
    )
)

(defun somaNotas (notas)
  (if (null notas)
    0
    (+ (car notas) (somaNotas (cdr notas)))
  )
)

(defun somarNotasAluno (aluno)
  (+ (somaNotas (getNotasAluno aluno)))
)

(defun somarNotasAlunos (alunos)
  (if (null alunos) 
    0
   (+ (somarNotasAluno (car alunos)) (somarNotasAlunos (cdr alunos)))
  )
)

(defun media (aluno)
  (if (null aluno)
    0
    (/(somarNotasAluno aluno) (comprimento (getNotasAluno aluno)))
  )
)

(defun medias (alunos)
  (if (null alunos)
    ()
    (cons (media (car alunos)) (medias (cdr alunos)))
  )
)

(defun mediasComNome (alunos)
  (setq media (media (car alunos)))
  (setq nomeAluno (getNome (car alunos)))
  (if (null alunos)
    ()
    (cons (list nomeAluno media) (mediasComNome (cdr alunos)) )
  )
)

(defun mediaTurma (alunos)
  (if (null alunos)
    0
    (/ (somarNotasAlunos alunos) (comprimento alunos))
  )
)

(defun acimaMediaAux (alunosFiltrados)
  (cond 
    ((null alunosFiltrados) ())
    (t (cons (getInfos (car alunosFiltrados)) (acimaMedia (cdr alunosFiltrados)) )) 
  )
)

(defun acimaMedia (alunos)
  (if (null alunos)
    ()
    (acimaMediaAux (filtrarAlunos alunos))
  )
)

(defun getInfos (aluno)
  (if (null aluno) 
    ()
    (cons (getNome aluno) (media aluno))
  )
)

(defun filtrarAlunos (alunos)
  (cond
    ((null alunos) ())
    ((>= (media (car alunos)) 6.0) (cons (car alunos) (filtrarAlunos (cdr alunos))))
    (t (filtrarAlunos (cdr alunos)))
  )
)

(defun aprovadosAux (alunosFiltrados)
  (cond 
    ((null alunosFiltrados) ())
    (t (getNomes alunosFiltrados))
  )
)

(defun aprovados (alunos)
  (if (null alunos)  
    ()
    (aprovadosAux (filtrarAlunos alunos))
  )
)

(defun criarDupla (aluno alunos)
  (setq alunosNomes (getNomes alunos))
  (setq alunoNome (getNome aluno))
  (cond
    ((null alunos) ())
    ((null aluno) ())
    ((eq alunoNome (car alunosNomes)) (criarDupla aluno (cdr alunos)))
    (t (cons (cons alunoNome (car alunosNomes)) (criarDupla aluno (cdr alunos))))
  )
)

(defun criarDuplas (alunos)
  (if (null alunos)
    ()
    (cons (criarDupla (car alunos) alunos) (criarDuplas (cdr alunos)))
  )
)

(defun ordenarAlunos (alunos)
  (if (null alunos) 
    ()
    (sort alunos #'(lambda (x y) (< (second x) (second y)) ) )
  )
)

(defun main ()
    (write-line "Média da turma:")
    (write-line (write-to-string (mediaTurma (alunos))))
    (write-line "Médias: ")
    (write-line (write-to-string (medias (alunos))))
    (write-line (write-to-string (mediasComNome (alunos))))
    (write-line "Acima da média:")
    (write-line (write-to-string (acimaMedia (alunos))))
    (write-line "Aprovados: ")
    (write-line (write-to-string (aprovados (alunos))))
    (write-line "Duplas: ")
    (write-line (write-to-string (criarDupla (car (alunos)) (alunos))))
    (write-line (write-to-string (criarDuplas (alunos))))
    (write-line "Ordenacao:")
    (write-line (write-to-string (ordenarAlunos (mediasComNome (alunos)))))
)

(main)