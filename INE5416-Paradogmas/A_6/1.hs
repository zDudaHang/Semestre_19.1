-- Nome, disciplina e 3 notas
type Nome = String
type Disciplina = String
type Nota = Float

type Aluno = (Nome, Disciplina, Nota, Nota, Nota)

aluno :: Int -> Aluno
aluno 1 = ("Eduardo", "Paradigmas",1, 1, 1)
aluno 2 = ("Maria", "Sistemas Operacionais 1", 1, 1, 1)
aluno 3 = ("João", "Grafos", 1, 1, 1)
aluno 4 = ("Júnior", "Teoria da Computação", 1, 1, 1)

getNome :: Aluno -> Nome
getNome (nome, _,_,_,_) = nome

media :: Aluno -> Float
media (_,_,n1,n2,n3) = (n1 + n2 + n3)/3

soma_nota :: Aluno -> Float
soma_nota (_,_,n1,n2,n3) = n1+n2+n3

media_int :: Int -> Float
media_int n = media(aluno(n))

soma_notas :: Int -> Float
soma_notas n | (n <= 4) =(soma_nota(aluno n)) + (soma_notas (n+1))
 | otherwise = 0

media_turma :: Int -> Float
media_turma n = (soma_notas n)/4

main = do
 putStrLn( show (aluno 1))
 putStrLn( show ( getNome( ("Matias", "POO2", 5,5,5) ) ) )
 putStrLn( show ( media_int 1))
 putStrLn( show ( soma_notas 1))
 putStrLn( show (media_turma 1))
