data Stream a = Cons a (Stream a)

-- La funzione from prende un valore di tipo a e restituisce uno Stream di valori di tipo a.
-- Essa itera sul successore del valore x.

from :: Enum a => a -> Stream a
from x = Cons x (from (succ x))