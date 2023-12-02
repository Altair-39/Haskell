-- La funzione somma è una rappresentazione alternativa della stessa funzione
-- vista nella lezione 6. In questo caso si utilizza Either per rappresentare
-- il tipo di ritorno della funzione, che può essere Int o Float.

somma :: Either Int Float -> Either Int Float -> Either Int Float
somma (Left m)  (Left n)  = Left (m + n)
somma (Left m)  (Right n) = Right (fromIntegral m + n)
somma (Right m) (Left n)  = Right (m + fromIntegral n)
somma (Right m) (Right n) = Right (m + n)