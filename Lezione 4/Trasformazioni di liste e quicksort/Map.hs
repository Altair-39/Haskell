-- La funzione map prende come argomenti una funzione f e una lista xs e restituisce
-- la lista ottenuta applicando f a tutti gli elementi di xs.

map :: (a -> b) -> [a] -> [b]
map _ []       = []
map f (x : xs) = f x : Prelude.map f xs