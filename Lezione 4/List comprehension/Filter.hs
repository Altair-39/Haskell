-- La funzione filter può essere definita anche usando una list comprehension.

filter :: (a -> Bool) -> [a] -> [a]
filter p xs = [x | x <- xs, p x]