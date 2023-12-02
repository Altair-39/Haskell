-- La funzione primo restituisce True se il numero passato come argomento è primo,
-- False altrimenti.
-- La funzione è definita utilizzando una list comprehension.
-- Viene generata la lista dei divisori di n, e si controlla che tale lista sia 
-- uguale alla lista contenente solo n.

primo :: Integral a => a -> Bool
primo n = [ d | d <- [2..n], mod n d == 0 ] == [n]