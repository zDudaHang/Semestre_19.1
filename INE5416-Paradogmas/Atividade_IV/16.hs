-- Crie uma função que receba dois números x e y e retorne se x é divisı́vel por y. Leia x e y do teclado.

divisivel :: Int -> Int -> Bool
divisivel 0 _ = True
divisivel _ 0 = False
divisivel x y 
 | (x == y) = True
 | otherwise = if(x `mod` y == 0) then True else False

main = do
 putStrLn "Coloque o primeiro valor: "
 xStr <- getLine
 putStrLn "Coloque o segundo valor: "
 yStr <- getLine
 let x = (read xStr :: Int)
 let y = (read yStr :: Int)
 print(divisivel x y)