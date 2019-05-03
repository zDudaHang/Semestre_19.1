--- Crie um novo tipo Ponto, usando data, que pode ser um ponto 2D ou um ponto 3D. Depois, crie uma função que receba dois pontos (necessariamente ambos sendo 2D ou ambos sendo 3D), e retorne a distância entre eles.

data Ponto = DuasDimensoes Float Float | TresDimensoes Float Float Float

distancia :: Ponto -> Ponto -> Float
distancia (DuasDimensoes x1 y1)(DuasDimensoes x2 y2) = sqrt ((x2-x1)**2 + (y2-y1)**2)
distancia (TresDimensoes x1 y1 z1)(TresDimensoes x2 y2 z2) = sqrt ((x2-x1)**2 + (y2-y1)**2 + (z2-z1)**2)

main = do
 let p1 = (DuasDimensoes 5 2)
 let p2 = (DuasDimensoes 2 3)
 let p3 = (TresDimensoes 5 6 7)
 let p4 = (TresDimensoes 9 4 2)
 putStrLn ( show (distancia p1 p2))
 putStrLn ( show (distancia p3 p4))
