module Test.StrongCheck.Laws.Control.Semigroupoid where

import Prelude

import Control.Monad.Eff.Console (log)

import Type.Proxy (Proxy3)

import Test.StrongCheck (SC, quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)
import Test.StrongCheck.Laws (B, C, D, E)

-- | - Associativity: `p <<< (q <<< r) = (p <<< q) <<< r`
checkSemigroupoid
  ∷ ∀ eff a
  . (Semigroupoid a, Arbitrary (a B C), Arbitrary (a C D), Arbitrary (a D E), Eq (a B E))
  ⇒ Proxy3 a
  → SC eff Unit
checkSemigroupoid _ = do

  log "Checking 'Associativity' law for Semigroupoid"
  quickCheck' 1000 associativity

  where

  associativity ∷ a D E → a C D → a B C → Boolean
  associativity p q r = (p <<< (q <<< r)) == ((p <<< q) <<< r)
