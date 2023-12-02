-- La funzione sommaCongiunta prende due liste di interi e restituisce
-- una lista di interi che contiene la somma degli elementi delle due liste.
-- La seguente definizione usa il pattern matching.
-- Se la coda della prima lista è vuota, allora la somma congiunta è 
-- l'ultimo elemento della seconda lista.
-- Se la coda della seconda lista è vuota, allora la somma congiunta è
-- l'ultimo elemento della prima lista.
-- Altrimenti, la somma congiunta è la somma del primo elemento delle due liste
-- concatenata con la somma congiunta delle due code.

sommaCongiunta :: [Int] -> [Int] -> [Int]
sommaCongiunta (x : xs) (y : ys) | xs == []                 = [y]
                                 |             ys == []     = [x]
                                 | otherwise                = [x + y] ++ sommaCongiunta xs ys