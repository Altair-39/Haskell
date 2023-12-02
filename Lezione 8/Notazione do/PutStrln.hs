
for :: [a] -> (a -> IO ()) -> IO ()
for []       _ = return ()
for (x : xs) f = do f x
                    for xs f


putStrLn :: String -> IO ()
putStrLn s = do for s putChar
                putChar '\n'
