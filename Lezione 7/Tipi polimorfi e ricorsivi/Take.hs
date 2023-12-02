import Prelude hiding (take)

data Stream a = Cons a (Stream a)

-- La funzione take prende un numero n e uno Stream di valori di tipo a e restituisce una lista di valori di tipo a.

take :: Int -> Stream [a] -> [a]
take 0 _           = []
take n (Cons x xs) = x ++ take (n - 1) xs