primeiros :: Int -> [t] -> [t]
primeiros _ [] = []
primeiros 0 _ = []
primeiros n (a:b) = a : primeiros (n-1) b

main = do
 let list = (primeiros 3 [1,2,3,4,5])
 print list