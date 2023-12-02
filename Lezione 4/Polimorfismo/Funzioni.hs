-- [a] -> Int
-- length xs
-- Restituisce la lunghezza della lista xs.

-- [a] -> Bool
-- null xs
-- Restituisce True se la lista xs è vuota, False altrimenti.

-- [a] -> a
-- head xs
-- Restituisce la testa della lista xs.

-- [a] -> [a]
-- tail xs
-- Restituisce la coda della lista xs.

-- [[a]] -> [a]
-- concat xs
-- Concatena le liste contenute nella lista xs.

-- [a] -> Int -> a
-- (!!) xs n
-- Restituisce l'n-esimo elemento della lista xs.

-- Int -> [a] -> [a]
-- take n xs
-- Restituisce i primi n elementi della lista xs.
-- drop n xs
-- Restituisce la lista xs senza i primi n elementi.

-- [a] -> [b] -> [(a, b)]
-- zip xs ys
-- Restituisce la lista delle coppie (x, y) dove x è un elemento della lista
-- xs e y è un elemento della lista ys.

-- [(a, b)] -> ([a], [b])
-- unzip xys
-- Restituisce la coppia di liste (xs, ys) dove xs è la lista delle prime
-- componenti delle coppie contenute nella lista xys e ys è la lista delle
-- seconde componenti.