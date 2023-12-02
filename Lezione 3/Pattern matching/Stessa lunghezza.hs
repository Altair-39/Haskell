-- La funzione stessaLunghezza verifica se due liste hanno la stessa lunghezza.
-- La seguente definizione usa il pattern matching.

stessaLunghezza :: [Int] -> [Int] -> Bool
stessaLunghezza xs ys = length xs == length ys

-- Si può realizzare in modo più efficiente.
-- Questa implementazione è più efficiente perché se la prima lista è più corta della seconda,
-- allora non è necessario calcolare la lunghezza della seconda lista.
-- Per esempio se la prima lista è finita e la seconda è infinita, allora la funzione termina.

stessaLunghezza2 :: [Int] -> [Int] -> Bool
stessaLunghezza2 []       []       = True
stessaLunghezza2 []       _        = False
stessaLunghezza2 _        []       = False
stessaLunghezza2 (_ : xs) (_ : ys) = stessaLunghezza2 xs ys