-- La funzione all è duale di any: restituisce True se tutti gli elementi di una
-- lista soddisfano un predicato, False altrimenti.
-- Fa uso di foldr, map e di una funzione anonima.

all :: (a -> Bool) -> [a] -> Bool
all p = foldr (&&) True . map p

-- Una versione alternativa utilizza length e filter


all1 :: (a -> Bool) -> [a] -> Bool
all1 p x = length (filter p x) == length x