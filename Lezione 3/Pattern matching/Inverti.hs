-- La funzione inverti inverte una lista di interi.
-- La seguente definizione usa il pattern matching.
-- Se la lista è vuota, allora la lista invertita è vuota.
-- Se la lista non è vuota, allora la lista invertita è l'inversione 
-- del resto della lista concatenato primo elemento.

inverti :: [Int] -> [Int]
inverti []       = []
inverti (x : xs) = inverti xs ++ [x]