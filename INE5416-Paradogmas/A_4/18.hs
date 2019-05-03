operador :: Char -> Int -> Int -> Float
operador op x y 
 | op == '+' = (fromIntegral x) + (fromIntegral y)
 | op == '-' = (fromIntegral x) - (fromIntegral y)
 | op == '*' = (fromIntegral x) * (fromIntegral y)
 | otherwise = (fromIntegral x) / (fromIntegral y)

main = do
 putStrLn "Digite o operador: "
 opStr <- getChar
 _ <- getLine
 putStrLn "Digite o primeiro valor: "
 xStr <- getLine
 putStrLn "Digite o segundo valor: "
 yStr <- getLine
 let x = (read xStr :: Int)
 let y = (read yStr :: Int)
 print (operador opStr x y)