module Test.StrongCheck.Laws.Data.EuclideanRing where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.StrongCheck (quickCheck')
import Test.StrongCheck.Arbitrary (class Arbitrary)
import Type.Proxy (Proxy)

-- | - Integral domain: `a /= 0` and `b /= 0` implies `a * b /= 0`
-- | - Multiplicative Euclidean function: ``a = (a / b) * b + (a `mod` b)``
-- |   where `degree a > 0` and `degree a <= degree (a * b)`
checkEuclideanRing
  ∷ ∀ a
  . EuclideanRing a
  ⇒ Arbitrary a
  ⇒ Eq a
  ⇒ Proxy a
  → Effect Unit
checkEuclideanRing _ = do

  log "Checking 'Integral domain' law for EuclideanRing"
  quickCheck' 1000 integralDomain

  log "Checking 'Multiplicative Euclidean function' law for EuclideanRing"
  quickCheck' 1000 euclideanFunc

  where

  integralDomain ∷ a → a → Boolean
  integralDomain a b
    | a /= zero && b /= zero = a * b /= zero
    | otherwise = true

  euclideanFunc ∷ a → a → Boolean
  euclideanFunc a b
    | degree a > zero && degree a <= degree (a * b) =
        a == (a / b) * b + (a `mod` b)
    | otherwise = true
