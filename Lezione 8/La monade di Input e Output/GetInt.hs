-- La funzione getInt prende un intero da tastiera e lo restituisce.
-- Tuttavia la read è deprecata.

getInt :: IO Int
getInt = getLine >>= return . read