-- La funzione insert è un'ausiliaria che inserisce un elemento in una lista ordinata.
-- Se la lista è vuota, allora l'elemento da inserire è l'unico elemento della lista.
-- Se l'elemento da inserire è minore o uguale al primo elemento della lista, allora
-- l'elemento da inserire è il primo elemento della lista.
-- Altrimenti, l'elemento da inserire è il primo elemento della lista concatenato con
-- l'inserimento dell'elemento nella coda della lista (che è, per definizione, ordinata).

insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y : ys) | x <= y    = x : y : ys
                  | otherwise = y : insert x ys

-- La funzione insertSort è l'algoritmo di ordinamento per inserimento.
-- Se la lista è vuota, allora la lista ordinata è vuota.
-- Altrimenti, la lista ordinata è l'inserimento del primo elemento della lista
-- ordinata nella lista ordinata ottenuta ordinando la coda della lista.

insertSort :: [Int] -> [Int]
insertSort []       = []
insertSort (x : xs) = insert x (insertSort xs)