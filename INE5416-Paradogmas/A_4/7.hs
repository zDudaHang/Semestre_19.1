--Crie uma função que compute o n-ésimo número de Fibonacci. Leia n do teclado.

fib :: Int -> Int
fib 1 = 1
fib 2 = 1
fib n = fib(n-1) + fib(n-2)

main = do
 putStrLn "Digite um valor: "
 nString <- getLine
 let n = (read nString :: Int)
 print(fib n)