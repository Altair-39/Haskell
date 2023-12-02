-- La funzione intervallo calcola la lista dei numeri interi compresi tra due numeri.
-- Fa uso di guardie per gestire il caso in cui il primo numero sia maggiore del secondo.

intervallo :: Int -> Int -> [Int]
intervallo m n | m > n     = []
               | otherwise = m : intervallo (m + 1) n