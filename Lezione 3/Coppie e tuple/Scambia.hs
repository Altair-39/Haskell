-- La funzione scambia scambia le componenti di una coppia.

scambia :: (Int, Int) -> (Int, Int)
scambia (x, y) = (y, x)

-- Si può definire un alias per il tipo (Int, Int)

type Swap = (Int, Int)

scambia2 :: Swap -> Swap
scambia2 (x, y) = (y, x)