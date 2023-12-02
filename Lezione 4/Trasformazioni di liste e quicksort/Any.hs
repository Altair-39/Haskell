-- La funzione any prende come argomenti un predicato p e una lista xs e 
-- restituisce True se almeno un elemento di xs soddisfa il predicato p, False
-- altrimenti.
-- Fa uso di foldr, map e di una funzione anonima.

any :: (a -> Bool) -> [a] -> Bool
any p = foldr (||) False . map p 

-- Una versione alternativa utilizza length e filter.

any1 :: (Ord ([a] -> Int), Num ([a] -> Int)) => (a -> Bool) -> Bool
any1 p = length . filter p > 0