escrevaDo :: String -> Int -> IO ()
-- putChar
escrevaDo _ 0 = putChar ' '
escrevaDo [] _ = putChar ' '
escrevaDo (c0:c1) n = do
 putChar c0
 escrevaDo c1 (n-1)

escreva :: String -> Int -> IO ()
escreva _ 0 = putChar ' '
escreva [] _ = putChar ' '
escreva (c0:c1) n = putChar c0 >> escreva c1 (n-1)

main = do 
 putStrLn("EscrevaDo:")
 escrevaDo "Marcos" 3
 escrevaDo "Marcos" 5
 escrevaDo "Marcos" 6
 putStrLn("\n")
 putStrLn("Escreva:")
 escreva "Marcos" 3
 escreva "Marcos" 5
 escreva "Marcos" 6
 putStrLn("\n")