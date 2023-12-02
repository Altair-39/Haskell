-- La funzione union calcola l'unione di due liste ordinate.

union :: Ord a => [a] -> [a] -> [a]
union [] ys = ys
union xs [] = xs
union (x : xs) (y : ys) | x == y    = x : union xs ys
                        | x < y     = x : union xs (y : ys)
                        | otherwise = y : union (x : xs) ys