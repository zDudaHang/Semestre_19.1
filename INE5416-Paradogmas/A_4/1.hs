-- 1. Crie uma função que receba dois números x e y e retorne x^y . Leia x e y do teclado.

exponencial :: Float -> Float -> Float
exponencial x y = x**y

main = do
 putStrLn "Informe dois valores: "
 entrada_um <- getLine
 entrada_dois <- getLine
 let x = (read entrada_um :: Float)
 let y = (read entrada_dois :: Float)
 print (exponencial x y)
