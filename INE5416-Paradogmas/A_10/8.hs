lerDo :: Int -> IO String
lerDo 0 = return []
lerDo n = do
 x <- getChar
 xs <- (lerDo (n -1))
 return (x:xs)

echoDo :: IO ()
echoDo = do
 x <- getChar
 print x

echo :: IO ()
echo = getChar >>= (\x -> print x)

main = do
 echoDo
 echo