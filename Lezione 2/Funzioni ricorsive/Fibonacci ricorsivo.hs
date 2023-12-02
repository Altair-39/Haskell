-- La funzione fibonacci chiama ricorsivamente sè stessa per un numero n (Passo ricorsivo) e ha due passi base (0 e 1).
-- Ha complexità O(2^n) e non è efficiente.

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)