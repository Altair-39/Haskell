-- La funzione concat prende come argomento una lista di liste e restituisce la
-- lista ottenuta concatenando le liste della lista di liste.

concat :: [[a]] -> [a]
concat = foldr (++) []