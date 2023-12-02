-- La funzione potenza m n calcola m^n.
-- Il trattino basso si usa per indicare un argomento che non verrà mai usato.

potenza :: Int -> Int -> Int
potenza _ 0 = 1
potenza m n = m * potenza m (n-1)

-- La funzione pow2 n calcola la potenza di 2 di n.

pow2 :: Int -> Int
pow2 = potenza 2