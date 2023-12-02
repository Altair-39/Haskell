-- La funzione identità restituisce il suo argomento.

id_int :: Int -> Int 
id_int x = x

-- Si può anche scrivere l'identità usando il lambda calcolo.

id2 :: Int -> Int
id2 = \x -> x