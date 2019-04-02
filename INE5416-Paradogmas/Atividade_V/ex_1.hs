soma:: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b

main = do
 let l1 = [10,10]
 print(soma l1)
 let l2 = [100,-100]
 print(soma l2)

