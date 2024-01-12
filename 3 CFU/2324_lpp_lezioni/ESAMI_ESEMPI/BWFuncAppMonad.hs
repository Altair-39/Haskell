-- Sia data la seguente definizione di tipo di dato:
{-# LANGUAGE GADTs #-}
{-# LANGUAGE InstanceSigs #-}
data BW a where
    BW :: (a, a) -> BW a 

-- DOMANDA 1
-- costruire una istanza di Functor con BW

instance Functor BW where
    fmap :: (a -> b) -> BW a -> BW b
    fmap f (BW (x, y)) = BW (f x, f y)

-- DOMANDA 2
-- costruire una istanza di Applicative con BW
instance Applicative BW where
    pure :: a -> BW a
    pure x = BW (x, x)

    (<*>) :: BW (a -> b) -> BW a -> BW b
    (<*>) (BW (f, g)) (BW (x, y)) = BW (f x, g y)
    
-- DOMANDA 3
-- costruire una istanza di Monad con BW
instance Monad BW where
    return = pure

    (>>=) :: BW a -> (a -> BW b) -> BW b
    (>>=) (BW (x, y)) f = let BW (a, b) = f x in BW (a, b)

-- DOMANDA 4
-- È possibile immaginare più definizioni della 
-- funzione bind, rispondendo alla DOMANDA 3?
-- In caso positivo, fornirne una.
-- Sì, es:
--    (>>=) :: BW a -> (a -> BW b) -> BW b
--    (>>=) (BW (x, y)) f = let BW (a, b) = f y in BW (a, b)