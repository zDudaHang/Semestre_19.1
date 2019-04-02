--Crie uma função que receba dois números x e y e determine se eles são coprimos. Dois números são ditos
--coprimos se o máximo divisor comum entre eles é 1. Leia x e y do teclado.

mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b | (a == 0 && b == 0) = 0
 | (a == b) = a
 | (a < b) = mdc a (b `mod` a)
 | otherwise = mdc b (a `mod` b)

coprimos :: Int -> String
coprimos resultado = if (resultado == 1) 
 then "Sao coprimos"
 else "Nao sao coprimos"

main = do
 putStrLn "Insira o primeiro valor: "
 xStr <- getLine
 putStrLn "Insira o segundo valor: "
 yStr <- getLine
 let x = (read xStr :: Int)
 let y = (read yStr :: Int)
 let mdc_x_y = (mdc x y)
 print(coprimos mdc_x_y)