-- La funzione potenzaDi2 chiama ricorsivamente sè stessa per un numero n (Passo ricorsivo) e ha due passi base (0 e 1).
-- Il passo 0 è rappresentato da otherwise.
-- Indica se un numero è una potenza di 2.

potenzaDi2 :: Int -> Bool
potenzaDi2 1 = True
potenzaDi2 n | even n    = potenzaDi2 (div n 2)
             | otherwise = False