import Data.Char (toUpper) -- converte caratteri minuscoli in maiuscoli

-- La funzione parrot legge una riga da tastiera e la stampa a video in maiuscolo. Se la riga
-- è vuota, termina. Altrimenti, stampa la riga in maiuscolo e si richiama ricorsivamente.

parrot :: IO ()
parrot = getLine >>= \s ->
         if null s then return ()
         else putStrLn (map toUpper s) >> parrot

main :: IO ()
main = parrot