-- Si usa la funzione bisestile definita in precedenza.

bisestile :: Int -> Bool
bisestile n = (n `mod` 4 == 0 && n `mod` 100 /= 0) || n `mod` 400 == 0

-- Se bisestile restituisce True allora si hanno 366 giorni, altrimenti 365.

giorni :: Int -> Int
giorni n | bisestile n = 366
         | otherwise   = 365