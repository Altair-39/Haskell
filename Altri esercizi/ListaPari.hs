pari :: [a] -> [a]
pari  = map snd . filter (even . fst) . zip [0..]

pari1 :: [a] -> [a]
pari1 []           = []
pari1 (x : _ : xs) = x : pari xs 