-- Definiamo il tipo Matrice per rappresentare le matrici 2x2.
-- La funzione fibonacci può essere rappresentata efficientemente in complessità logaritmica O(log n).
-- Per fare ciò basta notare che si può esprimere in termini di potenze.

type Matrice = (Integer, Integer, Integer, Integer)

-- Definiamo la moltiplicazione tra matrici.

mul :: Matrice -> Matrice -> Matrice
mul (a₁₁, a₁₂, a₂₁, a₂₂) (b₁₁, b₁₂, b₂₁, b₂₂) =
  (a₁₁ * b₁₁ + a₁₂ * b₂₁,
   a₁₁ * b₁₂ + a₁₂ * b₂₂,
   a₂₁ * b₁₁ + a₂₂ * b₂₁,
   a₂₁ * b₁₂ + a₂₂ * b₂₂)

-- Definiamo la potenza di una matrice.

pow :: Matrice -> Int -> Matrice
pow a k | k == 0         = (1, 0, 0, 1)
        | even k = b `mul` b
        | otherwise      = a `mul` b `mul` b
  where
    b = a `pow` (k `div` 2)

-- Definiamo la funzione fibonacci.
-- fibonacci k è il k-esimo numero di fibonacci.
-- Questa rappresentazione è più efficiente delle due precedenti.

fibonacci :: Int -> Integer
fibonacci k = risultato
  where
    (_, risultato, _, _) = (1, 1, 1, 0) `pow` k