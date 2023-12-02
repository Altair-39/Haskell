-- La funzione putLines prende una lista di stringhe e le stampa a video, una per riga.
-- Si usa return() come ultima azione.

putLines :: [String] -> IO ()
putLines = foldr ((>>) . putStrLn) (return ())

putLinesBackward :: [String] -> IO ()
putLinesBackward = foldl (\ ac s -> putStrLn s >> ac) (return ())