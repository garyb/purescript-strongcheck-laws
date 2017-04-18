module Test.StrongCheck.Laws.Data.Bounded where

import Prelude

import Control.Monad.Eff.Console (log)

import Type.Proxy (Proxy)

import Test.StrongCheck (SC, quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)

-- | - Ordering: `bottom <= a <= top`
checkBounded
  ∷ ∀ eff a
  . Arbitrary a ⇒ Bounded a ⇒ Ord a
  ⇒ Proxy a
  → SC eff Unit
checkBounded _ = do

  log "Checking 'Ordering' law for Bounded"
  quickCheck' 1000 ordering

  where

  ordering ∷ a → Boolean
  ordering a = bottom <= a && a <= top
