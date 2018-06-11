module Test.Data.Either where

import Prelude

import Data.Either (Either)
import Effect (Effect)
import Test.StrongCheck.Laws (A, B, C, checkLaws)
import Test.StrongCheck.Laws.Control as Control
import Test.StrongCheck.Laws.Data as Data
import Type.Proxy (Proxy(..), Proxy2(..))

checkEither ∷ Effect Unit
checkEither = checkLaws "Either" do
  Data.checkEq prxEither
  Data.checkOrd prxEither
  Data.checkBounded prxEither
  Data.checkFunctor prx2Either
  Control.checkApply prx2Either
  Control.checkApplicative prx2Either
  Control.checkAlt prx2Either
  Control.checkBind prx2Either
  Control.checkMonad prx2Either
  Control.checkExtend prx2Either
  where
  prxEither = Proxy ∷ Proxy (Either A B)
  prx2Either = Proxy2 ∷ Proxy2 (Either C)
