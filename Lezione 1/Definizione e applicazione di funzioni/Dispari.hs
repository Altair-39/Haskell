-- Questa definizione di dispari non fa uso della funzione pari.

dispari :: Int -> Bool
dispari n = n `mod` 2 /= 0

-- Si può anche scrivere la funzione dispari usando il lambda calcolo.

dispari2 :: Int -> Bool
dispari2 = \n -> n `mod` 2 /= 0