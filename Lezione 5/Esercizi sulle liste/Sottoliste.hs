-- La funzione sottoliste prende in input una lista e restituisce 
-- la lista delle sottoliste della lista fornita in input.

sottoliste :: [a] -> [[a]]
sottoliste [] = [[]]
sottoliste (x : xs) = sottoliste xs ++ map (x :) (sottoliste xs)