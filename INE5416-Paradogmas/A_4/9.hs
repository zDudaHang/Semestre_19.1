-- Crie uma função que dados dois pontos no espaço 3D, (x1, y1, z1) e (x2, y2, z2), compute a distância
-- entre eles. Leia as posições dos pontos do teclado.

delta_quadrado :: Float -> Float -> Float
delta_quadrado x y = (x-y)^2

distancia :: Float -> Float -> Float -> Float
distancia delta_x delta_y delta_z = (delta_x + delta_y + delta_z)**(1/2)

main = do
 putStrLn "Coloque as coordenadas:"
 putStrLn "x1:"
 x1Str <- getLine
 putStrLn "y1:"
 y1Str <- getLine
 putStrLn "z1:"
 z1Str <- getLine
 putStrLn "x2:"
 x2Str <- getLine
 putStrLn "y2:"
 y2Str <- getLine
 putStrLn "z2:"
 z2Str <- getLine

 let x1 = (read x1Str :: Float)
 let y1 = (read y1Str :: Float)
 let z1 = (read z1Str :: Float)
 let x2 = (read x2Str :: Float)
 let y2 = (read y2Str :: Float)
 let z2 = (read z2Str :: Float)
 
 let delta_x = delta_quadrado x1 x2
 let delta_y = delta_quadrado y1 y2
 let delta_z = delta_quadrado z1 z2
 print(distancia delta_x delta_y delta_z)
 