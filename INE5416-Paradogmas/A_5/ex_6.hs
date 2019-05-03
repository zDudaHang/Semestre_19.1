busca :: [Int] -> Int -> Int
busca [] _ = 0
busca list numero = (length [x | x <- list, x == numero])

main = do
 print (busca [1,2,3,4,5] 2)
 print(busca [1,2,3,4] 5)
 print(busca [1..100] 90)
 print(busca [1,1,1,1] 1)
 print(busca [] 1)
 print(busca [2,2,3,1,2,2,5,5,5] 2)
 print(busca [2,2,3,1,2,2,5,5,5] 5)