{-# OPTIONS -Wall -fno-warn-unused-binds #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  Data.Fixed
-- Copyright   :  (c) Ashley Yakeley 2005, 2006, 2009
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  Ashley Yakeley <ashley@semantic.org>
-- Stability   :  experimental
-- Portability :  portable
--
-- This module defines a \"Fixed\" type for fixed-precision arithmetic.
-- The parameter to Fixed is any type that's an instance of HasResolution.
-- HasResolution has a single method that gives the resolution of the Fixed type.
--
-- This module also contains generalisations of div, mod, and divmod to work
-- with any Real instance.
--
-----------------------------------------------------------------------------

module Data.Fixed
(
    div',mod',divMod',

    Fixed,HasResolution(..),
    showFixed,
    E0,Uni,
    E1,Deci,
    E2,Centi,
    E3,Milli,
    E6,Micro,
    E9,Nano,
    E12,Pico
) where

import Prelude -- necessary to get dependencies right
#ifndef __NHC__
import Data.Typeable
import Data.Data
#endif

#ifndef __NHC__
default () -- avoid any defaulting shenanigans
#endif

-- | generalisation of 'div' to any instance of Real
div' :: (Real a,Integral b) => a -> a -> b
div' n d = floor ((toRational n) / (toRational d))

-- | generalisation of 'divMod' to any instance of Real
divMod' :: (Real a,Integral b) => a -> a -> (b,a)
divMod' n d = (f,n - (fromIntegral f) * d) where
    f = div' n d

-- | generalisation of 'mod' to any instance of Real
mod' :: (Real a) => a -> a -> a
mod' n d = n - (fromInteger f) * d where
    f = div' n d

-- | The type parameter should be an instance of 'HasResolution'.
newtype Fixed a = MkFixed Integer
#ifndef __NHC__
        deriving (Eq,Ord,Typeable)
#else
        deriving (Eq,Ord)
#endif

#ifndef __NHC__
-- We do this because the automatically derived Data instance requires (Data a) context.
-- Our manual instance has the more general (Typeable a) context.
tyFixed :: DataType
tyFixed = mkDataType "Data.Fixed.Fixed" [conMkFixed]
conMkFixed :: Constr
conMkFixed = mkConstr tyFixed "MkFixed" [] Prefix
instance (Typeable a) => Data (Fixed a) where
    gfoldl k z (MkFixed a) = k (z MkFixed) a
    gunfold k z _ = k (z MkFixed)
    dataTypeOf _ = tyFixed
    toConstr _ = conMkFixed
#endif

class HasResolution a where
    resolution :: p a -> Integer

withType :: (p a -> f a) -> f a
withType foo = foo undefined

withResolution :: (HasResolution a) => (Integer -> f a) -> f a
withResolution foo = withType (foo . resolution)

instance Enum (Fixed a) where
    succ (MkFixed a) = MkFixed (succ a)
    pred (MkFixed a) = MkFixed (pred a)
    toEnum = MkFixed . toEnum
    fromEnum (MkFixed a) = fromEnum a
    enumFrom (MkFixed a) = fmap MkFixed (enumFrom a)
    enumFromThen (MkFixed a) (MkFixed b) = fmap MkFixed (enumFromThen a b)
    enumFromTo (MkFixed a) (MkFixed b) = fmap MkFixed (enumFromTo a b)
    enumFromThenTo (MkFixed a) (MkFixed b) (MkFixed c) = fmap MkFixed (enumFromThenTo a b c)

instance (HasResolution a) => Num (Fixed a) where
    (MkFixed a) + (MkFixed b) = MkFixed (a + b)
    (MkFixed a) - (MkFixed b) = MkFixed (a - b)
    fa@(MkFixed a) * (MkFixed b) = MkFixed (div (a * b) (resolution fa))
    negate (MkFixed a) = MkFixed (negate a)
    abs (MkFixed a) = MkFixed (abs a)
    signum (MkFixed a) = fromInteger (signum a)
    fromInteger i = withResolution (\res -> MkFixed (i * res))

instance (HasResolution a) => Real (Fixed a) where
    toRational fa@(MkFixed a) = (toRational a) / (toRational (resolution fa))

instance (HasResolution a) => Fractional (Fixed a) where
    fa@(MkFixed a) / (MkFixed b) = MkFixed (div (a * (resolution fa)) b)
    recip fa@(MkFixed a) = MkFixed (div (res * res) a) where
        res = resolution fa
    fromRational r = withResolution (\res -> MkFixed (floor (r * (toRational res))))

instance (HasResolution a) => RealFrac (Fixed a) where
    properFraction a = (i,a - (fromIntegral i)) where
        i = truncate a
    truncate f = truncate (toRational f)
    round f = round (toRational f)
    ceiling f = ceiling (toRational f)
    floor f = floor (toRational f)

chopZeros :: Integer -> String
chopZeros 0 = ""
chopZeros a | mod a 10 == 0 = chopZeros (div a 10)
chopZeros a = show a

-- only works for positive a
showIntegerZeros :: Bool -> Int -> Integer -> String
showIntegerZeros True _ 0 = ""
showIntegerZeros chopTrailingZeros digits a = replicate (digits - length s) '0' ++ s' where
    s = show a
    s' = if chopTrailingZeros then chopZeros a else s

withDot :: String -> String
withDot "" = ""
withDot s = '.':s

-- | First arg is whether to chop off trailing zeros
showFixed :: (HasResolution a) => Bool -> Fixed a -> String
showFixed chopTrailingZeros fa@(MkFixed a) | a < 0 = "-" ++ (showFixed chopTrailingZeros (asTypeOf (MkFixed (negate a)) fa))
showFixed chopTrailingZeros fa@(MkFixed a) = (show i) ++ (withDot (showIntegerZeros chopTrailingZeros digits fracNum)) where
    res = resolution fa
    (i,d) = divMod a res
    -- enough digits to be unambiguous
    digits = ceiling (logBase 10 (fromInteger res) :: Double)
    maxnum = 10 ^ digits
    fracNum = div (d * maxnum) res

instance (HasResolution a) => Show (Fixed a) where
    show = showFixed False


data E0 = E0
#ifndef __NHC__
     deriving (Typeable)
#endif
instance HasResolution E0 where
    resolution _ = 1
-- | resolution of 1, this works the same as Integer
type Uni = Fixed E0

data E1 = E1
#ifndef __NHC__
     deriving (Typeable)
#endif
instance HasResolution E1 where
    resolution _ = 10
-- | resolution of 10^-1 = .1
type Deci = Fixed E1

data E2 = E2
#ifndef __NHC__
     deriving (Typeable)
#endif
instance HasResolution E2 where
    resolution _ = 100
-- | resolution of 10^-2 = .01, useful for many monetary currencies
type Centi = Fixed E2

data E3 = E3
#ifndef __NHC__
     deriving (Typeable)
#endif
instance HasResolution E3 where
    resolution _ = 1000
-- | resolution of 10^-3 = .001
type Milli = Fixed E3

data E6 = E6
#ifndef __NHC__
     deriving (Typeable)
#endif
instance HasResolution E6 where
    resolution _ = 1000000
-- | resolution of 10^-6 = .000001
type Micro = Fixed E6

data E9 = E9
#ifndef __NHC__
     deriving (Typeable)
#endif
instance HasResolution E9 where
    resolution _ = 1000000000
-- | resolution of 10^-9 = .000000001
type Nano = Fixed E9

data E12 = E12
#ifndef __NHC__
     deriving (Typeable)
#endif
instance HasResolution E12 where
    resolution _ = 1000000000000
-- | resolution of 10^-12 = .000000000001
type Pico = Fixed E12
