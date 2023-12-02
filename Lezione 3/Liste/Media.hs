-- La f1unzione media calcola la media di una lista di numeri.
-- sum e length devono essere convertiti in Float per evitare errori di tipo.

media :: [Int] -> Float
media [] = 0
media x = fromIntegral(sum x) / fromIntegral(length x)