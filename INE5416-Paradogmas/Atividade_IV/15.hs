list_multiplos :: Int -> [Int]
list_multiplos 0 = []
list_multiplos 1 = [1]
list_multiplos n = [x | x <- [1..n], (n `mod` x == 0)]

eh_primo:: Int -> Bool
eh_primo 0 = False
eh_primo 1 = True
eh_primo n = if(length (list_multiplos n) == 2) 
 then True
 else False

mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b 
 | (a == 0 && b == 0) = 0
 | (a == b) = a
 | (a < b) = mdc a (b `mod` a)
 | otherwise = mdc b (a `mod` b)

coprimos :: Int -> Int -> Bool
coprimos a b = if ((mdc a b) == 1) 
 then True
 else False

euler :: Int -> Int
euler 1 = 0
euler 0 = 0
euler n = (length [x | x <- [1..(n-1)], coprimos x n])

main = do
 putStrLn "Digite um valor: "
 nStr <- getLine
 let n = (read nStr :: Int)
 print (euler n)
