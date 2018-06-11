module Test.StrongCheck.Laws.Data.Monoid where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.StrongCheck (quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)
import Type.Proxy (Proxy)

-- | - Left identity: `mempty <> x = x`
-- | - Right identity: `x <> mempty = x`
checkMonoid
  ∷ ∀ m
  . Monoid m
  ⇒ Arbitrary m
  ⇒ Eq m
  ⇒ Proxy m
  → Effect Unit
checkMonoid _ = do

  log "Checking 'Left identity' law for Monoid"
  quickCheck' 1000 leftIdentity

  log "Checking 'Right identity' law for Monoid"
  quickCheck' 1000 rightIdentity

  where

  leftIdentity ∷ m → Boolean
  leftIdentity x = mempty <> x == x

  rightIdentity ∷ m → Boolean
  rightIdentity x = x <> mempty == x
