-- Altere nosso exemplo da forma e inclua uma nova forma (Triangulo) no construtor do tipo Forma e também calcule sua área.
data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float

area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b h) = b * h
area (Triangulo b h) = (b*h)/2

main = do
 let t1 = (Triangulo 1 1)
 let r1 = (Retangulo 1 1)
 let c1 = (Circulo 1)
 putStrLn( show (area t1))
 putStrLn( show (area r1))
 putStrLn( show (area c1))
