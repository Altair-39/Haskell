-- Una funzione che ha come codominio Bool è detta predicato.
-- Essa stabilisce se una proprietà è vera o falsa.

pari :: Int -> Bool
pari n = n `mod` 2 == 0

-- La funzione dispari è definita in termini di pari.
-- É una composizione di funzioni.
-- dispari non dà alcun nome al suo argomento.
-- Si limita a dire che dispari è ottenuta componendo not e pari.

dispari :: Int -> Bool
dispari = not . pari