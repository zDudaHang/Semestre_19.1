mapear :: (t -> y) -> [t] -> [y]
mapear _ [] = []
mapear op (a:b) = (op a) : (mapear op b)

main = do
 let list = mapear (+3) [1,2,3]
 print(list)