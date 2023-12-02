-- La funzione occorrenze prende come argomento un elemento e una lista e 
-- restituisce il numero di occorrenze dell'elemento nella lista.
-- Fa uso della funzione predefinita length :: [a] -> Int che restituisce la lunghezza
-- di una lista.
-- Fa uso della funzione predefinita filter :: (a -> Bool) -> [a] -> [a] che restituisce
-- la lista degli elementi che soddisfano il predicato dato come primo argomento.

occorrenze :: Eq a => a -> [a] -> Int
occorrenze x = length . filter (== x)

-- Una soluzione alternativa fa uso di map.

occorrenze1 :: Eq a => a -> [a] -> Int
occorrenze1 x = length . filter id . map (== x)