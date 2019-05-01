main = do
 print([0,2,4,6,100,55,7,3,2])
 print(map (\x -> if (x `mod` 2 == 0) then True else False) [0,2,4,6,100,55,7,3,2])