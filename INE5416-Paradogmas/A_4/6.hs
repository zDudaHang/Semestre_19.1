-- Crie uma função que receba três inteiros x, y e z e retorne se havendo varetas com esses valores em
-- comprimento pode-se construir um triângulo. Exemplo, com varetas de comprimento 4, 8 e 9 posso
-- construir um triângulo, porém com varetas de comprimento 10, 5 e 4 não posso construir um triângulo.
-- Leia x, y e z do teclado.

-- Solução: Para construir um triângulo é necessário que a medida de qualquer um dos lados seja menor que a soma das medidas dos outros dois e maior que o valor absoluto da diferença entre essas medidas.

diff:: Float -> Float -> Float
diff x y = x-y

modulo :: Float -> Float
modulo x = if x >= 0
 then x
 else -x

existe_triangulo :: Float -> Float -> Float -> Float -> String
existe_triangulo modulo a b c = if (modulo < a && a < b + c)
 then "Eh possivel fazer um triangulo"
 else "Nao eh possivel fazer um triangulo"

main = do
 putStrLn "Informe os valores dos lados: "
 aString <- getLine
 bString <- getLine
 cString <- getLine
 let a = (read aString :: Float)
 let b = (read bString :: Float)
 let c = (read cString :: Float)
 let resultado = (diff b c)
 let resultado_modulo = (modulo resultado)
 print(existe_triangulo resultado_modulo a b c)
 
