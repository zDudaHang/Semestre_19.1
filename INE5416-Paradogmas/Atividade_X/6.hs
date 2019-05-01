import Prelude hiding (Maybe (..))

data Maybe a = Nothing | Just a deriving (Eq, Ord, Read, Show)

instance Functor Maybe where
 fmap func (Just val) = Just (func val)
 fmap func Nothing = Nothing

instance Applicative Maybe where
 pure = Just
 (Just f) <*> (Just x) = Just (f x)
 _ <*> _ = Nothing

half :: Int -> Maybe Int
half x = if (x `mod` 2 == 0) then Just(x `div` 2) else Nothing

main = do
 --print((+3)(Just 3))
 print(fmap(+3)(Just 2))
 print(fmap(+3)(Nothing))
 print((+3) <$> (Just 2))
 let ex = fmap (+3) (+2)
 print(ex 10)
 print((+1) <$> (Just 5))
 print(Just (+3) <*> (Just 4))
 print(Just(+3) <*> Nothing)
 print( [(**2), (+10)] <*> [2,4,6])
 putStrLn("Functor não altera o contexto:")
 print(fmap(+3) [1,2,3])
 putStrLn("Applicative alteram o contexto, mas dependem dos parâmetros:")
 print([(+3)] <*> [1,2,3])
 print([(+1), (+3)] <*> [1,2,3])

-- class Functor f where
-- 		fmap :: (a->b) -> fa -> fb
-- Functor: Pega uma função (Como (+3)) pega um Functor (Como o (Just 2)) e retorna um novo Functor.
-- class (Functor f) => Applicative f where
--    pure  :: a -> f a
--    (<*>) :: f (a -> b) -> f a -> f b 
-- Applicative Functor: Contém dois métodos, o pure que para um determinado tipo, retorna um functor para o tipo a enquanto o operador <*> pega um functor com uma outra função dentro,
-- um outro functor com o tipo a (parâmetro da função) e retorna um novo functor com o tipo b (retorno da função)
-- Os functors são usados quando um determinando dado está aplicado a um contexto, como no caso do Maybe a (Nothing | Just a) e não é possível aplicar diretamente um (+3) no Nothing ou no Just 3,
-- ou seja, com a instância Functor Maybe é possível realizar a operação : fmap (+3) (Just 2) porque o Maybe também é um Functor (NÃO CONSEGUE ALTERAR O CONTEXTO). 
-- E os Applicatives seriam um Functor mais abrangente (mais poderoso), permitindo uma alteração do contexto, mas é dependente dos parâmetros recebidos.