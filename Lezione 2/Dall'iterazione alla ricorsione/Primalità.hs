-- La funzione primo n calcola se n è primo.
-- IL costrutto where permette di definire funzioni locali.

primo :: Int -> Bool
primo n = primoAux 2
    where 
        primoAux k | k >= n         = k == n
                   | mod n k == 0   = False
                   | otherwise      = primoAux (k + 1)