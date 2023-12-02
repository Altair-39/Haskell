-- La funzione maggiori prende come argomenti un numero e una lista di numeri e
-- restituisce la lista dei numeri della lista che sono maggiori o uguali del
-- numero dato.

maggiori :: Ord a => a -> [a] -> [a]
maggiori _ [] = []
maggiori x (y : ys) | y >= x    = y : maggiori x ys
                    | otherwise = maggiori x ys

-- Si può usare la funzione filter per definire maggiori in modo più compatto.

maggiori2 :: Ord a => a -> [a] -> [a]
maggiori2 x = filter (>= x)