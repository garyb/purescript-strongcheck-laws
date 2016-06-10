module Test.Prim.String where

import Prelude

import Test.StrongCheck.Laws (SC, checkLaws)
import Test.StrongCheck.Laws.Data as Data

import Type.Proxy (Proxy(..))

checkString ∷ ∀ eff. SC eff Unit
checkString = checkLaws "String" do
  Data.checkEq prxString
  Data.checkOrd prxString
  Data.checkSemigroup prxString
  Data.checkMonoid prxString
  where
  prxString = Proxy ∷ Proxy String
