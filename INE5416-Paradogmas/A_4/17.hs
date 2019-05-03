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

main = do
 putStrLn "Digite um número: "
 nStr <- getLine
 let n = (read nStr :: Int)
 print(eh_primo n)