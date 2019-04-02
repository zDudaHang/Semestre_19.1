-- Crie uma função que resolva uma equação de segundo grau da forma ax 2 + bx + c utilizando a fórmula
-- de Bhaskara. Leia os coeficientes a, b e c do teclado.

delta :: Float -> Float -> Float -> Float
delta a b c = (b^2 - (4*a*c))**(1/2)

bhaskara :: Float -> Float -> Float -> (Float, Float)
bhaskara delta a b = ((-b - delta)/(2*a),(-b + delta)/(2*a))

main = do 
 putStrLn "Digite os coeficientes: "
 putStrLn "a:"
 aString <- getLine
 putStrLn "b:"
 bString <- getLine
 putStrLn "c:"
 cString <- getLine
 let a = (read aString :: Float)
 let b = (read bString :: Float)
 let c = (read cString :: Float)
 let resultado_delta = delta a b c
 print("Raizes: " ++ show(bhaskara resultado_delta a b))