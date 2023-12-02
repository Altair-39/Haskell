import Data.Char (chr, ord)

-- La funzione showHex prende un numero intero e restituisce la sua rappresentazione esadecimale.

showHex :: Int -> String
showHex n | n < 0     = '-' : showHex (negate n)
          | n < 16    = [aux n]
          | otherwise = showHex (div n 16) ++ [aux (mod n 16)]
    where
        aux n | n < 10    = chr (ord '0' + n)
              | otherwise = chr (ord 'A' + n - 10)