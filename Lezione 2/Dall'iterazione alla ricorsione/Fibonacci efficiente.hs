-- La funzione fibonacciAux m n i calcola l'i-esimo numero di Fibonacci a partire da m e n.

fibonacciAux :: Integer -> Integer -> Int -> Integer
fibonacciAux m _ 0 = m
fibonacciAux m n i = fibonacciAux n (m + n) (i - 1)

-- La funzione fibonacci n calcola l'n-esimo numero di Fibonacci.
-- La funzione fibonacci è un'applicazione parziale della fibonacciAux (metodo wrapper).
-- Ha complessità lineare O(n).

fibonacci :: Int -> Integer
fibonacci = fibonacciAux 0 1