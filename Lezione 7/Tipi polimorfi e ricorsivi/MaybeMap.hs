-- La funzione maybeMap è una generalizzazione della funzione di libreria map.
-- La funzione map prende una funzione e una lista e applica la funzione a
-- tutti gli elementi della lista.

maybeMap :: (a -> b) -> Maybe a -> Maybe b
maybeMap _ Nothing  = Nothing
maybeMap f (Just x) = Just (f x)