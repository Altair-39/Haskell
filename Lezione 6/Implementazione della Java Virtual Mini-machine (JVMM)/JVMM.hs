-- Per iniziare a costruire la JVMM, definiamo degli alias per i tipi di dato che ci serviranno.

type Value = Int
type Var   = Int
type Stack = [Value]
type Frame = [Value]

-- La funzione load prende un indice e un frame e restituisce il valore in posizione indice nel frame.
-- Il valore viene messo in cima allo stack. Se la variabile non esiste viene implicitamente inizializzata
-- a 0.

load :: Var -> Frame -> Value
load _ []       = 0
load 0 (v : _)  = v
load n (_ : vs) = load (n - 1) vs

-- La funzione store prende un indice, un valore e un frame e restituisce il frame con il valore inserito 
-- in posizione indice. Il valore viene rimosso dallo stack.

store :: Var -> Value -> Frame -> Frame
store 0 v []       = [v]
store 0 v (_ : vs) = v : vs
store n v []       = 0 : store (n - 1) v []
store n v (w : vs) = w : store (n - 1) v vs

-- Il tipo di dato Instruction rappresenta le istruzioni della JVMM. Le istruzioni sono:

data Instruction
  = PUSH Value
  | LOAD Var
  | STORE Var
  | OP (Value -> Value -> Value)
  | IF (Value -> Value -> Bool) Code
  | DUP 
  | SWAP
  | POP
  | NOP
  | UOP (Value -> Value)
  | RETURN

-- Il codice di un programma è una lista di istruzioni.

type Code = [Instruction]

-- La funzione run prende un codice, un frame e restituisce il valore in cima allo stack dopo l'esecuzione
-- del codice. Fa uso di aux che prende in più uno stack e restituisce il valore in cima allo stack dopo
-- l'esecuzione del codice.

-- PUSH: mette il valore in cima allo stack.
-- LOAD: mette in cima allo stack il valore in posizione indice nel frame.
-- STORE: sostituisce il valore in posizione indice nel frame con il valore in cima allo stack.
-- OP: applica l'operatore binario in cima allo stack ai due valori in cima allo stack e mette il risultato
--     in cima allo stack.
-- IF: se il predicato è vero esegue il codice, altrimenti lo salta.
-- DUP: mette in cima allo stack una copia del valore in cima allo stack.
-- SWAP: scambia i due valori in cima allo stack.
-- POP: rimuove il valore in cima allo stack.
-- NOP: non fa nulla.
-- UOP: applica l'operatore unario in cima allo stack al valore in cima allo stack e mette il risultato
--      in cima allo stack.

run :: Code -> Frame -> Value
run = aux []
  where
    aux :: Stack -> Code -> Frame -> Value
    aux [v]     (RETURN : _)   _  = v
    aux vs           (PUSH v : is)  fr = aux (v : vs) is fr
    aux vs           (LOAD x : is)  fr = aux (load x fr : vs) is fr
    aux (v : vs)     (STORE x : is) fr = aux vs is (store x v fr)
    aux (w : v : vs) (OP f : is)    fr = aux (f v w : vs) is fr
    aux (w : v : vs) (IF p is : _)  fr | p v w = aux vs is fr
    aux (_ : _ : vs) (IF _ _ : is)  fr = aux vs is fr
    aux (v : vs)     (DUP : is)     fr = aux (v : v : vs) is fr
    aux (w : v : vs) (SWAP : is)    fr = aux (v : w : vs) is fr
    aux (_ : vs)     (POP : is)     fr = aux vs is fr
    aux vs           (NOP : is)     fr = aux vs is fr
    aux (v : vs)     (UOP f : is)   fr = aux (f v : vs) is fr

-- Esempio di codice: il fattoriale.

fattoriale :: Code
fattoriale = init
  where
    init = PUSH 1 :
           STORE res :
           loop
    loop = LOAD n :
           PUSH 0 :
           IF (==) fine :
           LOAD n :
           LOAD res :
           OP (*) :
           STORE res :
           LOAD n :
           PUSH 1 :
           OP (-) :
           STORE n :
           loop
    fine = [LOAD res, RETURN]
    n    = 0
    res  = 1

-- Esempio di codice: fibonacci.

fibonacci :: Code
fibonacci = init
  where
    init = PUSH 0 :
           STORE m :
           PUSH 1 :
           STORE n :
           loop
    loop = LOAD k :
           PUSH 0 :
           IF (==) fine :
           LOAD n :
           LOAD n :
           LOAD m :
           OP (+) :
           STORE n :
           STORE m :
           LOAD k :
           PUSH 1 :
           OP (-) :
           STORE k :
           loop
    fine = [LOAD m, RETURN]
    k    = 0
    m    = 1
    n    = 2

-- Esempio di codice: massimo comun divisore con l'algoritmo di Euclide.

euclide :: Code
euclide = loop
  where
    loop = LOAD m :
           PUSH 0 :
           IF (==) fine :
           LOAD m :
           LOAD n :
           IF (<) less :
           LOAD m :
           LOAD n :
           OP (-) :
           STORE m :
           loop
    less = LOAD m :
           LOAD n :
           STORE m :
           STORE n :
           loop
    fine = [LOAD n, RETURN]
    m    = 0
    n    = 1