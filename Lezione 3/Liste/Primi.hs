-- La funzione primo verifica se un numero è primo (la stessa definita nella lezione 1).

primo :: Int -> Bool
primo n = aux 2
  where
    aux k | k >= n         = k == n
          | n `mod` k == 0 = False
          | otherwise      = aux (k + 1)

-- La funzione primi calcola la lista dei numeri primi compresi tra 2 e n.

primi :: Int -> [Int]
primi n = aux 2
  where
    aux j | j > n     = []
          | primo j   = j : aux (j + 1)
          | otherwise = aux (j + 1)