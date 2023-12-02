import Data.Char (toUpper)

-- Questa versione di Parrot usa la notazione do.

parrot :: IO ()
parrot = do s <- getLine
            if null s then return ()
                      else do putStrLn (map toUpper s)
                              parrot