-- La funzione difference calcola la differenza di due liste ordinate.

difference :: Ord a => [a] -> [a] -> [a]
difference [] _  = []
difference xs [] = xs
difference (x : xs) (y : ys) | x == y    = difference xs ys
                             | x < y     = x : difference xs (y : ys)
                             | otherwise = difference (x : xs) ys