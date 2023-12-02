-- Queste funzioni servono per effettuare calcoli su numeri complessi visti come coppie.

somma :: (Double, Double) -> (Double, Double) -> (Double, Double)
somma (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

sottrazione :: (Double, Double) -> (Double, Double) -> (Double, Double)
sottrazione (x1, y1) (x2, y2) = (x1 - x2, y1 - y2)

negazione :: (Double, Double) -> (Double, Double)
negazione (x, y) = sottrazione (0, 0) (x, y) 

-- Dato che usiamo molte volte il tipo (Double, Double) è possibile sostituirlo con un alias.

type Complesso = (Double, Double)

sommaC :: Complesso -> Complesso -> Complesso
sommaC (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

sottrazioneC :: Complesso -> Complesso -> Complesso
sottrazioneC (x1, y1) (x2, y2) = (x1 - x2, y1 - y2)

negazioneC :: Complesso -> Complesso
negazioneC (x, y) = sottrazione (0, 0) (x, y) 