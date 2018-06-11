module Test.StrongCheck.Laws.Data.Semigroup where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.StrongCheck (quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)
import Type.Proxy (Proxy)

-- | - Associativity: `(x <> y) <> z = x <> (y <> z)`
checkSemigroup
  ∷ ∀ s
  . Semigroup s
  ⇒ Arbitrary s
  ⇒ Eq s
  ⇒ Proxy s
  → Effect Unit
checkSemigroup _ = do

  log "Checking 'Associativity' law for Semigroup"
  quickCheck' 1000 associativity

  where

  associativity ∷ s → s → s → Boolean
  associativity x y z = ((x <> y) <> z) == (x <> (y <> z))
