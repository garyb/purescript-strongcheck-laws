module Test.StrongCheck.Laws.Data.Eq where

import Prelude

import Control.Monad.Eff.Console (log)

import Type.Proxy (Proxy)

import Test.StrongCheck (SC, quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)

-- | - Reflexivity: `x == x = true`
-- | - Symmetry: `x == y = y == x`
-- | - Transitivity: if `x == y` and `y == z` then `x == z`
-- | - Negation: `x /= y = not (x == y)`
checkEq
  ∷ ∀ eff a
  . Arbitrary a ⇒ Eq a
  ⇒ Proxy a
  → SC eff Unit
checkEq _ = do

  log "Checking 'Reflexivity' law for Eq"
  quickCheck' 1000 reflexivity

  log "Checking 'Symmetry' law for Eq"
  quickCheck' 1000 symmetry

  log "Checking 'Transitivity' law for Eq"
  quickCheck' 1000 transitivity

  log "Checking 'Negation' law for Eq"
  quickCheck' 1000 negation

  where

  reflexivity ∷ a → Boolean
  reflexivity x = (x == x) == true

  symmetry ∷ a → a → Boolean
  symmetry x y = (x == y) == (y == x)

  transitivity ∷ a → a → a → Boolean
  transitivity x y z = if (x == y) && (y == z) then x == z else true

  negation ∷ a → a → Boolean
  negation x y = (x /= y) == not (x == y)
