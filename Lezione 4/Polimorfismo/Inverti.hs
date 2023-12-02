-- La funzione inverti inverte l'ordine degli elementi di una lista.
-- Al contrario della versione nella lezione 3, questa versione non 
-- utilizza append.
-- Fa uso di una funzione ausiliaria acc che prende come argomenti una lista
-- xs e una lista ys e restituisce la lista ys alla quale sono stati
-- aggiunti gli elementi di xs in ordine inverso.

inverti :: [a] -> [a]
inverti xs          = acc xs []
  where
    acc []     ys   = ys
    acc (x:xs) ys   = acc xs (x:ys)