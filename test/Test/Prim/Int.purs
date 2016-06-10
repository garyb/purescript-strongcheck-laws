module Test.Prim.Int where

import Prelude

import Test.StrongCheck.Laws (SC, checkLaws)
import Test.StrongCheck.Laws.Data as Data

import Type.Proxy (Proxy(..))

checkInt ∷ ∀ eff. SC eff Unit
checkInt = checkLaws "Int" do
  Data.checkEq prxInt
  Data.checkOrd prxInt
  Data.checkCommutativeRing prxInt
  Data.checkSemiring prxInt
  Data.checkEuclideanRing prxInt
  Data.checkRing prxInt
  where
  prxInt = Proxy ∷ Proxy Int
