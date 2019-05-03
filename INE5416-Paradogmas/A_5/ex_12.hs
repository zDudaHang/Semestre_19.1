apagar :: Int -> [t] -> [t]
apagar _ [] = []
apagar 0 (a:b) = (a:b)
apagar n (a:b) = apagar (n-1) b

main = do
 let list = (apagar 3 [1,2,3,4,5])
 print list