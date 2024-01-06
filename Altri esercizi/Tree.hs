data Tree a = Empty | Node a [Tree a]

elements :: Tree a -> [a]
elements Empty = []
elements (Node x ts) = x : concat (map elements ts)