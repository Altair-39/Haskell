-- La funzione adiacenti prende una lista e restituisce True se e solo se 
-- la lista contiene due elementi adiacenti uguali.

adiacenti :: Eq a => [a] -> Bool
adiacenti xs = any (uncurry (==)) (zip xs (tail xs))

-- Una versione alternativa fa uso di match, definita in precedenza.

adiacenti1 :: Eq a => [a] -> Bool
adiacenti1 (x : xs) = match (x : xs) xs
    where
        match xs ys = any (uncurry (==)) (zip xs ys)