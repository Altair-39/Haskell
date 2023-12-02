-- La funzione pow2 chiama ricorsivamente sè stessa per un numero n (Passo ricorsivo) e ha un passo base (0).
-- Rappresenta la potenza di 2 di un numero n.

pow2 :: Int -> Int
pow2 0 = 1
pow2 n = 2 * pow2(n - 1) 