import Data.IntMap ()
import Distribution.Simple.Utils (xargs)
-- Il tipo di dato Tree è un tipo polimorfo ricorsivo che può essere definito come segue:

data Tree a = Leaf | Branch a (Tree a) (Tree a)
    deriving Show

-- La funzione tmax prende un albero binario di ricerca e restituisce il valore massimo contenuto nell'albero.

tmax :: Tree a -> a
tmax (Branch x _ Leaf) = x
tmax (Branch _ _ r)     = tmax r

-- La funzione insert prende un valore di tipo a e un albero binario di ricerca e restituisce un albero binario di ricerca
-- che contiene il valore inserito nell'albero.

insert :: Ord a => a -> Tree a -> Tree a
insert x Leaf = Branch x Leaf Leaf
insert x t@(Branch y l r) | x == y = t
                          | x < y  = Branch y (insert x l) r
                          | x > y  = Branch y l (insert x r)

-- La funzione delete prende un valore di tipo a e un albero binario di ricerca e restituisce un albero binario di ricerca
-- che non contiene il valore eliminato dall'albero.

delete :: Ord a => a -> Tree a -> Tree a
delete _ Leaf = Leaf
delete x (Branch y t₁ t₂) | x < y = Branch y (delete x t₁) t₂
                          | x > y = Branch y t₁ (delete x t₂)
delete x (Branch _ t Leaf) = t
delete x (Branch _ Leaf t) = t
delete x (Branch _ t₁ t₂)  = Branch y (delete y t₁) t₂
  where
    y = tmax t₁

-- La funzione empty determina se un albero è vuoto.

empty :: Tree a -> Bool
empty Leaf = True
empty _    = False

-- La funzione depht calcola la profondità di un albero.

depth :: Tree a -> Int
depth Leaf             = 0
depth (Branch _ t₁ t₂) = 1 + max (depth t₁) (depth t₂)

-- La funzione elements effettua una visita in ordine infisso e restituisce la lista corrispodente.

elements :: Tree a -> [a]
elements Leaf             = []
elements (Branch x t₁ t₂) = elements t₁ ++ [x] ++ elements t₂

-- La funzione tmin prende un albero binario di ricerca e restituisce il valore massimo contenuto nell'albero.

tmin :: Tree a -> a
tmin (Branch x Leaf _) = x
tmin (Branch _ t _)    = tmin t

-- La funzione tmin prende un albero binario di ricerca e restituisce il valore massimo contenuto nell'albero.
-- Questa versione funziona anche sugli alberi vuoti.

tmint :: Tree a -> Maybe a
tmint Leaf = Nothing
tmint (Branch x t _) = case tmint t of
                        Nothing -> Just x
                        Just y -> Just y

treeSort :: Ord a => [a] -> [a]
treeSort = elements . foldr insert Leaf

-- La funzione bst restituisce True se un albero è un albero binario di ricerca, false altrimenti.

bst :: Ord a => Tree a -> Bool
bst Leaf = True
bst (Branch x t₁ t₂) = bst t₁ && bst t₂ &&
                       (empty t₁ || tmax t₁ < x) &&
                       (empty t₂ || x < tmin t₂)