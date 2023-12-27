{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use tuple-section" #-}
{-# HLINT ignore "Avoid lambda" #-}

module EvalStateIDMonadic_SOLUZIONE where

import BNumFuncApp ( BN, BinNotation ( .. ) )
import qualified BNumFuncApp as B
import BNumFuncAppVsInteger ( bN2Int, int2BN )
import Language ( Term ( .. ) )
import MonadStateID ( State, S ( .. ) )

ev :: Term -> S BN
ev (Tcon b) = return b
ev (Tdiv n d) =
   (ev n) >>=
      (\bn -> (ev d) >>=
              (\bd -> return (B.div bn bd)))


-- TEST
ok , nok :: Term
ok  = Tdiv (Tdiv (Tcon (int2BN 1972))
                 (Tcon (int2BN 2   )))
           (Tcon (int2BN 23))
nok = Tdiv (Tcon (int2BN 1)) (Tcon (int2BN 0))

test :: IO ( )
test = do
    print "-------------- EvalStateIDMonadic.hs"
    print "-------------- ev"
    let ID f = ev ok
    let (out, s) = f 0
    print (bN2Int out, s)

    let ID f = ev ok
    let (out, s) = f 5
    print (bN2Int out, s)

    let ID f = ev nok
    let (out, s) = f 5
    print (out, s)
