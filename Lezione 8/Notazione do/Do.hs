-- La notazione do serve per scrivere in modo più leggibile le funzioni che lavorano con la monade IO.

-- A >> B >> C è equivalente a 
-- do
--   A
--   B
--   C

-- A >>= \x -> B x >>= \y -> C y è equivalente a
-- do
--   x <- A
--   y <- B x
--   C y