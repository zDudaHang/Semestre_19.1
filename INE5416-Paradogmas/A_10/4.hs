import Prelude hiding (Maybe (..))

data Maybe a = Nothing | Just a deriving (Eq, Ord, Read, Show)

type Posicao = (Int, Int)

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

---------------------------------------------

calcPosicaoFinal :: [Posicao] -> Maybe Posicao
calcPosicaoFinal (p0:p1:p2) = do
	p0' <- verificarPosicao p0 p1
	calcPosicaoFinal (p1:p2)

posicaoInvalida :: Posicao -> Bool
posicaoInvalida (x,y) = if ((x > 7 || y > 7) || (x < 0 || y < 0)) then True else False

movimentacao :: Posicao -> Posicao -> Bool
movimentacao (x,y) (x',y')
 | mov1 == posfinal = True
 | mov2 == posfinal = True
 | mov3 == posfinal = True
 | mov4 == posfinal = True
 | mov5 == posfinal = True 
 | mov6 == posfinal = True
 | mov7 == posfinal = True
 | mov8 == posfinal = True
 | otherwise = False 
 where 
 posfinal = (x',y')
 mov1 = (x-1,y+2)
 mov2 = (x-1,y-2) 
 mov3 = (x+1,y+2)
 mov4 = (x+1,y-2)
 mov5 = (x-2,y+1)
 mov6 = (x-2,y-1)
 mov7 = (x+2,y+1)
 mov8 = (x+1,y-1)

verificarPosicao :: Posicao -> Posicao -> Maybe Posicao
verificarPosicao p1 p2 
 | (posicaoInvalida p1 == True) || (movimentacao p1 p2 == False) = Nothing
 | otherwise = Just(p2)

main = do
 let lposicoes1 = [(1,0), (2,2), (0,3), (2,4)]
 let lposicoes2 = [(1,0),(3,2), (0,3), (2,4)]
 putStrLn(show(calcPosicaoFinal lposicoes1))
 putStrLn(show(calcPosicaoFinal lposicoes2))
