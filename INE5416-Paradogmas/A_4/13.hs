-- 13. Crie uma função que receba dois números x e y e retorne o mı́nimo múltiplo comum (DICA: use a função
-- o máximo divisor comum já criada). Leia x e y do teclado.

-- Crie uma função que receba dois números x e y e retorne o máximo divisor comum (DICA: pesquise sobre
-- o Algoritmo de Euclides). Leia x e y do teclado.

mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b | (a == 0 && b == 0) = 0
 | (a == b) = a
 | (a < b) = mdc a (b `mod` a)
 | otherwise = mdc b (a `mod` b)

mmc :: Int -> Int -> Int
mmc a b | (a == 0) = 0
 | (b == 0) = 0
 | (a == b) = a
 | otherwise = (a*b) `div` (mdc a b)

main = do
 putStrLn "Insira o primeiro valor: "
 xStr <- getLine
 putStrLn "Insira o segundo valor: "
 yStr <- getLine
 let x = (read xStr :: Int)
 let y = (read yStr :: Int)
 print(mmc x y)