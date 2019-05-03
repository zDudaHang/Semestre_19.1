filtrar :: (t -> Bool) -> [t] -> [t]
filtrar _ [] = []
filtrar op list = [x | x <- list, op x]

main = do
 let list = (filtrar (>=2) [1,2,3,4,5,6])
 print(list)
 let list2 = (filtrar (<0) [1,2,3,4,5,6,-10,-11])
 print(list2)