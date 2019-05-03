import Pilha (Pilha (Stack), emptyStack, push, pop, top)

import Fila

main = do 
 putStrLn (show (push (push emptyStack 1) 2))
 putStrLn (show (top (Stack [1,2,3,4,5])))
 putStrLn (show (pop (Stack [1,2,3,4,5])))
 -------------------------------------------------
 putStrLn (show (minhaFila))
 putStrLn (show (first minhaFila))
 putStrLn (show (enqueue minhaFila 'B'))
 putStrLn (show (dequeue minhaFila))
 putStrLn (show (enqueue emptyQueue 1))

