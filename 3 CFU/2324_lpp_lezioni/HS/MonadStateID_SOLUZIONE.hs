{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use tuple-section" #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use camelCase" #-}

module MonadStateID_SOLUZIONE where
import MonadID ( ID  ( .. ) )

type State = Integer
newtype S a where
  ID :: (State -> (a, State)) -> S a

instance Functor S where
  fmap :: (a -> b) -> S a -> S b
  fmap f (ID g) = ID $ \s -> let (y, s') = g s
                             in (f y, s')


instance Applicative S where
  pure :: a -> S a
  pure x = ID (\s -> (x, s))

  (<*>) :: S (a -> b) -> S a -> S b
  (<*>) (ID f) (ID g) = ID (\s -> let (x, s') = g s
                                      (h, s'') = f s'
                                  in (h x, s''))

instance Monad S where
  return :: a -> S a
  return = pure

  (>>=) :: S a -> (a -> S b) -> S b
  (>>=) (ID f) g = ID (\s -> let (x, s') = f s
                                 ID h = g x 
                             in h s')



