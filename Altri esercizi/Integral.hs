lastp :: Integral a => [a] -> Maybe a
lastp xs = if ((filter (even) xs) == []) 
    then Nothing
    else Just (head ((reverse (filter (even) xs))))

lastp1 :: Integral a => [a] -> Maybe a
lastp1 = aux Nothing
  where
    aux ris [] = ris
    aux _ (x : xs) | x `mod` 2 == 0 = aux (Just x) xs
    aux ris (_ : xs) = aux ris xs