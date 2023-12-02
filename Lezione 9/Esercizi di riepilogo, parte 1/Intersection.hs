-- La funzione intersection calcola l'intersezione di due liste ordinate.

intersection :: Ord a => [a] -> [a] -> [a]
intersection [] _  = []
intersection _  [] = []
intersection (x : xs) (y : ys) | x == y    = x : intersection xs ys
                               | x < y     = intersection xs (y : ys)
                               | otherwise = intersection (x : xs) ys