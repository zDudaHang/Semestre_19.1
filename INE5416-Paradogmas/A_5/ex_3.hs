menor:: [Int] -> Int
menor [] = 0
menor [x] = x
menor (a:b) = minimo a (menor b)

minimo:: Int -> Int -> Int
minimo a b 
 | a < b = a
 | otherwise = b

main = do
 print(menor [1..100])

