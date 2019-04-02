--Crie uma função que receba três notas de um aluno (a, b, c), calcule a média e retorne se o aluno foi aprovado ou reprovado. Para um aluno ser aprovado, ele deve possuir nota igual ou superior a 6. Leia as notas dos alunos do teclado.)

media :: Float -> Float -> Float -> Float
media p1 p2 p3 = (p1 + p2 + p3)/3

aprovado :: Float -> String
aprovado x = if x < 6.0 then "Reprovado" else "Aprovado"

main = do
 putStrLn "Informe as notas: "
 p1String <- getLine
 p2String <- getLine
 p3String <- getLine
 let p1 = (read p1String :: Float)
 let p2 = (read p2String :: Float)
 let p3 = (read p3String :: Float)
 let resultado = media p1 p2 p3
 print(aprovado resultado)
