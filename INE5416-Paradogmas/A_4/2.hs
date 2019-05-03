--Crie uma função que receba um número x, negativo ou positivo, e retorne seu valor absoluto. Leia x do teclado

modulo :: Float -> Float
modulo x = if x >= 0
 then x
 else -x

main = do
 putStrLn "Informe um número: "
 numero <- getLine
 let a = (read numero :: Float)
 print (modulo a)
