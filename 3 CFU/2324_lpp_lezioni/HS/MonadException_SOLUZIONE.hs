{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant lambda" #-}

module MonadException_SOLUZIONE where


-- Passando da EvalBasic.hs a EvalException.hs 
-- abbiamo esteso l'interprete:
--
--       EvalBasic.ev:: Term -> BN
--
-- ad un interprete:
--
--       EvalException.ev:: Term -> E BN 
--
-- che, oltre a produrre il risultato di tipo BN 
-- di EvalBasic.ev:: Term -> BN produce anche qualche 
-- ulteriore effetto permesso dal costruttore E.
--
-- La lettura di:
--
--      Term -> E BN
--
-- può essere:
--
--      Preso un valore in Term, la funzione
--      produce un valore in BN, assieme a un
--      qualche effetto collaterale descritto
--      da E.


type Exception = String
data E a where
  Rise   :: Exception -> E a
  Return :: a -> E a
  deriving (Show)

instance Functor E where
  fmap :: (a -> b) -> E a -> E b
  fmap f (Rise m) = Rise m
  fmap f (Return b) = Return (f b)

instance Applicative E where 
  pure :: a -> E a
  pure = Return

  (<*>) :: E (a -> b) -> E a -> E b
  (<*>) (Rise m) _ = Rise m
  (<*>) _ (Rise m) = Rise m
  (<*>) (Return f) (Return x) = Return (f x)

instance Monad E where
  return :: a -> E a
  return = pure

  (>>=) :: E a -> (a -> E b) -> E b
  (>>=) (Rise m) _ = Rise m
  (>>=) (Return m) f = f m