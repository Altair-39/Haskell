-- La funzione massimo prende come argomento una lista di elementi ordinabili e
-- restituisce il massimo di questi elementi.
-- Fa uso della funzione predefinita max :: Ord a => a -> a -> a che restituisce il
-- massimo tra due elementi ordinabili.

massimo :: Ord a => [a] -> a
massimo (x:xs) = foldr max x xs

-- Inoltre si può fare la stessa funzione con foldl.

massimo1 :: Ord a => [a] -> a
massimo1 (x:xs) = foldl max x xs