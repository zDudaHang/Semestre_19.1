import Prelude hiding (Maybe (..))

data Maybe a = Nothing | Just a deriving (Eq, Ord, Read, Show)

instance Monad Maybe where
 Nothing >>= f = Nothing
 (Just x) >>= f = f x
 return = Just

-- Precisa porque um Monad eh um Applicative
instance Applicative Maybe where
 pure = Just
 (Just f) <*> (Just x) = Just (f x)
 _ <*> _ = Nothing

-- Precisa porque um Applicative eh um Functor
instance Functor Maybe where
 fmap _ Nothing = Nothing
 fmap f (Just x) = Just (f x)

half :: Int -> Maybe Int
half x = if (x `mod` 2 == 0) then Just(x `div` 2) else Nothing

main = do
 putStrLn(show( (Just 3) >>= half))
 putStrLn(show( (Just 4) >>= half))
 putStrLn(show( (Just 20) >>= half >>= half ))
 putStrLn(show( (Just 20) >>= half >>= half >>= half))
 putStrLn(show( [1,2,3,4] >>= (\x -> [x -1, x + 1])))
 putStrLn(show( (Just 3) >> (Just 2) >> (Just 100)))
 putStrLn(show( (Just 10) >> (Just 50) >>= half))
 putStrLn(show( (Just 25) >> (Just 10) >>= half))

-- Existem os operadores fmap e pure sendo os dois primeiros oriundos das classes Functor e Applicatives.
-- A diferença entre >>= e >> é que o operador >>= passa o monad na esquerda (ex: Just 3)
-- para uma função que retorna um monad (ex: half) e retorna outro monad (Ex:Nothing).
-- O operador >> apenas ignora o monad da esquerda e retorna o da direita
-- Ex: (Just 10) >> (Just 20) = (Just 20)
