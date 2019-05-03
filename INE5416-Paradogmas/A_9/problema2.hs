main = do
 putStrLn("Primeira nota:")
 p1Str <- getLine
 putStrLn("Segunda nota:")
 p2Str <- getLine
 putStrLn("Terceira nota:")
 p3Str <- getLine
 let p1 = (read p1Str :: Float)
 let p2 = (read p2Str :: Float)
 let p3 = (read p3Str :: Float)
 print((\x y z-> if (x+y+z)/3 >= 6 then "Aprovado" else "Reprovado")p1 p2 p3)
