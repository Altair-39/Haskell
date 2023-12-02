-- La funzione match confronta due liste e restituisce True se
-- e solo se le due liste hanno almeno un elemento in comune
-- nella stessa posizione.
-- Fa uso di zip che prende due liste e restituisce una lista
-- di coppie con gli elementi delle due liste nella stessa
-- posizione.
-- Fa uso di uncurry che prende una funzione f e una coppia
-- (x, y) e restituisce f x y. 
-- uncurry è necessaria perché (==) prende due argomenti
-- e non una coppia.

match :: Eq a => [a] -> [a] -> Bool
match xs ys = any (uncurry (==)) (zip xs ys)