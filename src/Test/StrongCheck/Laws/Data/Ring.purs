module Test.StrongCheck.Laws.Data.Ring where

import Prelude

import Control.Monad.Eff.Console (log)

import Type.Proxy (Proxy)

import Test.StrongCheck (SC, quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)

-- | - Additive inverse: `a - a = a + (-a) = (-a) + a = zero`
checkRing
  ∷ ∀ eff a
  . Ring a ⇒ Arbitrary a ⇒ Eq a
  ⇒ Proxy a
  → SC eff Unit
checkRing _ = do

  log "Checking 'Additive inverse' law for Ring"
  quickCheck' 1000 additiveInverse

  where

  additiveInverse ∷ a → Boolean
  additiveInverse a = a - a == zero && a + (-a) == zero && (-a) + a == zero
