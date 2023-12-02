data ForseInt = Niente | Proprio Int
    deriving Show

-- La funzione proprio prende una lista di ForseInt e restituisce una lista di Int
-- contenente solo i valori Proprio.

proprio :: [ForseInt] -> [Int]
proprio []                 = []
proprio (Proprio x : xs) = x : proprio xs
proprio (Niente : xs)      = proprio xs