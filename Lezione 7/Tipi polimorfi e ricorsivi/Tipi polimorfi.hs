-- Il tipo di dato Maybe è definito nel modulo Prelude di Haskell.
-- È polimorfo dato che può contenere valori di qualsiasi tipo.
-- A sinistra del simbolo = si trova il costruttore di tipo Maybe, che è un tipo di dato.
-- A destra del simbolo = si trova il costruttore di tipo Nothing, che è un valore di tipo Maybe
-- e il costruttore di tipo Just, che è una funzione che prende un valore di tipo a e restituisce
-- un valore di tipo Maybe a.

data Maybe a = Nothing | Just a

-- Si può pensare a Maybe come a una funzione che prende un tipo a e restituisce un tipo Maybe a.
-- Un tipo può avere un numero arbitrario di parametri, ad esempio il tipo Either ha due parametri.

data Either a b = Left a | Right b

-- Left e Right sono due costruttori di tipo, Left prende un valore di tipo a e restituisce un valore
-- di tipo Either a b, Right prende un valore di tipo b e restituisce un valore di tipo Either a b.
-- In questo modo si possono creare liste di valori di tipo diverso.