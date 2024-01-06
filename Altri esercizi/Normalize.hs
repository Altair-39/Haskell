data Tree a = Empty | Node a [Tree a]

normalize :: Tree a -> Tree a
normalize Empty       = Empty
normalize (Node x ts) = Node x (filter ne (map normalize ts))
  where
    ne Empty = False
    ne _     = True