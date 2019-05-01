import Data.List (sort)

--------------------------------------------------------------------------------------------------------------------- TYPES

type Matriz = [Linha]

type Linha = [Int]

type Coluna = [Int]

type Posicao = (Int,Int)

type Valor = Int

--------------------------------------------------------------------------------------------------------------------- MATRIZES

m1 :: Matriz
m1 = [[0,1,0],[1,0,0],[0,0,1]]

m2 :: Matriz
m2 = [[2,2,2],[3,3,3],[1,22,1]]

m3 :: Matriz
m3 = [[2,7,6],[9,5,1],[4,3,8]]

m4 :: Matriz
m4 = [[0,0,0,1],[0,1,0,0],[1,0,0,0],[0,0,1,0]]

m5 :: Matriz
m5 = [[0,12,12],[16,10,0],[8,0,0]]

m6 :: Matriz
m6 = [[0,468,0],[0,522,414],[441,0,549]]

sudoku :: Matriz
sudoku = [
 [1, 3, 2, 5, 7, 9, 4, 6, 8],
 [4, 9, 8, 2, 6, 1, 3, 7, 5],
 [7, 5, 6, 3, 8, 4, 2, 1, 9],
 [6, 4, 3, 1, 5, 8, 7, 9, 2],
 [5, 2, 1, 7, 9, 3, 8, 4, 6],
 [9, 8, 7, 4, 2, 6, 5, 3, 1],
 [2, 1, 4, 9, 3, 5, 6, 8, 7],
 [3, 6, 5, 8, 1, 7, 9, 2, 4],
 [8, 7, 9, 6, 4, 2, 1, 5, 3]
 ]

sudoku_invalida :: Matriz
sudoku_invalida = [
 [1, 3, 2, 5, 7, 9, 4, 6, 8],
 [4, 9, 8, 2, 6, 1, 3, 7, 5],
 [7, 5, 6, 3, 8, 4, 2, 1, 9],
 [6, 4, 3, 1, 5, 8, 7, 9, 2],
 [5, 2, 1, 7, 9, 3, 8, 4, 6],
 [9, 8, 7, 4, 2, 6, 5, 3, 1],
 [2, 1, 4, 9, 3, 5, 6, 8, 7],
 [3, 6, 5, 8, 1, 7, 9, 2, 4],
 [8, 7, 9, 6, 4, 2, 1, 5, 8]
 ]

sudoku_preencher :: Matriz
sudoku_preencher = [
 [1, 0, 2, 0, 7, 9, 4, 6, 8],
 [4, 9, 8, 2, 6, 1, 3, 7, 5],
 [7, 5, 6, 3, 8, 4, 2, 1, 9],
 [6, 4, 3, 1, 0, 8, 7, 9, 2],
 [5, 2, 1, 7, 9, 3, 8, 4, 6],
 [9, 0, 7, 4, 2, 6, 5, 3, 1],
 [2, 1, 4, 9, 3, 0, 6, 8, 7],
 [3, 6, 5, 8, 1, 7, 9, 2, 4],
 [8, 7, 0, 6, 4, 2, 1, 0, 3]
 ]

nums_sudoku :: [Int]
nums_sudoku = [1..9]

indices :: [Int]
indices = [0,1,2,9,10,11,18,19,20]

--------------------------------------------------------------------------------------------------------------------- QUESTÃO A

somaElementos :: Matriz -> Int
somaElementos [] = 0
somaElementos (linha0:linha1) = somaLinha linha0 + somaElementos linha1

somaLinha :: Linha -> Int
somaLinha [] = 0
somaLinha (x0:x1) = x0 + somaLinha x1

--------------------------------------------------------------------------------------------------------------------- QUESTÃO B

somaDuas :: Matriz -> Matriz -> Matriz
somaDuas [] [] = []
somaDuas (l0_m1:l1_m1) (l0_m2:l1_m2) = (somaDuasLinhas l0_m1 l0_m2):(somaDuas l1_m1 l1_m2)

somaDuasLinhas :: Linha -> Linha -> Linha
somaDuasLinhas [] [] = []
somaDuasLinhas (l0_0:l1_0) (l0_1:l1_1) = (l0_0 + l0_1) : (somaDuasLinhas l1_0 l1_1)

--------------------------------------------------------------------------------------------------------------------- QUESTÃO C

ehQuadradoMagico :: Matriz -> Bool
ehQuadradoMagico [] = False
ehQuadradoMagico matriz = (cond1 matriz) && (cond2 matriz) && (cond3 matriz) && (condfinal matriz)

cond1 :: Matriz -> Bool
cond1 (l0:l1) = if ((somaLinhas (l0:l1)) == (length (l0:l1) * somaLinha l0)) then True else False

