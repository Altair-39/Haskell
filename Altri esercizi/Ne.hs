diverso :: Eq a => [a] -> [a] -> Bool
diverso xs ys = any (\x -> all (x /=) ys) xs

diverso1 :: Eq a => [a] -> [a] -> Bool
diverso1 []  _ = False
diverso1 (x : xs) (y : ys) = (x : xs) ys = aux x ys || diverso_ric xs ys
  where
    aux _ [] = True
    aux x (y : ys) = x /= y && aux x ys