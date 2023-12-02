import Prelude hiding (length)
data List a = Nil | Cons a (List a)

-- La funzione length calcola la lunghezza di una lista.

length :: List a -> Int
length Nil         = 0
length (Cons _ xs) = 1 + length xs