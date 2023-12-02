-- La funzione foldl prende come argomenti una funzione f, un elemento x e 
-- una lista xs e restituisce il risultato di applicare f a tutti gli elementi
-- di xs, partendo da sinistra e usando x come elemento neutro.

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl _ x []       = x
foldl f x (y : ys) = Prelude.foldl f (f x y) ys