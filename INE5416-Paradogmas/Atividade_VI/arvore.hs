data Arvore = Null | No Int Arvore Arvore

minhaArvore :: Arvore
minhaArvore = No 52 (No 57 (No 12 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 51 Null Null))

contador :: Int -> Int
contador n = n+1

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

buscaElemento :: Arvore -> Int -> Bool
buscaElemento Null _ = False
buscaElemento (No n esq dir) x 
    | (n == x) = True                           
    | otherwise = (buscaElemento esq x) || (buscaElemento dir x)

limiteSup :: Int
limiteSup = 1000 --Define um limite superior para o maior número

minimo :: Int -> Int -> Int
minimo x y | (x < y) = x
           | otherwise = y

minimoElemento :: Arvore -> Int
minimoElemento Null = limiteSup 
minimoElemento (No n esq dir) = 
    minimo n (minimo (minimoElemento esq) (minimoElemento dir))

ocorrenciasElemento :: Arvore -> Int -> Int
ocorrenciasElemento Null _ = 0
ocorrenciasElemento (No n esq dir) numero
 | (n == numero) = (contador 0) +  (ocorrenciasElemento esq numero) + (ocorrenciasElemento dir numero)
 | otherwise = (ocorrenciasElemento esq numero) + (ocorrenciasElemento dir numero)

maioresQueElemento :: Arvore -> Int -> Int
maioresQueElemento Null _ = 0
maioresQueElemento (No n esq dir) numero
 | (n > numero) = (contador 0) + (maioresQueElemento esq numero) + (maioresQueElemento dir numero)
 | otherwise = (maioresQueElemento esq numero) + (maioresQueElemento dir numero)

quantidade :: Arvore -> Int
quantidade Null = 0
quantidade (No n esq dir) = (contador 0) + (quantidade esq) + (quantidade dir)

mediaElementos :: Arvore -> Float
mediaElementos Null = 0
mediaElementos arvore = (fromIntegral (somaElementos arvore))/(fromIntegral(quantidade arvore))

add :: Int -> [Int] -> [Int]
add x [] = [x]
add x lista = lista ++ [x]

elementos :: Arvore -> [Int]
elementos Null = []
elementos (No n esq dir) = (add n []) ++ (elementos esq) ++ (elementos dir)
                               
main = do 
 putStrLn (show (somaElementos minhaArvore))
 putStrLn (show (buscaElemento minhaArvore 30))
 putStrLn (show (buscaElemento minhaArvore 55))
 putStrLn (show (minimoElemento minhaArvore))
 putStrLn "OcorrenciasElemento: "
 putStrLn (show (ocorrenciasElemento minhaArvore 55))
 putStrLn "MaioresQueElemento: "
 putStrLn (show (maioresQueElemento minhaArvore 2))
 putStrLn "Quantidade de elementos na arvore: "
 putStrLn (show (quantidade minhaArvore))
 putStrLn "mediaElementos: "
 putStrLn (show (mediaElementos minhaArvore))
 putStrLn "elementos: "
 putStrLn (show (elementos minhaArvore))
