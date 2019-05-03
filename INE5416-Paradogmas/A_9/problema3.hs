import Data.Function

fib :: Int -> Int
fib = fix (\f n -> if (n <= 2) 
 then n 
 else (f(n-1) + f(n-2)))

main = do
 putStrLn("Digite o valor:")
 nStr <- getLine
 let n = (read nStr :: Int)
 print(fib n)
 
