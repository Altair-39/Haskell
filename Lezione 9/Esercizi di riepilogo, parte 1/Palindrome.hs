-- La funzione palindroma verifica se una stringa è palindroma.
-- interact serve per leggere da standard input e scrivere su standard output.

import Data.Char (isAlpha, toLower)

palindroma :: String -> Bool
palindroma s = s == reverse s

process :: String -> String
process s | palindroma t = s
          | otherwise    = ""
  where
    t = map toLower (filter isAlpha s)

main :: IO ()
main = interact (concatMap process . lines)
