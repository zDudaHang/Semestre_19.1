--Crie uma função que receba três números x, y e z e retorne o máximo divisor comum (DICA: apenas
--modifique o algoritmo anterior). Leia x, y e z do teclado.

mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b | (a == 0 && b == 0) = 0
 | (a == b) = a
 | (a < b) = mdc a (b `mod` a)
 | otherwise = mdc b (a `mod` b)

main = do
 putStrLn "Insira o primeiro valor: "
 xStr <- getLine
 putStrLn "Insira o segundo valor: "
 yStr <- getLine
 putStrLn "Insira o terceiro valor: "
 zStr <- getLine
 let x = (read xStr :: Int)
 let y = (read yStr :: Int)
 let z = (read zStr :: Int)
 let mdc_x_y = mdc x y
 print(mdc mdc_x_y z)