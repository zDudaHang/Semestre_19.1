class (Integral x) => MeuInt x where
 bigger :: x -> x -> x
 smaller :: x -> x -> x
 par :: x -> Bool
 impar :: x -> Bool
 mdc :: x -> x -> x
 (===) :: x -> x -> Bool
 (+++) :: x -> x -> x -- Operador que multiplicará as duas entradas e somará 1
 primo :: x -> Bool
 listarMultiplos :: x -> [x] -- Lista todos os múltiplos menores ou iguais ao argumento.

 bigger a b | (a > b) = a
  | otherwise = b

 smaller a b | a == (bigger a b) = b
  | otherwise = a

 par a = (a `mod` 2 == 0)

 impar a = not(par a)

 mdc a b | (b == 0) = a
  | (a == b) = a
  | (a < b) = mdc a (b `mod` a)
  | otherwise = mdc b (a `mod` b)

 a === b = if (a-b <= 1) then True else False

 primo a = if (length (listarMultiplos a) == 2) 
  then True 
  else False

 a +++ b = a*b + 1

 listarMultiplos a = [x | x <- [1..a], (a `mod` x == 0)]

instance MeuInt Integer 
instance MeuInt Int

main = do
  print (bigger (4::Int) (12::Int))
  print (smaller (3::Int) (13::Int))
  print (par (4::Integer))
  print (impar (1::Int))
  print (mdc (38::Integer) (55::Integer))
  print ( (55::Int) === (44::Int))
  print ( (44::Integer) === (45::Integer))
  print (primo (3::Int))
  print (primo (22::Integer))
  print ( (2::Int) +++ (3::Int))
  print(listarMultiplos (25::Int))