--Crie uma função que receba a base e a altura de um triângulo e calcule a área do mesmo. Leia a base e a altura do teclado.

area :: Float -> Float -> Float
area base altura = (base * altura)/2

main = do
 putStrLn "Informe a base e a altura do triângulo: "
 baseString <- getLine
 alturaString <- getLine
 let base = (read baseString :: Float)
 let altura = (read alturaString :: Float)
 print("A area do triangulo eh " ++ show(area base altura))
