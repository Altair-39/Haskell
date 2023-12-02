import Data.Char (chr, ord)

-- La funzione showBin prende un numero intero e restituisce la sua rappresentazione binaria.

showBin :: Int -> String
showBin n | n < 0     = '-' : showBin (negate n)
          | n < 2     = [chr (ord '0' + n)]
          | otherwise = showBin (div n 2) ++ [chr (ord '0' + mod n 2)]