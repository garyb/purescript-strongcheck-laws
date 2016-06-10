module Test.Data.Ordering where

import Prelude

import Test.StrongCheck.Laws (SC, checkLaws)
import Test.StrongCheck.Laws.Data as Data

import Type.Proxy (Proxy(..))

checkOrdering ∷ ∀ eff. SC eff Unit
checkOrdering = checkLaws "Ordering" do
  Data.checkEq prxOrdering
  Data.checkOrd prxOrdering
  Data.checkBounded prxOrdering
  Data.checkSemigroup prxOrdering
  where
  prxOrdering = Proxy ∷ Proxy Ordering
