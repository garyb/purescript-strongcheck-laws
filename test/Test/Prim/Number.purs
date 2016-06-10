module Test.Prim.Number where

import Prelude

import Test.StrongCheck.Data.ApproxNumber (ApproxNumber)
import Test.StrongCheck.Laws (SC, checkLaws)
import Test.StrongCheck.Laws.Data as Data

import Type.Proxy (Proxy(..))

checkNumber ∷ ∀ eff. SC eff Unit
checkNumber = checkLaws "Number" do
  Data.checkEq prxNumber
  Data.checkOrd prxNumber
  Data.checkSemiring prxNumber
  Data.checkEuclideanRing prxNumber
  Data.checkRing prxNumber
  Data.checkField prxNumber
  Data.checkCommutativeRing prxNumber
  where
  prxNumber = Proxy ∷ Proxy ApproxNumber
