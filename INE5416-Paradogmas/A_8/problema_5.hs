import Operators

main = do

  -- Como (+++) tem uma precedência maior que (***) a expressão equivalente seria: (1 *** (2 +++ 1)) = 1 *** (2 + 1 + 1) = 2*1*4 = 8
  print(1 *** 2 +++ 1)

  -- Como (!) tem a maior precedência, a expressão equivalente seria: ((1 ! 2) # 1) = (-1 # 1) = 1
  print(1 ! 2 # 1)

  -- A expressão equivalente seria, considerando a precedência: (((1 ! 2) // 0) # 1) = ((-1 // 0) # 1) = (-1 # 1) = 1
  print(1 ! 2 # 1 // 0)

  -- Esta expressão resultará em um erro, uma vez que estou tentando colocar  dois operadores, um com infxl e outro com infxr com a mesma precedência
  ---print(1 +++ 1 ! 0)

  -- Esta expressão não apresenta erro, uma vez que as precedências são diferentes:
  print(1 +++ 2 # 1) -- ((1 +++ 2) # 1) = (2*2*1 # 1) = 1

  -- Esta expressão falhará, porque o operador não é associativo, logo é necessário colocar os parênteses
  --print(2 ## 2 ## 3)
  print((2 ## 2) ## 3) -- (4 ## 3) = 16

  print(2 ## (2 ## 3)) -- (2 ## 4) = 4


-- Texto:
-- Fixity Declaration determina se um operador será associativo-à-esquerda (infixl) 
-- associativo-à-direita (infixr) ou não associativo (infix) além de sua precedência
-- sendo que operadores, por padrão, terão sua precedência como 9 (a mais forte na escala que vai de 0 até 9).