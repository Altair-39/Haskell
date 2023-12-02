-- La funzione sum prende come argomento una lista di numeri e 
-- restituisce la somma degli elementi della lista.

sum :: Num a => [a] -> a
sum []       = 0
sum (x : xs) = x + Prelude.sum xs

-- Si può usare la funzione foldr per definire sum in modo più compatto.

sum2 :: Num a => [a] -> a
sum2 = foldr (+) 0