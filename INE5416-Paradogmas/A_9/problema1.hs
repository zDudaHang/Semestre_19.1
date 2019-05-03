xor :: Bool -> Bool -> Bool
xor True False = True
xor False True = True
xor True True = False
xor False False = False

main = do
 putStrLn("Digite o primeiro valor:")
 aStr <- getLine
 putStrLn("Digite o segundo valor:")
 bStr <- getLine
 let a = (read aStr :: Bool)
 let b = (read bStr :: Bool)

 print((\x y -> xor x y)a b)
