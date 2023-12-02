-- La funzione filter è una funzione di ordine superiore che prende in input 
-- un predicato e una lista e restituisce la lista degli elementi che soddisfano il predicato.

filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr aux []
  where
    aux x xs | p x = x : xs
             | otherwise = xs