cond2 :: Matriz -> Bool
cond2 matriz = if( (somaColunas (getColunas matriz)) == (length matriz) * somaLinha (listarColuna matriz 0) ) then True else False

cond3 :: Matriz -> Bool
cond3 matriz = if ((somaDiagonalPrincipal matriz) == (somaDiagonalSecundaria matriz)) then True else False

condfinal :: Matriz -> Bool
condfinal [] = False
condfinal matriz
 | (((somaLinha (getLinha matriz 0 0)) == (somaLinha (listarColuna matriz 0)) && ((somaLinha (getLinha matriz 0 0) == somaDiagonalPrincipal matriz)))) = True
 | otherwise = False


--------------------------------------------------------------------------------------------------------------------- QUESTÃO D


cond1_permutacao :: Matriz -> Bool
cond1_permutacao [] = False
cond1_permutacao matriz = if ((qtdZeroColuna matriz) == (qtdZeroMatrizLinha matriz)) then True else False

cond2_permutacao :: Matriz -> Bool
cond2_permutacao [] = False
cond2_permutacao matriz = if ((qtdUmMatriz matriz) == (length matriz)) then True else False

ehMatrizPermutacao :: Matriz -> Bool
ehMatrizPermutacao matriz = (cond1_permutacao matriz) && (cond2_permutacao matriz)

--------------------------------------------------------------------------------------------------------------------- QUESTÃO E


backtrackEhQuadradoMagico :: Matriz -> Matriz
backtrackEhQuadradoMagico matriz = do
 let posicoes = getZeros matriz
 let valores = replicate (length posicoes) 1
 let m = replacePos matriz valores posicoes
 if (ehQuadradoMagico m) then m else (backtrackEhQuadradoMagicoAux matriz valores posicoes)

backtrackEhQuadradoMagicoAux :: Matriz -> [Valor] -> [Posicao] -> Matriz
backtrackEhQuadradoMagicoAux matriz valores posicoes | (ehQuadradoMagico (replacePos matriz valores posicoes)) = (replacePos matriz valores posicoes)
 | otherwise = (backtrackEhQuadradoMagicoAux matriz (incrementa valores) posicoes)

--------------------------------------------------------------------------------------------------------------------- QUESTÃO F

valida_sudoku :: Matriz -> Bool
valida_sudoku [] = False
valida_sudoku matriz = cond1_sudoku matriz && cond2_sudoku matriz && cond3_sudoku matriz

cond3_sudoku :: Matriz -> Bool
cond3_sudoku [] = False
cond3_sudoku matriz = cond3_aux (getColunas matriz)

cond3_aux :: [Coluna] -> Bool
cond3_aux [] = True
cond3_aux (c0:c1) = compareLists c0 nums_sudoku && cond3_aux c1

cond2_sudoku :: Matriz -> Bool
cond2_sudoku [] = True
cond2_sudoku (l0:l1) = (compareLists l0 nums_sudoku) && (cond2_sudoku l1)

cond1_sudoku :: Matriz -> Bool
cond1_sudoku [] = False
cond1_sudoku matriz = if ( verificarMatrizesContagem (getSub_3x3(matriz)) == 81) then True else False


--------------------------------------------------------------------------------------------------------------------- AUXILIARES

somaColunasMatriz :: Matriz -> Int
somaColunasMatriz [] = 0
somaColunasMatriz matriz = somaColunas (getColunas matriz)

somaColunas :: [Coluna] -> Int
somaColunas [] = 0
somaColunas (c0:c1) = somaLinha c0 + somaColunas c1

somaLinhas :: Matriz -> Int
somaLinhas [] = 0
somaLinhas (l0:l1) = somaLinha l0 + somaLinhas l1

fazLista :: Int -> [Int]
fazLista n = [1..n*n]

percorrerDiagonalPrincipal :: Matriz -> Int -> Linha
percorrerDiagonalPrincipal [] _ = []
percorrerDiagonalPrincipal (l0:l1) coluna = [(getElementoLinha l0 coluna 0)] ++ (percorrerDiagonalPrincipal l1 (coluna+1))

-- [0,2] -> [1,1] -> [2,0]
-- [l,c] -> [l+1, c-1] -> [l+1, c-1]

percorrerDiagonalSecundaria :: Matriz -> Int -> Linha
percorrerDiagonalSecundaria [] _ = []
percorrerDiagonalSecundaria (l0:l1) coluna = [(getElementoLinha l0 coluna 0)] ++ (percorrerDiagonalSecundaria l1 (coluna-1))

somaDiagonalPrincipal :: Matriz ->  Int
somaDiagonalPrincipal matriz = somaLinha(percorrerDiagonalPrincipal matriz 0)

