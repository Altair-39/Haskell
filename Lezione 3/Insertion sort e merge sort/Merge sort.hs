-- La funzione split divide una lista in due parti, la prima delle quali
-- ha lunghezza pari alla metà della lunghezza della lista.

split :: [Int] -> ([Int], [Int])
split [] = ([], [])
split [x] = ([x], [])
split (x : y : xs) = (x : xs', y : ys')
  where
    (xs', ys') = split xs

-- La funzione merge fonde due liste ordinate in una lista ordinata.

merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys) | x <= y    = x : merge xs (y : ys)
                        | otherwise = y : merge (x : xs) ys

-- La funzione mergeSort è l'algoritmo di ordinamento per fusione.

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort xs') (mergeSort ys')
  where
    (xs', ys') = split xs

-- La funzione mergeSort2 è una versione alternativa di mergeSort.
-- La differenza è che fa uso di take e drop al posto di split.
-- Questa versione è più efficiente perché split è una funzione
-- ricorsiva che deve scorrere tutta la lista per calcolare la
-- lunghezza, mentre take e drop sono funzioni che non hanno bisogno
-- di scorrere tutta la lista.

mergeSort2 :: [Int] -> [Int]
mergeSort2 [] = []
mergeSort2 [x] = [x]
mergeSort2 xs = merge (mergeSort2 xs') (mergeSort2 ys')
  where
    xs' = take (div (length xs) 2) xs
    ys' = drop (div (length xs)  2) xs