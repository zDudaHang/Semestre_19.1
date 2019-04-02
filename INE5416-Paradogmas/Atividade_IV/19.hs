coprimos :: Int -> Int -> Bool
coprimos a b = if ((mdc a b) == 1) 
 then True
 else False

list_multiplos :: Int -> [Int]
list_multiplos 0 = []
list_multiplos 1 = [1]
list_multiplos n = [x | x <- [1..n], (n `mod` x == 0)]

mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b 
 | (a == 0 && b == 0) = 0
 | (a == b) = a
 | (a < b) = mdc a (b `mod` a)
 | otherwise = mdc b (a `mod` b)

eh_primo:: Int -> Bool
eh_primo 0 = False
eh_primo 1 = True
eh_primo n = if(length (list_multiplos n) == 2) 
 then True
 else False

euler :: Int -> [Int]
euler 1 = []
euler 0 = []
euler n = [x | x <- [1..(n-1)], coprimos x n && (x > 2)]

goldbach :: [Int] -> Int -> Int
goldbach _ 0 = 0
goldbach _ 1 = 0
goldbach _ 2 = 0
goldbach [] _ = 0
goldbach (a:b) n 
 | (n `mod` 2 /= 0) = 0
 | eh_primo (n - a) = a
 | otherwise = goldbach b n

main = do
 putStrLn "Digite um número: "
 nStr <- getLine
 let n = (read nStr :: Int)
 let primos = (euler n)
 print (goldbach primos n)