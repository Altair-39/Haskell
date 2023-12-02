-- [] è la lista vuota.

-- (:) è l'operatore di costruzione di liste non vuote.

-- length calcola la lunghezza di una lista.

-- sum calcola la somma degli elementi di una lista numerica.
-- Se applicato a una lista vuota restituisce 0 (elemento neutro).

-- product calcola il prodotto degli elementi di una lista numerica.
-- Se applicato a una lista vuota restituisce 1 (elemento neutro).

-- L'append (++) concatena due liste.
-- É associativo, ma non commutativo.
-- [] è l'elemento neutro.

-- Si può definire la lista dei numeri naturali come [0..].
-- É infinita.
-- Nella lista infinita viene valutata solo la parte necessaria.
-- Per esempio head [0..] restituisce 0, perché Haskell è pigro.

-- Si può definire una lista di numeri pari come [0, 2..].

-- Si può definire una lista di numeri dispari come [1, 3..].

-- Si può definire una lista di numeri in un intervallo come [a..b].