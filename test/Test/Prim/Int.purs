module Test.Prim.Int where

import Prelude

import Effect (Effect)
import Test.StrongCheck.Arbitrary (class Arbitrary, class Coarbitrary)
import Test.StrongCheck.Gen (chooseInt)
import Test.StrongCheck.Laws (checkLaws)
import Test.StrongCheck.Laws.Data as Data
import Type.Proxy (Proxy(..))

checkInt ∷ Effect Unit
checkInt = checkLaws "Int" do
  Data.checkEq prxInt
  Data.checkOrd prxInt
  Data.checkCommutativeRing prxInt
  Data.checkSemiring prxInt
  Data.checkEuclideanRing prxInt
  Data.checkRing prxInt
  where
  prxInt = Proxy ∷ Proxy SmallInt

newtype SmallInt = SmallInt Int

instance arbitrarySmallInt :: Arbitrary SmallInt where
  arbitrary = SmallInt <$> chooseInt (-1000000) 1000000

derive newtype instance coarbitrarySmallInt :: Coarbitrary SmallInt
derive newtype instance eqSmallInt :: Eq SmallInt
derive newtype instance ordSmallInt :: Ord SmallInt
derive newtype instance semiringSmallInt :: Semiring SmallInt
derive newtype instance ringSmallInt :: Ring SmallInt
derive newtype instance commutativeRingSmallInt :: CommutativeRing SmallInt
derive newtype instance euclideanRingSmallInt :: EuclideanRing SmallInt
