-- La funzione massimo prende due interi e restituisce il valore maggiore.

massimo :: Int -> Int -> Int
massimo x y | x >= y    = x
            | otherwise = y