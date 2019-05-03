inverte :: [t] -> [t]
inverte [] = []
inverte [a] = [a]
inverte (a:b) = inverte b ++ [a]

main = do
 print (inverte [1..10])
 print (inverte [1,2..20])