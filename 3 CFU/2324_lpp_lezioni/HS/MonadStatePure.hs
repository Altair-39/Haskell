{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use tuple-section" #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use camelCase" #-}

module MonadStatePure where

type State = Integer
-- "Sarebbe" (State -> (a, State)) -> S a
newtype S a = S (State -> (a, State)) 

instance Functor S where
  fmap :: (a -> b) -> S a -> S b
  fmap f x = S (\s -> let S g = x
                          (y, s') = g s
                      in (f y, s'))

instance Applicative S where
  pure :: a -> S a
  pure x = S (\s -> (x, s))
  
-- Per costruire (<*>) è utile dettagliare la struttura
-- degli elementi che appartengono ai sottotipi di:
--
--        S (a -> b) -> S a -> S b
-- 
-- Abbiamo:
--
--        S [f::(State -> (h::a->b, s'::State))]  
--        -> S [g::(State -> (x::a, s'':State))]   (**) 
--        -> S [State -> (b, State)]
--
-- Il risultato deve essere un funzione di tipo:
--
--        State -> (b, State)
-- 
-- nella terza riga che compone il tipo completo (**).
-- 
-- Lo State iniziale può essere usato come argomento per
-- f che "libera" la funzione h e uno State intermedio s'.
--
-- Lo State s' può essere usato come argomento della 
-- funzione g che costituisce il 2do argomento di <*>.
-- 
-- Dall'applicazione (g s') si ottiene la coppia con
-- l'argomento x di h e l'ultimo stato s'', utile per
-- costruire il risultato.
--

  (<*>) :: S (a -> b) -> S a -> S b
  (<*>) (S f) (S x) = S (\s -> let (x', s') = x s
                                   (f', s'') = f s'
                               in (f' x', s''))  

instance Monad S where
  return :: a -> S a
  return = pure

-- Per costruire (>>=) si procede in analogia con quanto fatto
-- per definire (<*>). È utile dettagliare la struttura degli 
-- elementi che appartengono ai sottotipi di:
--
--            S a -> (a -> S b) -> S b
--
-- Abbiamo:
--
--      m::S [f::(State -> (x::a, s'::State))] 
--      -> g::(a -> S [h::(State -> (y::b, s''::State))]) (***)
--      -> S [State -> (b, State)]
--
-- Anche in questo caso, il risultato deve essere una funzione 
-- di tipo:
--
--        State -> (b, State)
-- 
-- nella terza riga che compone il tipo completo (***).
-- 
-- Lo State s' può essere usato come argomento della 
-- funzione h che costituisce il 2do argomento di >>=.
-- 
-- Dall'applicazione (m s') si ottiene la coppia con
-- l'argomento x di h e l'ultimo stato s'', utile per
-- costruire il risultato.
--
  (>>=) :: S a -> (a -> S b) -> S b
  (>>=) m g = S (\s -> let S f = m
                           (x, s') = f s
                           S h  = g x
                           (y, s'') = h s' 
                       in (y, s'')
                )