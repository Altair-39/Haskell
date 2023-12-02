-- La funzione somma calcola la somma degli elementi di una lista di interi.
-- La seguente definizione usa il pattern matching.
-- Se la lista è vuota, la somma è 0.
-- Se la lista non è vuota, la somma è il primo elemento più la somma del resto della lista.

somma :: [Int] -> Int
somma []       = 0
somma (x : xs) = x + somma xs