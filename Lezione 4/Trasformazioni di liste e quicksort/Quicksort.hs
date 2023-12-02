-- La funzione quickSort prende come argomento una lista di elementi ordinabili e
-- restituisce la lista ottenuta ordinando gli elementi della lista.
-- Fa uso della funzione filter.

quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x : xs) =
  quickSort (filter (< x) xs) ++ [x] ++ quickSort (filter (>= x) xs)