module Test.StrongCheck.Laws.Control.Comonad where

import Prelude

import Control.Monad.Eff.Console (log)
import Control.Comonad (class Comonad, extract)
import Control.Extend ((<<=))

import Type.Proxy (Proxy2)

import Test.StrongCheck (SC, quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary, class Coarbitrary)
import Test.StrongCheck.Laws (A, B)

-- | - Left Identity: `extract <<= x = x`
-- | - Right Identity: `extract (f <<= x) = f x`
checkComonad
  ∷ ∀ eff w
  . (Comonad w, Arbitrary (w A), Coarbitrary (w A), Eq (w A))
  ⇒ Proxy2 w
  → SC eff Unit
checkComonad _ = do

  log "Checking 'Left identity' law for Comonad"
  quickCheck' 1000 leftIdentity

  log "Checking 'Right identity' law for Comonad"
  quickCheck' 1000 rightIdentity

  where

  leftIdentity ∷ w A → Boolean
  leftIdentity x = (extract <<= x) == x

  rightIdentity ∷ (w A → B) → w A → Boolean
  rightIdentity f x = extract (f <<= x) == f x
