-- La funzione somma chiama ricorsivamente sè stessa per un numero n (Passo ricorsivo) e ha un passo base (1).
-- Rappresenta la somma dei primi n numeri naturali.

somma :: Int -> Int
somma 1 = 1
somma n = n + somma (n-1)