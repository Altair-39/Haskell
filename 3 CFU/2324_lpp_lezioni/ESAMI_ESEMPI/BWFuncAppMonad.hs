-- Sia data la seguente definizione di tipo di dato:

data BW a where
    BW :: (a, a) -> BW a 

-- DOMANDA 1
-- costruire una istanza di Functor con BW

-- DOMANDA 2
-- costruire una istanza di Applicative con BW

-- DOMANDA 3
-- costruire una istanza di Monad con BW

-- DOMANDA 4
-- È possibile immaginare più definizioni della 
-- funzione bind, rispondendo alla DOMANDA 3?
-- In caso positivo, fornirne una.