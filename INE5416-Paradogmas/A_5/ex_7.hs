alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getNota :: (Int, String, Float) -> Float
getNota (a,b,c) = c

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

gerarPares :: [(Int, String, Float)] -> [(Int, String, Float)] -> [((Int, String, Float),(Int, String, Float))] 
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2, (getNome a) /= (getNome b)]

aprovado :: (Int, String, Float) -> Bool
aprovado aluno = if (getNota aluno) >= 6
 then True
 else False

aprovados_A :: [(Int, String, Float)] -> [String]
aprovados_A lista = (map getNome (filter aprovado lista))

aprovados_B :: [(Int, String, Float)] -> [String]
aprovados_B lista = [(getNome x) | x <- lista, (getNota x) >= 6]
main = do
    print (getPrimeiroAluno alunos)
    print (aprovados_A alunos)
    print (aprovados_B alunos)
    print (gerarPares alunos alunos)