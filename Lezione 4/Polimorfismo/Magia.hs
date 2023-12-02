-- La funzione magia può produrre un risultato di qualsiasi tipo di dato.
-- Questo perché non termina mai.

magia :: Int -> a
magia n = magia(n - 1)