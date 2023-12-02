-- La funzione bits n calcola il numero di bit a 1 nella rappresentazione binaria di n.
-- La funzione bits è un'applicazione parziale della aux (metodo wrapper).

bits :: Int -> Int
bits = aux 0
    where
        aux m n | n == 0    = m
                | otherwise = aux (m + mod n 2) (div n 2)