-- La funzione perfetto prende un intero n e restituisce True se 
-- e solo se n è un numero perfetto.

perfetto :: Int -> Bool
perfetto n = n == sum (filter ((== 0) . (n `mod`)) [1 .. n - 1])