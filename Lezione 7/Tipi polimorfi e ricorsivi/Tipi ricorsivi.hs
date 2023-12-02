-- Si possono definire tipi in funzione di se stessi, ad esempio il tipo delle liste è definito come:

data List a = Nil | Cons a (List a)

-- Nil e Cons sono due costruttori di tipo, Nil è una lista vuota, Cons prende un valore di tipo a e una
-- lista di valori di tipo a e restituisce una lista di valori di tipo a.
-- Questo permette di generare liste in funzione di liste.

-- Uno Stream è una lista infinita di valori di tipo a.

-- data Stream a = Cons a (Stream a)