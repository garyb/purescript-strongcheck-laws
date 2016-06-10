module Test.StrongCheck.Laws.Control.Category where

import Prelude

import Control.Monad.Eff.Console (log)

import Type.Proxy (Proxy3)

import Test.StrongCheck (SC, quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)
import Test.StrongCheck.Laws (B, C)

-- | - Identity: `id <<< p = p <<< id = p`
checkCategory
  ∷ ∀ eff a
  . (Category a, Arbitrary (a B C), Eq (a B C))
  ⇒ Proxy3 a
  → SC eff Unit
checkCategory _ = do

  log "Checking 'Identity' law for Category"
  quickCheck' 1000 identity

  where

  identity ∷ a B C → Boolean
  identity p = (id <<< p) == p
            && (p <<< id) == p
