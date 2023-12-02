data ForseInt = Niente | Proprio Int 
    deriving Show

-- La funzione testa prende una lista e restituisce il primo elemento della lista.
-- Se la lista è vuota restituisce Niente, altrimenti restituisce Proprio x, dove x
-- è il primo elemento della lista.

testa :: [Int] -> ForseInt
testa []      = Niente
testa (x : _) = Proprio x