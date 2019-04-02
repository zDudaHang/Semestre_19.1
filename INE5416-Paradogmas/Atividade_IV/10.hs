--Crie uma função que receba 3 valores numéricos (a, b, c) e retorne o maior deles. Não utilize nenhuma
--forma de ordenação. Leia os valores a, b, c do teclado.

maximo :: Float -> Float -> Float
maximo a b = if (a > b) then a else b

main = do
 putStrLn "Digite três valores: "
 putStrLn "Primeiro: "
 aStr <- getLine
 putStrLn "Segundo: "
 bStr <- getLine
 putStrLn "Terceiro: "
 cStr <- getLine
 let a = (read aStr :: Float)
 let b = (read bStr :: Float)
 let c = (read cStr :: Float) 
 let resultado_max = maximo a b
 print(maximo resultado_max c)