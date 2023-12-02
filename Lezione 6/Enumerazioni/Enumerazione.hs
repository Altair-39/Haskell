-- L'enumerazione è un tipo di dato che ha un numero finito di valori. Per esempio,
-- Bool che ha due valori: True e False.
-- Si possono definire enumerazioni anche con tipi di dato definiti dall'utente.

-- La definizione di un nuovo tipo è diversa da un'alias di tipo. Un alias di tipo
-- è un sinonimo per un tipo già esistente, mentre un nuovo tipo è un tipo diverso
-- da tutti gli altri.

-- Per definire un tipo di dato nuovo si usa la parola chiave data. Per esempio:

data Mossa = Sasso | Carta | Forbice 
    deriving Show

-- La parola chiave data è seguita dal nome del nuovo tipo di dato, che è Mossa.
-- Il tipo Mossa ha tre valori: Sasso, Carta e Forbice. Questi valori sono chiamati
-- costruttori di dati. Il tipo Mossa è un tipo enumerato, perché ha un numero
-- finito di valori. Mossa è incompatibile con tutti gli altri tipi di dato.
-- Se si effettua :type Sasso, si ottiene che Sasso ha tipo Mossa. 
-- derivin Show è necessario per poter stampare il tipo di dato. Il deriving
-- può essere considerato come un "extends" di Java.

vince :: Mossa -> Mossa -> Int
vince Sasso Carta = 2
vince Sasso Forbice = 1
vince Carta Sasso = 1
vince Carta Forbice = 2
vince Forbice Sasso = 2
vince Forbice Carta = 1
vince _ _ = 0

-- La funzione vince prende due mosse e restituisce 1 se ilmprimo giocatore vince,
-- 2 se vince il secondo giocatore, 0 se è pareggio. 

morra :: [Mossa] -> [Mossa] -> Int
morra []    [] = 0
morra _     [] = 1
morra []     _  = 2
morra (x:xs) (y:ys) | vincitore /= 0 = vincitore
                    | otherwise = morra xs ys
    where vincitore = vince x y

-- La funzione morra prende due liste di mosse e restituisce 1 se vince il primo
-- giocatore, 2 se vince il secondo giocatore, 0 se è pareggio. Se una delle due
-- liste è più corta dell'altra, vince il giocatore che ha giocato più mosse.

-- Un caso estremo di enumerazione è il tipo unitario, che ha un solo valore.
-- Il valore unitario è scritto come () e ha tipo (). Il tipo unitario è usato
-- per indicare che una funzione non restituisce nulla di interessante o non
-- termina.