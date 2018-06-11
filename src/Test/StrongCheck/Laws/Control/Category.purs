module Test.StrongCheck.Laws.Control.Category where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.StrongCheck (quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)
import Test.StrongCheck.Laws (B, C)
import Type.Proxy (Proxy3)

-- | - Identity: `id <<< p = p <<< id = p`
checkCategory
  ∷ ∀ a
  . Category a
  ⇒ Arbitrary (a B C)
  ⇒ Eq (a B C)
  ⇒ Proxy3 a
  → Effect Unit
checkCategory _ = do

  log "Checking 'Identity' law for Category"
  quickCheck' 1000 identity'

  where

  identity' ∷ a B C → Boolean
  identity' p = (identity <<< p) == p
            && (p <<< identity) == p
