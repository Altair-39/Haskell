-- Int rappresenta numeri interi a precisione finita.

-- Integer rappresenta numeri interi a precisione arbitraria (limitata dal calcolatore).

-- Float rappresenta numeri reali a precisione singola.

-- Double rappresenta numeri reali a precisione doppia.

-- Bool rappresenta i valori di verità.

-- Si può usare :type per scoprire il tipo di un'espressione.

-- Usando :type su 1 si ottiene 1 :: Num p => p, che significa che 1 è un numero di un tipo p che è un'istanza della classe Num.

-- Usando :type su 1.0 si ottiene 1.0 :: Fractional p => p, che significa che 1.0 è un numero frazionario di un tipo p che è un'istanza della classe Fractional.

-- É possibile forzare il tipo di un'espressione, per esempio 1 :: Int.

-- In Haskell è possibile definire alias per i tipi, per esempio type String = [Char].
-- Gli alias sono utili per rendere più leggibile il codice.
-- Non sono nuovi tipi, ma solo nuovi nomi per tipi già esistenti.

-- Si possono usare le funzioni fromIntegral (da Integral a qualsiasi istanza di Num), truncate (da RealFrac a Integral, troncando il valore dopo la virgola) e
-- round (da RealFrac a Integral, arrotondando) per convertire un numero in un altro tipo.