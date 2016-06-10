module Test.StrongCheck.Laws.Data.Functor where

import Prelude

import Control.Monad.Eff.Console (log)

import Type.Proxy (Proxy2)

import Test.StrongCheck (SC, quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)
import Test.StrongCheck.Laws (A, B)

-- | - Identity: `(<$>) id = id`
-- | - Composition: `(<$>) (f <<< g) = (f <$>) <<< (g <$>)`
checkFunctor
  ∷ ∀ eff f
  . (Functor f, Arbitrary (f A), Eq (f A))
  ⇒ Proxy2 f
  → SC eff Unit
checkFunctor _ = do

  log "Checking 'Identity' law for Functor"
  quickCheck' 1000 identity

  log "Checking 'Composition' law for Functor"
  quickCheck' 1000 composition

  where

  identity ∷ f A → Boolean
  identity f = (id <$> f) == id f

  composition ∷ (B → A) → (A → B) → f A → Boolean
  composition f g x = ((<$>) (f <<< g) x) == (((f <$> _) <<< (g <$> _)) x)
