-- La funzione ordinata verifica se una lista è ordinata
-- (in senso non decrescente).
-- Se si esgue ordinata [] si ottiene True.
-- Questo avviene perchè la funzione zip è pigra a destra e
-- quindi non valuta la seconda lista se la prima è vuota
-- (per cui nnon dà errore).

ordinata :: Ord a => [a] -> Bool
ordinata xs = all (uncurry (<=)) (zip xs (tail xs))