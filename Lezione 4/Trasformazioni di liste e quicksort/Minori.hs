-- La funzione minori prende come argomenti un numero e una lista di numeri e
-- restituisce la lista dei numeri della lista che sono minori del numero dato.

minori :: Ord a => a -> [a] -> [a]
minori _ [] = []
minori x (y : ys) | y < x     = y : minori x ys
                  | otherwise = minori x ys

-- Si può usare la funzione filter per definire minori in modo più compatto.

minori2 :: Ord a => a -> [a] -> [a]
minori2 x = filter (< x)