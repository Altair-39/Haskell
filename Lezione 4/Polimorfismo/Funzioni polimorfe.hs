-- Esistono funzioni che non dipendono dal particolare tipo di dato su cui
-- operano. Queste funzioni sono dette funzioni polimorfe. Un esempio è la
-- funzione identità:

id x = x

-- La funzione id è polimorfa perché può essere forzata ad operare su
-- qualsiasi tipo di dato. Per esempio, se vogliamo che la funzione id
-- operi su interi, possiamo scrivere: id :: Int -> Int. Se invece
-- vogliamo che operi su booleani, possiamo scrivere: id :: Bool -> Bool.
-- In generale, se vogliamo che operi su un tipo di dato a, possiamo
-- scrivere: id :: a -> a. Questa notazione è detta "polimorfismo
-- parametrico". Il tipo di dato a è detto "variabile di tipo" o
-- "parametro di tipo". 

id :: a -> a

-- I tipi Int e Bool sono detti "istanze" del tipo di dato a. In
-- generale, un tipo di dato a è detto "polimorfo" se ha almeno una
-- istanza. 

-- In una lista possiamo inserire elementi di qualsiasi tipo di dato. Per
-- esempio, possiamo scrivere: [1,2,3] :: [Int] o [True,False] :: [Bool].
-- Una volta scelto il tipo di dato degli elementi della lista, non
-- possiamo più inserire elementi di un altro tipo. Per esempio, non
-- possiamo scrivere [1,2,True] :: [Int] perché True non è un intero.

-- L'operatore di composizione funzionale (.) è polimorfo. Per esempio,
-- possiamo scrivere: (.) :: (a -> b) -> (c -> a) -> (c -> b). Questo
-- significa che se f :: a -> b e g :: c -> a, allora (f . g) :: c -> b.