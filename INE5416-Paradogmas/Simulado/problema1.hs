mesmosElementos:: [Int] -> [Int] -> Bool
mesmosElementos [] [] = False
mesmosElementos (a:b) (x0:x1)
 | (a == x0) = True
 | otherwise = mesmosElementos b x1

main = do
 let l1 = [1,2,3,4,1,1,1,1]
 let l2 = [0,0,0,0,0,0,0,1]
 let l3 = [0,0,0,0,0,0,0,0]
 print(mesmosElementos l1 l2)
 print(mesmosElementos l1 l3)