data Ponto = Ponto2D Float Float

distanciaGrande :: Float
distanciaGrande = 1000

colineares :: Ponto -> Ponto -> Ponto -> Bool
colineares p1 p2 p3
 | (determinante p1 p2 p3 == 0) = True
 | otherwise = False

determinante :: Ponto -> Ponto -> Ponto -> Float
determinante (Ponto2D x1 y1) (Ponto2D x2 y2) (Ponto2D x3 y3) = (x1*y2 + y1*x3 + x2*y3) - (y1*x2 + x1*y3 + y2*x3)

distancia :: Ponto -> Ponto -> Float
distancia (Ponto2D x1 y1) (Ponto2D x2 y2) = ((x1-x2)**2 + (y1-y2)**2)**(1/2)

menorDistancia :: Ponto -> [Ponto] -> Float -> Float
menorDistancia _ [] _ = 0
menorDistancia p (p1:p2) min
 | (distancia p p1 < min) = menorDistancia (distancia p p1) p2
 | otherwise = distancia p p2 min

compararDistancias :: [Ponto] -> Float -> Float
compararDistancias [] min = min
compararDistancias (p1:p2) min 
 | (menorDistancia p1 p2 min) < min = compararDistancias p2 (menorDistancia p1 p2 min)
 | otherwise =  (compararDistancias p2 min)
main = do
 putStrLn("determinante:")
 let p1 = (Ponto2D 0 5)
 let p2 = (Ponto2D 1 3)
 let p3 = (Ponto2D 2 1)
 let p4 = (Ponto2D 0 0)
 let p5 = (Ponto2D 10 10)
 let pontos = [p1, p2, p3, p4, p5]
 putStrLn( show (determinante p1 p2 p3))
 putStrLn( show (colineares p1 p2 p3))
 putStrLn( show (encontrar_colineares p1 pontos))