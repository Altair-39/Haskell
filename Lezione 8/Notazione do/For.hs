-- La funzione for simula l'iterazione su una lista.

for :: [a] -> (a -> IO ()) -> IO ()
for []       _ = return ()
for (x : xs) f = do f x
                    for xs f