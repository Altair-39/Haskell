-- La funzione sottolista prende in input due liste e restituisce
-- True se la prima è una sottolista della seconda, False altrimenti.
-- Se la prima lista è vuota, allora è una sottolista di qualsiasi altra lista.
-- Se la prima lista non è vuota e la seconda lista è vuota, allora non è una sottolista.
-- Se la prima lista non è vuota e la seconda lista non è vuota, allora
-- la prima lista è una sottolista della seconda se il primo elemento della prima lista
-- è uguale al primo elemento della seconda lista e il resto della prima lista è una sottolista
-- del resto della seconda lista.

sottolista :: Eq a => [a] -> [a] -> Bool
sottolista [] _ = True
sottolista _ [] = False
sottolista (x : xs) (y : ys)| x == y = sottolista xs ys
sottolista xs (_ : ys) = sottolista xs ys