inversioni :: Ord a => [a] -> Int
inversioni xs = length $ filter (uncurry (>)) $ zip xs (tail xs)

inversioni1 :: Ord a => [a] -> Int
inversioni1 (x : y : xs) | x > y     = 1 + inversioni1 (y : xs)
                         | otherwise = inversioni (y : xs)
inversioni1 _ = 0