{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use tuple-section" #-}
{-# HLINT ignore "Avoid lambda" #-}

module EvalStateIDExceptionMonadic_SOLUZIONE where

import BNumFuncApp ( BN, BinNotation ( .. ) )
import qualified BNumFuncApp as B
import BNumFuncAppVsInteger ( bN2Int, int2BN )
import Language ( Term ( .. ) )
import MonadStateID ( State, S ( .. ) )
import MonadException ( E ( .. ) )


ev :: Term -> S (E BN)
ev (Tcon b) = return (return b) 
ev (Tdiv t t') =
 (ev t)
 >>=
 (\a -> (ev t')
        >>=
        (\b -> return (a 
                       >>= 
                       (\x -> b
                              >>=
                              (\y -> 
                               if y == B.N0 
                               then Rise "Div by 0"
                               else return (B.div x y))
                       ))
        ))

-- TEST
ok , nok :: Term
ok  = Tdiv (Tdiv (Tcon (int2BN 1972))
                 (Tcon (int2BN 2   )))
           (Tcon (int2BN 23))
nok = Tdiv (Tcon (int2BN 1)) 
           (Tcon (int2BN 0))

test :: IO ( )
test = do
    print "-------------- EvalStateIDExceptionMonadic.hs"
    let ID f = ev ok
    let (out, s) = f 0 -- 0 == offset per contare passi
    print (out, s)

    let ID f = ev ok
    let (out, s) = f 5 -- 5 == offset per contare passi
    print (out, s)

    -- non più overflow
    let ID f = ev nok
    let (out, s) = f 5 -- 5 == offset per contare passi
    print (out, s)