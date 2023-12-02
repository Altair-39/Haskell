-- Il tipo di dato Giorno è un tipo enumerato che ha sette valori: 
-- Lun, Mar, Mer, Gio, Ven, Sab, Dom. Ha anche Show, quindi è possibile stampare i valori.
-- Ha anche Eq, quindi è possibile confrontare i valori.

data Giorno = Lun | Mar | Mer | Gio | Ven | Sab | Dom
    deriving (Show, Eq)

-- La funzione domani prende un giorno e restituisce il giorno successivo.

domani :: Giorno -> Giorno
domani day | day == Lun = Mar
           | day == Mar = Mer
           | day == Mer = Gio
           | day == Gio = Ven
           | day == Ven = Sab
           | day == Sab = Dom
           | day == Dom = Lun

-- La funzione fra prende un numero intero e un giorno e restituisce il giorno che
-- si ottiene dopo il numero di giorni indicato dal numero intero.

fra :: Int -> Giorno -> Giorno
fra = \x -> \day ->
    case x of
        0 -> day
        _ -> fra (x - 1) (domani day)

-- La funzione fra2 è equivalente a fra, ma è scritta con replicate.
-- Replicate prende un numero intero e un valore e restituisce una lista con il
-- valore ripetuto il numero di volte indicato dal numero intero.

fra2 :: Int -> Giorno -> Giorno
fra2 x = foldr (.) id (replicate x domani)