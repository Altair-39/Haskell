{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use lambda-case" #-}

module EvalExceptionMonadicLEZIONE where

import BNumFuncApp ( BN, BinNotation ( .. ) )
import qualified BNumFuncApp as B
import BNumFuncAppVsInteger ( bN2Int, int2BN )
import Language ( Term ( .. ) )
import MonadException ( E ( .. ) )

ev :: Term -> E BN
...
  
-- TEST
ok , nok :: Term
ok  = Tdiv (Tdiv (Tcon (int2BN 1972)) 
                 (Tcon (int2BN 2   ))) 
           (Tcon (int2BN 23))
nok = Tdiv (Tcon (int2BN 1)) (Tcon (int2BN 0))

test :: IO ( )
test = do
    print "-------------- EvalException.ev"
    print (ev ok)
    print (ev nok) -- "Div by 0"
