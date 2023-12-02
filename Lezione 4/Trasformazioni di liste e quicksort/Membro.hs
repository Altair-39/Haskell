-- La funzione membro prende come argomenti un elemento x e una lista xs e 
-- restituisce True se x è un elemento di xs, False altrimenti.
-- Fa uso di any e di una funzione anonima.
-- Any è una funzione che prende come argomenti un predicato p e una lista xs e
-- restituisce True se almeno un elemento di xs soddisfa il predicato p, False
-- altrimenti.
-- Any si ferma non appena trova un elemento che soddisfa il predicato, perchè
-- è una sequenza di ||.

membro :: Eq a => a -> [a] -> Bool
membro x = any(== x)