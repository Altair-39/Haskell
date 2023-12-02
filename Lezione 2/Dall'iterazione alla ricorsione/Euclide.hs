-- La funzione euclide m n calcola il massimo comun divisore tra m e n.

euclide :: Int -> Int -> Int
euclide m n | m == n    = n
            | m < n     = euclide m (n - m)
            | otherwise = euclide (m - n) n
