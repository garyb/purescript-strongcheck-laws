module Test.Data.Unit where

import Prelude

import Test.StrongCheck.Laws (SC, checkLaws)
import Test.StrongCheck.Laws.Data as Data

import Type.Proxy (Proxy(..))

checkUnit ∷ ∀ eff. SC eff Unit
checkUnit = checkLaws "Unit" do
  Data.checkEq prxUnit
  Data.checkOrd prxUnit
  Data.checkBounded prxUnit
  Data.checkSemigroup prxUnit
  Data.checkMonoid prxUnit
  Data.checkSemiring prxUnit
  Data.checkRing prxUnit
  Data.checkCommutativeRing prxUnit
  Data.checkHeytingAlgebra prxUnit
  Data.checkBooleanAlgebra prxUnit
  where
  prxUnit = Proxy ∷ Proxy Unit
