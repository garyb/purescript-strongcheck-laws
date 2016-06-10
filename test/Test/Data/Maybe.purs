module Test.Data.Maybe where

import Prelude

import Data.Maybe (Maybe)

import Test.StrongCheck.Laws (SC, A, checkLaws)
import Test.StrongCheck.Laws.Control as Control
import Test.StrongCheck.Laws.Data as Data

import Type.Proxy (Proxy(..), Proxy2(..))

checkMaybe ∷ ∀ eff. SC eff Unit
checkMaybe = checkLaws "Maybe" do
  Data.checkEq prxMaybe
  Data.checkOrd prxMaybe
  Data.checkBounded prxMaybe
  Data.checkSemigroup prxMaybe
  Data.checkMonoid prxMaybe
  Data.checkFunctor prx2Maybe
  Control.checkApply prx2Maybe
  Control.checkApplicative prx2Maybe
  Control.checkAlt prx2Maybe
  Control.checkPlus prx2Maybe
  Control.checkAlternative prx2Maybe
  Control.checkBind prx2Maybe
  Control.checkMonad prx2Maybe
  Control.checkMonadZero prx2Maybe
  Control.checkExtend prx2Maybe
  where
  prxMaybe = Proxy ∷ Proxy (Maybe A)
  prx2Maybe = Proxy2 ∷ Proxy2 Maybe
