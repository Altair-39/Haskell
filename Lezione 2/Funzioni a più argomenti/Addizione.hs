-- La funzione addizione prende due interi e restituisce un intero.

addizione :: Int -> Int -> Int
addizione x y = x + y

-- Si può anche scrivere come una funzione anonima.

addizione2 :: Int -> Int -> Int
addizione2 x = \y -> x + y

-- E anche in quest altro modo.

addizione3 :: Int -> Int -> Int
addizione3 = \x -> \y -> x + y