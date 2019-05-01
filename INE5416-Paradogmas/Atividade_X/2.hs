import Prelude hiding (Maybe (..))

data Maybe a = Nothing | Just a deriving (Eq, Ord, Read, Show)

data Expr = Val (Num Float)
 | Div Expr Expr | Mul Expr Expr
 | Add Expr Expr | Sub Expr Expr
 | Sqrt Expr

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
------------------------------------------- OPERACOES

mydiv :: Float -> Float -> Maybe Float
mydiv n m 
 | (m == 0) = Nothing
 | otherwise = Just (n / m)

myadd :: Float -> Float -> Maybe Float
myadd n m = Just(n + m)

mymult :: Float -> Float -> Maybe Float
mymult n m = Just(n*m)

mysub :: Float -> Float -> Maybe Float
mysub n m = Just(n-m)

mysqrt :: Float -> Maybe Float
mysqrt n
 | (n < 0) = Nothing
 | otherwise = Just(sqrt n)

eval :: Expr -> Maybe Float
eval (Val n) = Just n
------------------------------------
eval (Div x y) = case (eval x) of
	Nothing -> Nothing
	Just n -> case (eval y) of
		Nothing -> Nothing
		Just m -> (mydiv n m)
------------------------------------
eval (Add x y) = case (eval x) of
	Just n -> case (eval y) of
		Just m -> (myadd n m)
------------------------------------
eval (Sub x y) = case (eval x) of
	Just n -> case (eval y) of
		Just m -> (mysub n m)
------------------------------------
eval (Mul x y) = case (eval x) of
	Just n -> case (eval y) of
		Just m -> (mymult n m)
------------------------------------
eval (Sqrt x) = case (eval x) of
	Nothing -> Nothing
	Just n -> (mysqrt n)
------------------------------------

evalmonad :: Expr -> Maybe Float
evalmonad (Val n) = return n
evalmonad (Div x y) = evalmonad x >>= (\n -> evalmonad y >>= \m -> (mydiv n m))
evalmonad (Add x y) = evalmonad x >>= (\n -> evalmonad y >>= \m -> (myadd n m))
evalmonad (Sub x y) = evalmonad x >>= (\n -> evalmonad y >>= \m -> (mysub n m))
evalmonad (Mul x y) = evalmonad x >>= (\n -> evalmonad y >>= \m -> (mymult n m))
evalmonad (Sqrt x) = evalmonad x >>= (\n -> mysqrt n)

evalfinal :: Expr -> Maybe Float
evalfinal (Val n) = return n
evalfinal (Div x y) = do
 n <- evalfinal x
 m <- evalfinal y
 mydiv n m
evalfinal (Add x y) = do
 n <- evalfinal x
 m <- evalfinal y
 myadd n m
evalfinal (Sub x y) = do
 n <- evalfinal x
 m <- evalfinal y
 mysub n m
evalfinal (Mul x y) = do
 n <- evalfinal x
 m <- evalfinal y
 mymult n m
evalfinal (Sqrt x) = do
 n <- evalfinal x
 mysqrt n

main = do
 print(mydiv 5 0)
 print(eval(Div (Val 5) (Val 0)))
 print(eval(Div (Val 5) (Val 2)))
 print(evalmonad(Div (Val 5) (Val 0)))
 print(evalmonad(Div (Val 5) (Val 2)))
 print(evalfinal(Div (Val 5) (Val 0)))
 print(evalfinal(Div (Val 5) (Val 2)))

 print(eval(Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)))
 print(evalmonad(Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)))
 print(evalfinal(Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)))
 
 print(eval(Mul(Mul(Val 4) (Val 4)) (Val 4)))
 print(evalmonad(Mul(Mul(Val 4) (Val 4)) (Val 4)))
 print(evalfinal(Mul(Mul(Val 4) (Val 4)) (Val 4)))

 print(eval(Div(Mul(Add (Val 5) (Val 3)) (Val 10)) (Val 10)))
 print(evalmonad(Div(Mul(Add (Val 5) (Val 3)) (Val 10)) (Val 10)))
 print(evalfinal(Div(Mul(Add (Val 5) (Val 3)) (Val 10)) (Val 10)))

 print(eval(Add (Sqrt (Val 9)) (Sqrt (Val 25))))
 print(evalmonad(Add (Sqrt (Val 9)) (Sqrt (Val 25))))
 print(evalfinal(Add (Sqrt (Val 9)) (Sqrt (Val 25))))

 print(eval(Sqrt (-9)))
 print(evalmonad(Sqrt (-9)))
 print(evalfinal(Sqrt (-9)))
