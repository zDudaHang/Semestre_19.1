import Prelude hiding (Maybe (..))

data Maybe a = Nothing | Just a deriving (Eq, Ord, Read, Show)

data Ponto = Ponto2D (Float, Float)

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

------------------------------------------ OPERACOES

formaTriangulo :: Ponto -> Ponto -> Ponto -> Maybe Float
formaTriangulo a b c 
 | ((ehTriangulo a b c) == False) = Nothing
 | otherwise = Just(areaTriangulo a b c)


areaTriangulo :: Ponto -> Ponto -> Ponto -> Float
areaTriangulo a b c = (abs(determinante a b c))/2

determinante :: Ponto -> Ponto -> Ponto -> Float
determinante (Ponto2D (x1,y1)) (Ponto2D (x2,y2)) (Ponto2D (x3,y3)) = (x1*y2 + y1*x3 + x2*y3) - (y1*x2 + x1*y3 + x3*y2)

distancia :: Ponto -> Ponto -> Float
distancia (Ponto2D (x1,y1)) (Ponto2D (x2,y2)) = sqrt((x1-x2)**2 + (y1-y2)**2)

ehTriangulo :: Ponto -> Ponto -> Ponto -> Bool
ehTriangulo a b c = if ( (abs((distancia a c) - (distancia a b))) < (distancia b c) && (distancia b c) < ((distancia a c)+(distancia a b)) ) then True else False

main = do
 let p1 = (Ponto2D (0,0))
 let p2 = (Ponto2D (0,-8))
 let p3 = (Ponto2D (5,0))

 putStrLn(show(formaTriangulo p1 p2 p3))
 putStrLn(show(formaTriangulo p1 p1 p1))