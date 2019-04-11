data Arvore = Null | No Int Arvore Arvore

minhaArvore :: Arvore
minhaArvore = No 52 (No 32 (No 32 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 64 Null Null))

minhaArvore1 :: Arvore
minhaArvore1 = No 52 (No 32 (No 32 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 64 Null Null))

minhaArvore2 :: Arvore
minhaArvore2 = No 52 (No 32 (No 32 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 66 Null Null))

minhaArvoreNula :: Arvore
minhaArvoreNula = No 50 Null Null

minhaArvoreAltura2 :: Arvore
minhaArvoreAltura2 = No 10(No 30 Null Null)(No 2 Null Null)

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

------------------------------------------------------------------
somaUm :: Int -> Int
somaUm num = num + 1

ocorrenciasElemento :: Arvore -> Int -> Int
ocorrenciasElemento Null _ = 0
ocorrenciasElemento (No n esq dir) num
 | (n == num) = (somaUm 0) + (ocorrenciasElemento esq num) + (ocorrenciasElemento dir num)
 | otherwise = (ocorrenciasElemento esq num) + (ocorrenciasElemento dir num)
------------------------------------------------------------------
maioresQueElemento :: Arvore -> Int -> Int
maioresQueElemento Null _ = 0
maioresQueElemento (No n esq dir) num
 | (n > num) = (somaUm 0) + (maioresQueElemento esq num) +( maioresQueElemento dir num)
 | otherwise = (maioresQueElemento esq num) +( maioresQueElemento dir num)
------------------------------------------------------------------
somaPares :: Arvore -> Int
somaPares Null = 0
somaPares (No n esq dir)
 | (n `mod` 2 == 0) = (somaUm 0) + (somaPares esq) + (somaPares dir)
 | otherwise = (somaPares esq) + (somaPares dir)

somaImpares :: Arvore -> Int
somaImpares Null = 0
somaImpares (No n esq dir)
 | (n `mod` 2 /= 0) = (somaUm 0) + (somaImpares esq) + (somaImpares dir)
 | otherwise = (somaImpares esq) + (somaImpares dir)

substraiParesImpares :: Arvore -> Int
substraiParesImpares Null = 0
substraiParesImpares arvore = (somaPares arvore) - (somaImpares arvore)
------------------------------------------------------------------
igual :: Arvore -> Arvore -> Bool
igual Null Null = True
igual (No n1 esq1 dir1) (No n2 esq2 dir2)
 | (n1 == n2) = (igual esq1 esq2) && (igual dir1 dir2)
 | otherwise = False
------------------------------------------------------------------
maximo :: Int -> Int -> Int
maximo a b
 | (a > b) = a
 | otherwise = b

altura :: Arvore -> Int
altura Null = 0
altura (No n esq dir) = 1 + maximo (altura esq) (altura dir)
------------------------------------------------------------------
folhas :: Arvore -> Int
folhas (No n Null Null) = 1
folhas (No n esq dir) = folhas esq + folhas dir
------------------------------------------------------------------
emOrdem :: Arvore -> [Int]
emOrdem Null = []
emOrdem (No n esq dir) = (emOrdem esq) ++ [n] ++ (emOrdem dir)
------------------------------------------------------------------
pegarPares :: [Int] -> [Int]
pegarPares lista = [x | x <- lista, x `mod` 2 == 0]

menoresQueElemento :: Arvore -> Int -> [Int]
menoresQueElemento Null _ = []
menoresQueElemento (No n esq dir) num
 | (n < num) = pegarPares([n] ++ (menoresQueElemento esq num) ++ (menoresQueElemento dir num))
 | otherwise = pegarPares((menoresQueElemento esq num) ++ (menoresQueElemento dir num))
                             
main = do putStrLn (show (somaElementos minhaArvore))
          putStrLn (show (buscaElemento minhaArvore 30))
          putStrLn (show (buscaElemento minhaArvore 55))
          putStrLn (show (minimoElemento minhaArvore))
          putStrLn "Ocorrencias:"
          putStrLn (show (ocorrenciasElemento minhaArvore 30))
          putStrLn (show (ocorrenciasElemento minhaArvore 55))
          putStrLn (show (ocorrenciasElemento minhaArvore 32))
          putStrLn "Maiores que:"
          putStrLn (show (maioresQueElemento minhaArvore 30))
          putStrLn (show (maioresQueElemento minhaArvore 100))
          putStrLn (show (maioresQueElemento minhaArvore 53))
          putStrLn "Soma pares:"
          putStrLn (show (somaPares minhaArvore))
          putStrLn "Soma impares:"
          putStrLn (show (somaImpares minhaArvore))
          putStrLn "substraiParesImpares:"
          putStrLn (show (substraiParesImpares minhaArvore))
          putStrLn "igual:"
          putStrLn (show (igual minhaArvore minhaArvore1))
          putStrLn (show (igual minhaArvore1 minhaArvore2))
          putStrLn "altura:"
          putStrLn (show (altura minhaArvore))
          putStrLn (show (altura Null))
          putStrLn (show (altura minhaArvoreAltura2))
          putStrLn "Folhas:"
          putStrLn (show (folhas minhaArvore))
          putStrLn (show (folhas minhaArvoreAltura2))
          putStrLn "Em ordem:"
          putStrLn (show (emOrdem minhaArvore))
          putStrLn (show (emOrdem minhaArvoreAltura2))
          putStrLn "MenoresQue:"
          putStrLn (show (menoresQueElemento minhaArvore 100))
          putStrLn (show (menoresQueElemento minhaArvore 1))
