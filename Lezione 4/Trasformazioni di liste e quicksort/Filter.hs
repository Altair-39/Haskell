-- La funzione filter prende come argomenti un predicato p e una lista xs e
-- restituisce la lista ottenuta selezionando gli elementi di xs che soddisfano p.

filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x : xs) | p x       = x : Prelude.filter p xs
                  | otherwise = Prelude.filter p xs
