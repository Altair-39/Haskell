-- Funzione che prende in input un anno e restituisce True se l'anno è bisestile, False altrimenti.

bisestile :: Int -> Bool
bisestile n = (n `mod` 4 == 0 && n `mod` 100 /= 0) || n `mod` 400 == 0