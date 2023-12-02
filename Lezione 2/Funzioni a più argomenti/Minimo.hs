-- La funzione minimo prende due interi e restituisce il valore minore.

minimo :: Int -> Int -> Int
minimo x y | x >= y    = y
           | otherwise = x