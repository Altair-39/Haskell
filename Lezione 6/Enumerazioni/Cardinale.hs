-- Il tipo di dato PuntoCardinale è un tipo enumerato che ha quattro valori: Nord,
-- Sud, Ovest, Est. Ha anche Show, quindi è possibile stampare i valori.

data PuntoCardinale = Nord | Sud | Ovest | Est
    deriving Show

-- La funzione sinistra prende un punto cardinale e restituisce il punto cardinale
-- che si ottiene girando a sinistra.

sinistra :: PuntoCardinale -> PuntoCardinale
sinistra Nord  = Est
sinistra Est   = Sud
sinistra Sud   = Ovest
sinistra Ovest = Nord

-- La funzione destra prende un punto cardinale e restituisce il punto cardinale
-- che si ottiene girando a destra. Non utilizza il pattern matching, ma si basa
-- sulla funzione sinistra.

destra :: PuntoCardinale -> PuntoCardinale
destra = indietro . sinistra

-- La funzione indietro prende un punto cardinale e restituisce il punto cardinale
-- che si ottiene girando di 180 gradi. Non utilizza il pattern matching, ma si basa
-- sulla funzione sinistra.

indietro :: PuntoCardinale -> PuntoCardinale
indietro = sinistra . sinistra