-- La funzione maybeLength è una generalizzazione della funzione di libreria length.
-- La funzione maybeLength prende una lista e restituisce la sua lunghezza.

maybeLength :: Maybe a -> Int
maybeLength Nothing  = 0
maybeLength (Just _) = 1