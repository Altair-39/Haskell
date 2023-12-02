-- Il tipo Numero contiene due costruttori con argomenti: I e F. I prende un Int e F prende un Float.

data Numero = I Int | F Float
    deriving Show

-- La funzione somma prende due numeri e restituisce la somma dei due numeri.
-- Se i due numeri sono interi restituisce un intero, altrimenti restituisce un float.

somma :: Numero -> Numero -> Numero
somma (I m) (I n) = I (m + n)
somma (I m) (F n) = F (fromIntegral m + n)
somma (F m) (I n) = F (m + fromIntegral n)
somma (F m) (F n) = F (m + n)

-- La funzione sommatoria prende una lista di numeri e restituisce la loro somma.

sommatoria :: [Numero] -> Numero
sommatoria = foldr somma (I 0)