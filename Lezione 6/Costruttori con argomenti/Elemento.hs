-- La funzione elemento prende un numero intero e una lista e restituisce l'elemento
-- della lista che si trova alla posizione indicata dal numero intero.

elemento :: Int -> [Int] -> Int
elemento 0 (x : _)  = x
elemento n (_ : xs) = elemento (n - 1) xs

-- Tuttavia si può inserire un indice non valido, ad esempio -1, e la funzione
-- restituisce un errore. Si può migliorare la funzione in modo diventi totale.

elemento2 :: Int -> [Int] -> Int
elemento2 0 (x : _)  = x
elemento2 n (_ : xs) = elemento2 (n - 1) xs
elemento2 _ _        = -1

-- Però questa soluzione ha dei difetti: -1 potrebbe essere un valore della lista
-- e quindi non è un errore, ma un valore legittimo. 
-- Per risolvere questo problema si può usare un tipo Forse.

data ForseInt = Niente | Proprio Int 
    deriving Show

elemento3 :: Int -> [Int] -> ForseInt
elemento3 0 (x : _)  = Proprio x
elemento3 n (_ : xs) = elemento3 (n - 1) xs
elemento3 _ _        = Niente