-- La funzione fattoriale n calcola n!.
-- La funzione fattoriale è un'applicazione parziale della aux (metodo wrapper).

fattoriale :: Int -> Int
fattoriale = aux 1
    where 
        aux n m | m == 0    = n 
                | otherwise = aux (m * n) (m - 1)