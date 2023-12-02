-- La funzione quadrati prende come argomento una lista di numeri e restituisce
-- la lista dei quadrati dei numeri della lista.

quadrati :: Num a => [a] -> [a]
quadrati []       = []
quadrati (x : xs) = x ^ 2 : quadrati xs

-- Si può usare la funzione map per definire quadrati in modo più compatto.

quadrati2 :: Num a => [a] -> [a]
quadrati2 = map (^ 2)