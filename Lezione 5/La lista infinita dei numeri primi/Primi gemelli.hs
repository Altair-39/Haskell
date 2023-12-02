-- La funzione primo verifica se un numero è primo (la stessa definita nella lezione 1).

primo :: Integer -> Bool
primo n = aux 2
  where
    aux k | k >= n         = k == n
          | n `mod` k == 0 = False
          | otherwise      = aux (k + 1)

-- La funzione primiGemei calcola la lista dei primi n numeri primi gemelli.
-- Due numeri primi p e q sono gemelli se q = p + 2.

primiGemelli :: Int -> [(Integer, Integer)]
primiGemelli n = take n (filter gemelli (zip ps (tail ps)))
  where
    ps = filter primo (enumFrom 2)
    gemelli (p, q) = q == p + 2
