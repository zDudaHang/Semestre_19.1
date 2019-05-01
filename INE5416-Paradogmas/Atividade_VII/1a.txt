1)
A) As classes primitivas não são definidas através de outras classes, exemplo:
A classe Eq, utilizada no tratamento de igualdade e desigualdade e instância de todos os tipos, exceto IO e funções.
Métodos:

(/=) = not ( x == y) : Verifica a igualdade entre duas instâncias da classe
(==) = not ( x /= y) : Verifica a desigualdade entre duas instâncias da classe

A classe Enum é outro exemplo de classe primitiva, cuja responsabilidade é definir as operações sobre os seguintes tipos: (), Bool, Char, Int, Integer, Ordering, Float e Double.
Métodos :

succ, pred :: a -> a : Retorna o sucessor e o predecessor, respecitvamente.
toEnum :: Int -> a : Converte um Int para Enum.
fromEnum :: a -> Int : Converte um Enum para Int.
enumFrom : a -> [a] : Cria uma lista infinita a partir de um Enum através de uma PA de razão 1.
enumFromThen :: a -> a -> [a] : Cria uma lista infinita a partir do primeiro argumento e cria uma Progressão Aritmética a partir do segundo argumento. 
Explicando melhor: [1,3..] : Vai criar uma PA com razão 2.
enumFromTo :: a -> a -> [a] : Cria uma lista finita que vai de n até m através de uma PA de razão 1.
enumFromThenTo :: a -> a -> a -> [a] : Cria uma lista finita, sendo o limite o m, através de uma PA com razão (n'-n)

Por último, a classe Functor define métodos para classes mapeáveis.
Método:
fmap :: (a -> b) -> f a -> f b : Aplica o método f(definida desta forma com parâmetros genéricos: a -> b) todos os elementos de uma classe mapeável.
Para uma lista:
Functor :: (a -> b) -> [a] -> [b]

As classes secundárias são definidas a partir de outras classes, como por exemplo:
Ord: Métodos para dados totalmente ordenados.
Métodos:
compare :: a -> a -> Ordering : Retorna EQ se forem iguais, LT se o segundo parâmetro for menor e GT caso contrário.
(<), (<=), (>=), (>) :: a -> a -> Bool : Utilizando o método compare e seus retornos, verifica, para cado caso, se a equivalência é verdadeira. 
Exemplo:
x > y = compare x y == LT : LT = Se, em compare x y, for retornado GT (Maior que), retornará falso.
max, min :: a -> a -> a : Retorna o maior valor e o menor valor entre dois parâmetros, respecitvamente.

A classe Num contém os métodos das operações numéricas e instacia os tipos: Int, Integer, Float e Double.
Métodos:
(+), (-), (*) :: a -> a -> a : Soma, subtração e multiplicação (Retorna para o mesmo tipo)
negate :: a -> a : Retorna o valor oposto do parâmetro (0 - x)
abs, signum :: a -> a : Abs retorna o valor absoluto e Signum retorna -1 se for negativo, 0 se for zero e 1 se for positivo.
fromInteger :: Integer -> a : Converte um Integer para Num.

Por fim, a classe dos números reais Real:
Método:
toRational :: a -> Rational : Converte um valor aproximado do número real para um tipo racional.

