-- La funzione ordinata verifica se una lista di interi è ordinata in modo non decrescente.
-- La seguente definizione usa il pattern matching.
-- Se la lista è vuota, allora è ordinata.
-- Se la lista ha un solo elemento, allora è ordinata.
-- Se la lista ha almeno due elementi, allora è ordinata se il primo elemento è minore o uguale al secondo e il resto della lista è ordinato.

ordinata :: [Int] -> Bool
ordinata []           = True
ordinata [_]          = True
ordinata (x : y : xs) = x <= y && ordinata (y : xs)