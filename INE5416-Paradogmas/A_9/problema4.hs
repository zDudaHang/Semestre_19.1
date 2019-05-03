delta :: Float -> Float -> Float -> Float
delta = \x y z -> sqrt(-4*x*z + y*y)

bhaskara :: Float -> Float -> Float -> (Float,Float)
bhaskara = \x y z -> if(x == 0)
 then (0,0)
 else ( (-y +(delta x y z))/(2*x), (-y -(delta x y z))/(2*x)) 

main = do
 putStrLn("Coeficiente a:")
 aStr <- getLine
 putStrLn("Coeficiente b:")
 bStr <- getLine
 putStrLn("Coeficiente c:")
 cStr <- getLine
 let a = (read aStr :: Float)
 let b = (read bStr :: Float)
 let c = (read cStr :: Float)
 print(bhaskara a b c)