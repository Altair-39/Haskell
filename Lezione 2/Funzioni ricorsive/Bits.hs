-- La funzione bits chiama ricorsivamente sè stessa per un numero n (Passo ricorsivo) e ha un passo base (0).
-- Fa uso sia di guardie che di pattern matching.
-- Rappresenta il numero di bit a 1 della rappresentazione binaria di un numero n.

bits :: Int -> Int
bits 0 = 0
bits n | even n    = bits (div n 2)
       | otherwise = 1 + bits (div n 2)

-- Un'altra rappresentazione è la seguente.

bits2 :: Int -> Int
bits2 0 = 0
bits2 n = (mod n 2) + bits2 (div n 2)