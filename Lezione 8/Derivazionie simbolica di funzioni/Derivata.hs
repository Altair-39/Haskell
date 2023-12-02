data Fun = X
         | Con Int
         | Fun :+: Fun
         | Fun :*: Fun
         | Fun :-: Fun
         | Fun :^: Int

-- La funzione derive calcola la derivata di una funzione.

derive :: Fun -> Fun
derive X         = Con 1
derive (Con _)   = Con 0
derive (f :+: g) = derive f :+: derive g
derive (f :-: g) = derive f :-: derive g
derive (f :*: g) = f :*: derive g :+: derive f :*: g
derive (f :^: n) = Con n :*: f :^: (n - 1) :*: derive f