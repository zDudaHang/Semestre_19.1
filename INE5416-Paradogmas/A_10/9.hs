-- Explicar o Monad Either
-- Fazer um pequeno exemplo e explicar o funcionamento

-- A classe Either contém dois construtores o Left a e o Right b
-- Sendo que o Left representaria o erro com o seu tipo (ex: o valor 0 em uma divisão)
-- E o Right o valor desejado 
-- O Either é mais "poderoso" que o Maybe, por permitir um tipo contido em um contexto
-- para o erro (ao contrário do Maybe que apenas usa Nothing).
-- O uso do Monad Either,também chamado como Error Monad, serve para um tratamento de exceções
-- e erros no código de uma forma mais evidente que o erro ocorreu.

-- Monad Error:
-- import Control.Monad.Error

-- instance (Error e) => Monad (Either e) where  
--  return x = Right x   
--  Right x >>= f = f x  
--  Left err >>= f = Left err  
--  fail msg = Left (strMsg msg)  

evalLength :: String -> Either String Int
evalLength "" = Left "Empty String"
evalLength s = Right (length s)
evalLength s = do
	len_s <- evalLength s
	return len_s

evalNumberMax :: Float -> Either String Bool
evalNumberMax n = if(n < 1.5)
 then Left "The numbers is smaller than 1.5"
 else return True

main = do
 print(Left "aaa" >>= \x -> return (x+5))
 print(Right 100 >>= \x -> Left "Oops!")
 print(evalLength "")
 print(evalLength "Cachorro")
 print(evalNumberMax 1.2)
 print(evalNumberMax 100)
 print(1.2 >>= evalNumberMax)
 print(100 >>= evalNumberMax)
 print("" >>= evalLength)
 print("Cachorro" >>= evalLength)