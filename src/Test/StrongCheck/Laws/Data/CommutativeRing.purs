module Test.StrongCheck.Laws.Data.CommutativeRing where

import Prelude

import Control.Monad.Eff.Console (log)

import Type.Proxy (Proxy)

import Test.StrongCheck (SC, quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)

-- | - Commutative multiplication: `a * b = b * a`
checkCommutativeRing
  ∷ ∀ eff a
  . (CommutativeRing a, Arbitrary a, Eq a)
  ⇒ Proxy a
  → SC eff Unit
checkCommutativeRing _ = do

  log "Checking 'Commutative multiplication' law for CommutativeRing"
  quickCheck' 1000 commutativeMultiplication

  where

  commutativeMultiplication ∷ a → a → Boolean
  commutativeMultiplication a b = a * b == b * a
