-- La funzione sottrazione x y calcola x - y.

sottrazione :: Int -> Int -> Int
sottrazione x y = x - y

-- Il negate è un applicazione parziale della sottrazione.

negate :: Int -> Int
negate = sottrazione 0