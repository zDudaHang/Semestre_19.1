type Ponto = Float -> Float -> Float

distancia :: Float -> Float -> Float -> Float -> Float -> Float -> Float
distancia = (\x1 y1 z1 x2 y2 z2 -> sqrt((x1-x2)**2 + (y1-y2)**2 + (z1-z2)**2))

main = do
 putStrLn("Coordenada x do primeiro ponto:")
 x1Str <- getLine
 putStrLn("Coordenada y do primeiro ponto:")
 y1Str <- getLine
 putStrLn("Coordenada z do primeiro ponto:")
 z1Str <- getLine
 
 putStrLn("Coordenada x do segundo ponto:")
 x2Str <- getLine
 putStrLn("Coordenada y do segundo ponto:")
 y2Str <- getLine
 putStrLn("Coordenada z do segundo ponto:")
 z2Str <- getLine

 let x1 = (read x1Str :: Float)
 let y1 = (read y1Str :: Float)
 let z1 = (read z1Str :: Float)

 let x2 = (read x2Str :: Float)
 let y2 = (read y2Str :: Float)
 let z2 = (read z2Str :: Float)

 print(distancia x1 y1 z1 x2 y2 z2)