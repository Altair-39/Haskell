-- La funzione foldr prende come argomenti una funzione f, un elemento x
-- e una lista xs e restituisce il risultato di applicare f a tutti gli elementi
-- di xs, partendo da destra e usando x come elemento neutro.
-- Essa ha associatività destra, cioè si può scrivere f x1 (f x2 (f x3 x4)).

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ x []       = x
foldr f x (y : ys) = f y (Prelude.foldr f x ys)