somaDiagonalSecundaria :: Matriz -> Int
somaDiagonalSecundaria matriz = somaLinha(percorrerDiagonalSecundaria matriz (length matriz - 1))

somaCadaLinha :: Matriz -> [Int]
somaCadaLinha (l0:l1) = [(somaLinha l0)] ++ somaCadaLinha l1

--[ (0,0) (0,1) (0,2) ] 
--[ (1,0) (1,1) (1,2) ] 
--[ (2,0) (2,1) (2,2) ]

getColunas :: Matriz -> [Coluna]
getColunas matriz = (listarColunas matriz (listarIndices (length matriz - 1)))

getLinhas :: Matriz -> [Linha]
getLinhas [] = []
getLinhas (l0:l1) = [l0] ++ getLinhas l1

listarIndices :: Int -> [Int]
listarIndices n = [0..n]

listarColuna :: Matriz -> Int -> Coluna
listarColuna [] _ = []
listarColuna (l0:l1) coluna = [getElementoLinha l0 coluna 0] ++ listarColuna l1 coluna

listarColunas :: Matriz -> [Int] -> [Coluna]
listarColunas [] _ = []
listarColunas _ [] = []
listarColunas matriz (i0:i1) = [(listarColuna matriz i0)] ++ listarColunas matriz i1

count :: [Int] -> Int -> Int
count [] _ = 0
count (a:b) num
 | (a==num) = 1 + count b num
 | otherwise = count b num

procurarElementos :: [Int] -> [Int] -> Int
procurarElementos [] _ = 0
procurarElementos (a:b) list = count list a + procurarElementos b list

verificarLista :: Matriz -> Int -> Int
verificarLista matriz n = (procurarElementos (concat (getLinhas matriz)) (fazLista n))

contemElementos:: Matriz -> Bool
contemElementos matriz = if (verificarLista matriz (length matriz)) == (length matriz * length matriz) then True else False



quantidadeUmLinha :: Linha -> Int
quantidadeUmLinha [] = 0
quantidadeUmLinha linha = count linha 1

quantidadeZeroLinha :: Linha -> Int
quantidadeZeroLinha [] = 0
quantidadeZeroLinha linha = count linha 0

quantidadeZeroColuna :: Matriz -> Int -> Int
quantidadeZeroColuna [] _ = 0
quantidadeZeroColuna matriz coluna = count (listarColuna matriz coluna) 0

qtdUmMatriz :: Matriz -> Int
qtdUmMatriz [] = 0
qtdUmMatriz (l0:l1) = quantidadeUmLinha l0 + qtdUmMatriz l1

qtdZeroMatrizLinha  :: Matriz -> Int
qtdZeroMatrizLinha [] = 0
qtdZeroMatrizLinha (l0:l1) = quantidadeZeroLinha l0 + qtdZeroMatrizLinha l1

qtdZeroMatrizColuna  :: Matriz -> [Int] -> Int
qtdZeroMatrizColuna _ [] = 0
qtdZeroMatrizColuna [] _ = 0
qtdZeroMatrizColuna matriz (i0:i1) =  (quantidadeZeroColuna matriz i0) + qtdZeroMatrizColuna matriz i1

qtdZeroColuna:: Matriz -> Int
qtdZeroColuna [] = 0
qtdZeroColuna matriz = (qtdZeroMatrizColuna matriz (listarIndices (length matriz -1)))

incrementa :: [Int] -> [Int]
incrementa[] = []
incrementa(a:b) 
 | (a < 100) = ((a+1):b)
 | otherwise = 1:(incrementa b)

getZeros :: Matriz -> [Posicao]
getZeros [] = []
getZeros matriz = getZerosAux matriz (listarIndices (length matriz -1))

getZerosAux :: Matriz -> [Int] -> [Posicao]
getZerosAux [] _ = []
getZerosAux (l0:l1) (i0:i1) = (find l0 i0 0 0) ++ getZerosAux l1 i1

replacePos :: Matriz -> [Valor] -> [Posicao] -> Matriz
replacePos matriz [] [] = matriz
replacePos [] _ _ = []
replacePos _ [] _ = []
replacePos _ _ [] = []
replacePos matriz (v1:v2) (pos1:pos2) = do
 let linha = getX pos1 -- (0,2) -> linha = 0
 let coluna = getY pos1 -- (0,2) -> Coluna = 2
 let l = getLinha matriz linha 0 -- l = getLinha matriz 2 0
 let lnova = setElementoLinha l coluna 0 v1
 let m = setLinha matriz lnova linha 0
 replacePos m v2 pos2 

getSub_3x3 :: Matriz -> [Matriz]
getSub_3x3 [] = []
getSub_3x3 matriz = splitMatrix matriz indices

