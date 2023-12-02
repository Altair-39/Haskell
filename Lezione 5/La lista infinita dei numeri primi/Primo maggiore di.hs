-- La funzione primo verifica se un numero è primo (la stessa definita nella lezione 1).

primo :: Integer -> Bool
primo n = aux 2
  where
    aux k | k >= n         = k == n
          | n `mod` k == 0 = False
          | otherwise      = aux (k + 1)

-- La funzione primoMaggioreDi prende un numero n e restituisce il primo numero primo
-- maggiore di n.

primoMaggioreDi :: Integer -> Integer
primoMaggioreDi n = head (filter (> n) (filter primo (enumFrom 2)))