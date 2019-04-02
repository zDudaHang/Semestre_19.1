apagarEnquanto :: (t->Bool) -> [t] -> [t]
apagarEnquanto _ [] = []
apagarEnquanto op (a:b) | (op a) = apagarEnquanto op b
 | otherwise = (a:b)

par :: Int -> Bool
par x = if(x `mod` 2 == 0)
 then True
 else False

main = do
 let list = (apagarEnquanto par [2,4,1,2,3,4,5])
 print list