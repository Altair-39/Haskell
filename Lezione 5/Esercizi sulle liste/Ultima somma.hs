-- La funzione ultimoSomma verifica se l'ultimo elemento di una lista è uguale 
-- alla somma degli altri elementi.

ultimoSomma :: (Eq a, Num a) => [a] -> Bool
ultimoSomma = aux 0
  where
    aux somma [x] = somma == x
    aux somma (x : xs) = aux (somma + x) xs

-- La funzione ultimoSomma2 verifica se l'ultimo elemento di una lista è uguale
-- alla somma degli altri elementi.
-- Questa versione la funzione reverse per invertire la lista.

ultimoSomma2 :: (Eq a, Num a) => [a] -> Bool
ultimoSomma2 xs = head ys == sum (tail ys)
  where
    ys = reverse xs