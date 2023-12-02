-- Le guardie sono una sintassi alternativa per le condizioni
-- Se è vera una condizione si esegue la corrispondente espressione.
-- In questo esempio si calcola il valore assoluto di un numero.

assoluto :: Int -> Int
assoluto n | n >= 0 = n
           | n < 0  = negate n

-- Alternativamente si può usare otherwise.
-- otherwise è una clausola di default il cui valore è sempre True.

assoluto2 :: Int -> Int
assoluto2 n | n >= 0    = n
            | otherwise = negate n