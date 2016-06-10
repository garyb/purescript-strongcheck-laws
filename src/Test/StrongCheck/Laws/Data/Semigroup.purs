module Test.StrongCheck.Laws.Data.Semigroup where

import Prelude

import Control.Monad.Eff.Console (log)

import Type.Proxy (Proxy)

import Test.StrongCheck (SC, quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)

-- | - Associativity: `(x <> y) <> z = x <> (y <> z)`
checkSemigroup
  ∷ ∀ eff s
  . (Semigroup s, Arbitrary s, Eq s)
  ⇒ Proxy s
  → SC eff Unit
checkSemigroup _ = do

  log "Checking 'Associativity' law for Semigroup"
  quickCheck' 1000 associativity

  where

  associativity ∷ s → s → s → Boolean
  associativity x y z = ((x <> y) <> z) == (x <> (y <> z))
