-- La funzione curry prende come argomenti una funzione f e due valori x e y
-- e restituisce la funzione f applicata alla coppia (x, y).

curry f x y = f (x, y)

-- La funzione uncurry prende come argomenti una funzione f e una coppia (x,
-- y) e restituisce la funzione f applicata agli argomenti x e y.

uncurry f (x, y) = f x y