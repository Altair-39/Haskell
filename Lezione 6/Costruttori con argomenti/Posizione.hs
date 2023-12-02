data ForseInt = Niente | Proprio Int 
    deriving Show

-- La funzione posizione prende un numero intero e una lista e restituisce la posizione
-- dell'elemento nella lista. Fa uso del costrutto case per gestire i due casi. Case si
-- usa con le chiamate ricorsive, in modo da poter gestire i due casi in modo diverso.

posizione :: Int -> [Int] -> ForseInt
posizione _ [] = Niente
posizione x (y : _) | x == y = Proprio 0
posizione x (_ : ys) = case posizione x ys of
                        Niente -> Niente
                        Proprio n -> Proprio (n + 1)