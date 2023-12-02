-- La funzione product prende come argomento una lista di
-- numeri e restituisce il prodotto dei numeri della lista.

product :: Num a => [a] -> a
product []       = 1
product (x : xs) = x * Prelude.product xs

-- Si può usare la funzione foldr per definire product in modo più compatto.

product2 :: Num a => [a] -> a
product2 = foldr (*) 1