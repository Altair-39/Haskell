-- La funzione arrotonda prende come argomento una lista di numeri reali e
-- restituisce la lista dei numeri interi ottenuti arrotondando i numeri reali
-- della lista.

arrotonda :: (RealFrac a, Integral b) => [a] -> [b]
arrotonda []       = []
arrotonda (x : xs) = round x : arrotonda xs

-- Si può usare la funzione map per definire arrotonda in modo più compatto-

arrotonda2 :: (RealFrac a, Integral b) => [a] -> [b]
arrotonda2 = map round