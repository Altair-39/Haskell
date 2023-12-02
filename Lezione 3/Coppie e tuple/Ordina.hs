-- La funzione ordina ordina tre numeri Int in una tupla in ordine crescente.

ordina :: (Int, Int, Int) -> (Int, Int, Int)
ordina (x, y, z) | x >= y && y >= z          = (z, y, x)
                 | x >= y && y < z  && x > z = (y, z, x)
                 | x < y  && y < z           = (x, y, z)
                 | x > y  && y < z           = (y, x, z)
                 | x < y  && y >= z && z > x = (x, z, y) 
                 | x < y  && y >= z          = (z, x, y)

-- Una versione alternativa e più leggibile è la seguente.

ordina2 :: (Int, Int, Int) -> (Int, Int, Int)
ordina2 (x, y, z) | z > y = ordina (y, x, z)
ordina2 (x, y, z) | y > z = ordina (x, z, y)
ordina2 x = x