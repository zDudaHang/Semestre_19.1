comprimento :: [Int] -> Int
comprimento [] = 0
comprimento (_:b) = 1 + comprimento b

soma:: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b

media :: [Int] -> Float
media [] = 0
media l = (fromIntegral (soma l))/(fromIntegral(comprimento l))

main = do
 let l1 = [7,3,5]
 let l2 = [8,8,8]
 print (media l1)
 print(media l2)

