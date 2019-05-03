module Fila (Fila (Queue), minhaFila, enqueue, dequeue, first, emptyQueue) where

data Fila t = Queue [t] deriving (Eq,Show)

minhaFila :: Fila Char
minhaFila = Queue ['A','D','X','W','C']

enqueue :: Fila t -> t -> Fila t
enqueue (Queue tail) x = Queue (tail ++ [x])
dequeue :: Fila t -> Fila t
dequeue (Queue []) = error "Empty Queue"
dequeue (Queue (head:tail)) = Queue tail

first :: Fila t -> t
first (Queue []) = error "Emtpy Queue"
first (Queue (head:tail)) = head

emptyQueue :: Fila t
emptyQueue = Queue []