-- Un'applicazione si può scrivere in notazione infissa usando i backticks.
-- Per esempio la somma dei primi n numeri naturali si può scrivere come:

somma :: Int -> Int
somma n = n * (n + 1) `div` 2

-- Un'applicazione si può scrivere in notazione prefissa.
-- Per esempio la somma dei primi n numeri naturali si può scrivere come:

somma2 :: Int -> Int
somma2 n = div (n * (n + 1)) 2