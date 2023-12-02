import System.IO (isEOF) -- isEOF legge da stdin e ritorna True se
                         -- l'input e' terminato, False altrimenti.
                         -- Nota: isEOF e' definita in System.IO
                         --       (vedi sopra).

-- SOLUZIONE 1: uso di getContents per accedere all'intero stream di
-- caratteri proveniente da stdin.

main :: IO ()
main = do s <- getContents
          putStrLn $
            " " ++ show (length $ lines s) ++
            " " ++ show (length $ words s) ++
            " " ++ show (length s)

-- SOLUZIONE 2: definizione di un'azione IO per la lettura dello
-- stream di caratteri da stdin.

getInput :: IO String
getInput = do eof <- isEOF
              if eof
                then return []
                else do c <- getChar
                        cs <- getInput
                        return (c : cs)

main2 :: IO ()
main2 =
  do s <- getInput
     putStrLn $
       " " ++ show (length $ lines s) ++
       " " ++ show (length $ words s) ++
       " " ++ show (length s)
