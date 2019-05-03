maior :: Float -> Float -> Float
maior = (\x y -> if(x > y) then x else y)

main = do
 putStrLn("Digite o primeiro valor:")
 aStr <- getLine
 putStrLn("Digite o segundo valor:")
 bStr <- getLine
 putStrLn("Digite o terceiro valor:")
 cStr <- getLine

 let a = (read aStr :: Float)
 let b = (read bStr :: Float)
 let c = (read cStr :: Float)

 print(maior(maior a b)c)