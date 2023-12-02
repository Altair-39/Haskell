-- La funzione foo restituisce il successore se il numero è pari, altrimenti restituisce il valore assoluto.
-- Da notare: in Haskell il segno - è un operatore come gli altri per cui per scrivere un numero negativo bisogna scriverlo tra parentesi.
-- La prima implementazione fa uso dell'espressione condizionale.

foo :: Int -> Int
foo n = if even n then n +1 
        else abs n

-- La seconda implementazione fa uso delle guardie.

foo2 :: Int -> Int
foo2 n | even n    = n + 1
       | otherwise = abs n