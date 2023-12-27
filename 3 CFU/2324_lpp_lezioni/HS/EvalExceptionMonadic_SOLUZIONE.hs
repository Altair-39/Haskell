{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use lambda-case" #-}

module EvalExceptionMonadic_SOLUZIONE where

import BNumFuncApp ( BN, BinNotation ( .. ) )
import qualified BNumFuncApp as B
import BNumFuncAppVsInteger ( bN2Int, int2BN )
import Language ( Term ( .. ) )
import MonadException ( E ( .. ) )

ev :: Term -> E BN
ev (Tcon b) = return b
ev (Tdiv n d) =
    (ev n) >>= 
        (\bn -> (ev d) >>=
            (\bd -> if (bd == N0) 
                    then Rise "Div. by 0"
                    else return (B.div bn bd)))
  
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
