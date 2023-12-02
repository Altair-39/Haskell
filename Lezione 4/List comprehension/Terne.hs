-- La funzione terne restituisce la lista delle terne pitagoriche aventi i lati minori o uguali a n.
-- La funzione è definita utilizzando una list comprehension.
-- Si utilizza la funzione ausiliaria coprimi per generare solo le terne primitive.
-- mcd è la funzione che calcola il massimo comune divisore tra due numeri.

terne :: Int -> [(Int, Int, Int)]
terne n = [ (a, b, c) | a <- [1..n]
                      , b <- [a + 1..n]
                      , c <- [b + 1..n]
                      , coprimi a b, a^2 + b^2 == c^2 ]
  where
    coprimi a b = mcd a b == 1

    mcd 0 n = n
    mcd m n | m > n = mcd n m
    mcd m n = mcd m (n - m)