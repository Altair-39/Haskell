-- La funzione fattoriale calcola il fattoriale di un numero ricorsivamente.
-- Il fattoriale di 0 è 1 (passo base), il fattoriale di n è n * (n - 1) * (n - 2) * ... * 1 (passo ricorsivo).

fattoriale :: Int -> Int
fattoriale n | n == 0    = 1
             | otherwise = n * fattoriale (n - 1)

-- Si possono anche usare i pattern matching per definire la funzione fattoriale.
-- Il pattern matching ha utilità nelle strutture dati complesse come le liste.
-- Sia per le guardie che per il pattern matching l'ordine di scelta è dall'alto verso il basso.

fattoriale2 :: Int -> Int
fattoriale2 0 = 1
fattoriale2 n = n * fattoriale2(n - 1)