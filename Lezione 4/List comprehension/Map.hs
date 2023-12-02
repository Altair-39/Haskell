-- La funzione map può essere definita anche usando una list comprehension.

map :: (a -> b) -> [a] -> [b]
map f xs = [ f x | x <- xs ]