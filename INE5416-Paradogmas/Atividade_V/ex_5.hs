busca :: [Int] -> Int -> Bool
busca [] _ = False
busca (a:b) numero
 | (a == numero) = True
 | otherwise = busca b numero

main = do
 print (busca [1,2,3,4,5] 2)
 print(busca [1,2,3,4] 5)
 print(busca [1..100] 90)