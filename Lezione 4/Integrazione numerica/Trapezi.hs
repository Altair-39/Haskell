-- La funzione trapezi calcola l'approssimazione dell'integrale
-- definito di una funzione f tra a e b usando la formula dei
-- trapezi con n intervalli.

trapezi :: (Double -> Double) -> Double -> Double -> Int -> Double
trapezi f a b n = aux 0 a n
  where
    aux area _ 0 = area
    aux area a n = aux (area + (f a + f (a + h)) * h / 2) (a + h) (n - 1)

    h = (b - a) / fromIntegral n

-- La funzione trapezi1 è una versione alternativa di trapezi
-- che usa la funzione sum e le funzioni map e zip.

trapezi1 :: (Double -> Double) -> Double -> Double -> Int -> Double
trapezi1 f a b n = sum as
  where
    zs = map (\i -> f (a + fromIntegral i * h)) [0..n]
    as = map (\(x, y) -> (x + y) * h / 2) (zip zs (tail zs))
    h  = (b - a) / fromIntegral n

-- La funzione trapezi2 è una versione alternativa di trapezi
-- che usa la funzione sum e le funzioni map e zipWith.

trapezi2 :: (Double -> Double) -> Double -> Double -> Int -> Double
trapezi2 f a b n = sum as
  where
    zs = map (\i -> f (a + fromIntegral i * h)) [0..n]
    as = zipWith (\ x y -> (x + y) * h / 2) zs (tail zs)
    h  = (b - a) / fromIntegral n