module Test.Prim.Number where

import Prelude

import Effect (Effect)
import Test.StrongCheck.Data.ApproxNumber (ApproxNumber)
import Test.StrongCheck.Laws (checkLaws)
import Test.StrongCheck.Laws.Data as Data
import Type.Proxy (Proxy(..))

checkNumber ∷ Effect Unit
checkNumber = checkLaws "Number" do
  Data.checkEq prxNumber
  Data.checkOrd prxNumber
  Data.checkSemiring prxNumber
  Data.checkEuclideanRing prxNumber
  Data.checkDivisionRing prxNumber
  Data.checkRing prxNumber
  Data.checkCommutativeRing prxNumber
  where
  prxNumber = Proxy ∷ Proxy ApproxNumber
