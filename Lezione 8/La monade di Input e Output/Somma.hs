getInt :: IO Int
getInt = getLine >>= return . read

-- La funzione somma prende un intero n e poi n interi da tastiera e ne stampa la somma.

somma :: IO ()
somma = getInt >>= aux 0
  where
    aux res 0 = putStrLn (show res)
    aux res n = getInt >>= \k -> aux (res + k) (n - 1)

-- Questa versione di somma non stampa nulla, ma restituisce la somma.

somma1 :: IO Int
somma1 = getInt >>= aux 0
  where
    aux res 0 = return res
    aux res n = getInt >>= \k -> aux (res + k) (n - 1)

main :: IO ()
main = somma1 >>= \res -> print res