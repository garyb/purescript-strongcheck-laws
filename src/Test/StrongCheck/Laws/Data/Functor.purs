module Test.StrongCheck.Laws.Data.Functor where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.StrongCheck (quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)
import Test.StrongCheck.Laws (A, B)
import Type.Proxy (Proxy2)

-- | - Identity: `(<$>) id = id`
-- | - Composition: `(<$>) (f <<< g) = (f <$>) <<< (g <$>)`
checkFunctor
  ∷ ∀ f
  . Functor f ⇒ Arbitrary (f A) ⇒ Eq (f A)
  ⇒ Proxy2 f
  → Effect Unit
checkFunctor _ = do

  log "Checking 'Identity' law for Functor"
  quickCheck' 1000 identity'

  log "Checking 'Composition' law for Functor"
  quickCheck' 1000 composition

  where

  identity' ∷ f A → Boolean
  identity' f = (identity <$> f) == identity f

  composition ∷ (B → A) → (A → B) → f A → Boolean
  composition f g x = ((<$>) (f <<< g) x) == (((f <$> _) <<< (g <$> _)) x)
