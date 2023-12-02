-- La funzione prodotto calcola il prodotto degli elementi di una lista di interi.
-- La seguente definizione usa il pattern matching.
-- Se la coda della lista è vuota, il prodotto è il primo elemento (la testa).
-- Se la lista non è vuota, il prodotto è il primo elemento per il prodotto del resto della lista.

prodotto :: [Int] -> Int
prodotto (x : xs) | xs == [] = x
                  | otherwise = x * prodotto xs