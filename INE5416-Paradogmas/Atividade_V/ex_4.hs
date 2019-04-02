diferencaMaiorMenor :: [Int] -> Int
diferencaMaiorMenor list
 | (list == []) = 0
 | otherwise = (maior list) - (menor list)

menor :: [Int] -> Int
menor [] = 0
menor [x] = x
menor (a:b) = minimo a (menor b)

minimo :: Int -> Int -> Int
minimo a b 
 | a < b = a
 | otherwise = b

maior :: [Int] -> Int
maior [] = 0
maior [x] = x
maior (a:b) = maximo a (maior b)

maximo :: Int -> Int -> Int
maximo a b
 | a > b = a
 | otherwise = b

main = do
 print(menor [1..100])
 print(maior [1..100])
 print(diferencaMaiorMenor [1..100])
