-- Haskell è un linguaggio puro, quindi non ha effetti collaterali. Se si danno gli stessi
-- argomenti a una funzione, si ottiene sempre lo stesso risultato. Per va della lazyness
-- non è detto che la funzione venga valutata, ma se viene valutata, il risultato è sempre
-- lo stesso (inoltre è difficile prevederne l'ordine).

-- In Haskell esiste la funzione print, che prende un valore di tipo Show e lo stampa a
-- video. Print ha tipo Show a => a -> IO (), dove IO è un'intenzione di azione di input/output 
-- che non restituisce nulla (void). 
-- Le azioni di input/output sono eseguite dal SO, non da Haskell. 

-- Una monade ha:
-- 1. Un costruttore di tipo m;
-- 2. Una funzione return che applicata a un valore v di tipo a crea un'azione m a che, se
-- eseguita, non ha alcun effetto e restituisce v;
-- 3. Un operatore di composizione/bind (>>=) che prende un'azione m a e una funzione
-- che prende un valore di tipo a e restituisce un'azione m b;
-- 4. Altre funzioni specifiche della monade.

-- return  :: Monad m => a -> m a
-- (>>=)   :: Monad m => m a -> (a -> m b) -> m b

-- Inoltre è anche presente l'operatore >> (and them) che ignora il valore della prima azione.

-- (>>) :: Monad m => m a -> m b -> m b
-- m >> n = m >>= const n

-- putChar è una funzione che prende un carattere e restituisce un'azione di tipo IO () che
-- stampa il carattere a video. Usando questa funzione, si possono creare delle funzioni
-- più complesse.

putStrLn2 :: String -> IO ()
putStrLn2 []     = putChar '\n'
putStrLn2 (x:xs) = putChar x >> putStrLn xs

putStrLn3 :: String -> IO ()
putStrLn3 = foldr ((>>) . putChar) (putChar '\n')

-- getChar è una funzione che restituisce un'azione di tipo IO Char che legge un carattere
-- da tastiera. Ha tipo IO Char, perchè legge un carattere da tastiera e lo produce come
-- risultato.
-- getLine è una funzione che restituisce un'azione di tipo IO String che legge una riga
-- da tastiera. Ha tipo IO String, perchè legge una riga da tastiera e la produce come
-- risultato.