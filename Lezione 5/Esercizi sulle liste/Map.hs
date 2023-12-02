-- La funzione map è una funzione di ordine superiore che applica 
-- una funzione ad ogni elemento di una lista.

map :: (a -> b) -> [a] -> [b]
map f = foldr ((:) . f) []