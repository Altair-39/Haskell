-- La funzione maybeFilter è una generalizzazione della funzione di libreria filter.
-- La funzione maybeFilter prende una funzione e una lista e restituisce la lista
-- dei valori che soddisfano la funzione.

maybeFilter :: (a -> Bool) -> Maybe a -> Maybe a
maybeFilter p (Just x) | p x = Just x
maybeFilter _ _              = Nothing