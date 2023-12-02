data Stream a = Cons a (Stream a)

-- La funzione forever prende un valore di tipo a e restituisce uno Stream di valori di tipo a.

forever :: a -> Stream a
forever x = Cons x (forever x)