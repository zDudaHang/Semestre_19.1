-- Crie uma função que receba dois valores booleanos (x, y) retorne o resultado do “ou exclusivo” (XOR) sobre eles. A função apenas deve usar os operadores &&, || e not. Leia os valores x e y do teclado.

xor :: Bool -> Bool -> Bool
xor x y = ((x && not y) || (not x && y))

main = do
 putStrLn "Informe x: "
 xString <- getLine
 let x = (read xString :: Bool)
 putStrLn "Informe y: "
 yString <- getLine
 let y = (read yString :: Bool)
 print ("O resultado foi : " ++ show(xor x y))