getSub_3x3Aux :: Matriz -> Int -> Matriz
getSub_3x3Aux [] _ = []
getSub_3x3Aux matriz linha = do
 let linhas = splitMatrixInLines matriz
 let l0 = linhas !! linha
 let l1 = linhas !! (linha + 3)
 let l2 = linhas !! (linha + 6)
 [l0] ++ [l1] ++ [l2]

splitMatrix :: Matriz -> [Int] -> [Matriz]
splitMatrix [] _ = []
splitMatrix _ [] = []
splitMatrix matriz (i0:i1) = [getSub_3x3Aux matriz i0] ++ splitMatrix matriz i1

splitMatrixInLines :: Matriz -> [Linha]
splitMatrixInLines [] = []
splitMatrixInLines (l0:l1) = splitLine l0 ++ splitMatrixInLines l1

splitLine :: Linha -> [Linha]
splitLine linha = [fst(splitAt 3 linha)] ++ [fst(splitAt 3(snd(splitAt 3 linha)))] ++ [snd(splitAt 3(snd(splitAt 3 linha)))]

verificarSubMatrizContagem :: Matriz -> Int
verificarSubMatrizContagem matriz = (procurarElementos (concat matriz) nums_sudoku)

verificarMatrizesContagem :: [Matriz] -> Int
verificarMatrizesContagem [] = 0
verificarMatrizesContagem (m0:m1) = verificarSubMatrizContagem m0 + verificarMatrizesContagem m1

compareLists :: [Int] -> [Int] -> Bool
compareLists l1 l2 = (sort l1) == (sort l2)
getLinha :: Matriz -> Int -> Int -> Linha
getLinha [] _ _ = []
getLinha (l0:l1) linha i 
 | (i == linha) = l0
 | (i > linha) = []
 | otherwise = getLinha l1 linha (i+1)

getX :: Posicao -> Valor
getX (x,_) = x

getY :: Posicao -> Valor
getY (_,y) = y

find :: Linha -> Int -> Int ->  Int -> [(Int, Int)]
find [] _ _ _ = []
find (a0:a1) linha coluna num
 | (a0 == num) = [(linha,coluna)] ++ find a1 linha (coluna+1) num
 | otherwise = find a1 linha (coluna+1) num

setElemento :: Matriz -> Int -> Int -> Int -> Valor -> Matriz
setElemento matriz linha coluna j x = (setLinha matriz (setElementoAux matriz linha coluna 0 x) linha 0)

setElementoAux :: Matriz -> Int -> Int -> Int -> Valor -> Linha
setElementoAux matriz linha coluna j x = (setElementoLinha (getLinha matriz linha 0) coluna 0 x)

setElementoLinha :: Linha -> Int -> Int -> Valor -> Linha
setElementoLinha (a0:a1) coluna j x
 | (j==coluna) = x:a1
 | (j>coluna) = []
 | otherwise = a0:(setElementoLinha a1 coluna (j+1) x)

getElementoLinha :: Linha -> Int -> Int -> Valor
getElementoLinha (a0:a1) coluna j 
 | (j==coluna) = a0
 | otherwise = getElementoLinha a1 coluna (j+1)

getElemento :: Matriz -> Int -> Int -> Valor
getElemento matriz linha coluna = (getElementoLinha (getLinha matriz linha 0) coluna 0)


setLinha :: Matriz -> Linha -> Int -> Int -> Matriz
setLinha (l0:l1) lnova linha i
 | (i==linha) = lnova:l1
 | otherwise = l0:(setLinha l1 lnova linha (i+1))


main = do
 putStrLn("---> Soma dos elementos de m1:")
 putStrLn(show(somaElementos m1))
 putStrLn("---> Soma de m1 e m2:")
 putStrLn(show(somaDuas m1 m2))
 putStrLn("---> M3 é um quadrado mágico? ")
 putStrLn(show(ehQuadradoMagico m3))
 putStrLn("---> M1 é um quadrado mágico? ")
 putStrLn(show(ehQuadradoMagico m1))
 putStrLn("---> M2 é um quadrado mágico? ")
 putStrLn(show(ehQuadradoMagico m2))
 putStrLn("---> M4 é uma matriz de permutacao ?")
 putStrLn(show(ehMatrizPermutacao m4))
 putStrLn("---> M1 é uma matriz de permutacao ?")
 putStrLn(show(ehMatrizPermutacao m1))
 putStrLn("---> M2 é uma matriz de permutacao ?")
 putStrLn(show(ehMatrizPermutacao m2))
 putStrLn("---> BackTrack do Quadrado Mágico (Questão e):")
 putStrLn(show(backtrackEhQuadradoMagico m5))
 putStrLn("---> Sudoku válido ?")
 print(valida_sudoku sudoku)
 putStrLn("---> Sudoku válido ?")
 print(valida_sudoku sudoku_invalida)


 