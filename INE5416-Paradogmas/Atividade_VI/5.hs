type Raio = Float
type Base = Float
type Altura = Float

data Forma = Circulo Raio | Retangulo Base Altura | Triangulo Base Altura

newtype Circulo_NT r = Circulo_NT Raio --deriving (Show)

newtype Retangulo_NT base altura = Retangulo_NT (Base, Altura) --deriving (Show)

newtype Triangulo_NT base altura = Triangulo_NT (Base, Altura) --deriving (Show)

area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a
area (Triangulo b a) = (b*a)/2

area_cnt  :: (Circulo_NT r) -> Float
area_cnt (Circulo_NT raio) = pi * raio * raio

area_rnt :: (Retangulo_NT base altura) -> Float
area_rnt (Retangulo_NT (b,a)) = b * a

area_tnt :: (Triangulo_NT base altura) -> Float
area_tnt (Triangulo_NT (b,a)) = (b*a)/2

main = do
 let c1 = (Circulo 1)
 let r1 = (Retangulo 1 1)
 let t1 = (Triangulo 1 1)

 let c2 = (Circulo_NT 1)
 let r2 = (Retangulo_NT (1,1))
 let t2 = (Triangulo_NT (1,1))

 putStrLn "Resultados com data:"
 putStrLn( show(area c1))
 putStrLn( show(area r1))
 putStrLn( show(area t1))
 
 putStrLn "Resultados com newtype:"
 putStrLn( show(area_cnt c2))
 putStrLn( show(area_rnt r2))
 putStrLn( show(area_tnt t2))


