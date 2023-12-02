import Data.Char (chr, isDigit, ord)
-- La funzione readHex che data una stringa di cifre esadecimali restituisce 
-- il numero intero non negativo corrispondente.

readHex :: String -> Int
readHex = aux 0
  where
    aux res [] = res
    aux res (c : cs) = aux (res * 16 + readChar c) cs

    readChar c | isDigit c = ord c - ord '0'
               | c >= 'a' && c <= 'f' = ord c - ord 'a' + 10
               | c >= 'A' && c <= 'F' = ord c - ord 'A' + 10

-- Questa versione fa uso della foldl. In questo caso non va bene utilizzare la
-- foldr, perchè bisogna partire dalla cifra più significativa.

readHex2 :: String -> Int
readHex2 = foldl (\res c -> res * 16 + readChar c) 0
  where
    readChar c | isDigit c = ord c - ord '0'
               | c >= 'a' && c <= 'f' = ord c - ord 'a' + 10
               | c >= 'A' && c <= 'F' = ord c - ord 'A' + 10