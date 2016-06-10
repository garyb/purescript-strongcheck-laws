module Test.Prim.Boolean where

import Prelude

import Test.StrongCheck.Laws (SC, checkLaws)
import Test.StrongCheck.Laws.Data as Data

import Type.Proxy (Proxy(..))

checkBoolean ∷ ∀ eff. SC eff Unit
checkBoolean = checkLaws "Boolean" do
  Data.checkEq prxBoolean
  Data.checkOrd prxBoolean
  Data.checkBounded prxBoolean
  Data.checkHeytingAlgebra prxBoolean
  Data.checkBooleanAlgebra prxBoolean
  where
  prxBoolean = Proxy ∷ Proxy Boolean
