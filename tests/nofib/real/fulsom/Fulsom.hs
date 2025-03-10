{-
 -  Fulsom (The Solid Modeller, written in Haskell)
 -
 -  Copyright 1990,1991,1992,1993 Duncan Sinclair
 -
 - Permissiom to use, copy, modify, and distribute this software for any 
 - purpose and without fee is hereby granted, provided that the above
 - copyright notice and this permission notice appear in all copies, and
 - that my name not be used in advertising or publicity pertaining to this
 - software without specific, written prior permission.  I makes no
 - representations about the suitability of this software for any purpose.
 - It is provided ``as is'' without express or implied warranty.
 - 
 - Duncan Sinclair 1993.
 - 
 - Main program.
 -
 -}

module Main(main) where

import Shapes
import Raster
import Quad
import Oct
import Csg
import Interval
import Types
import Vector
import Kolor
import Matrix
import Patchlevel

import System

-- main x = [AppendChan stdout picture]

main = do
    argv <- getArgs
    let
	n = case argv of
	      [a] -> read a
	      _   -> 7
    putStr (picture n)

{- OLD 1.2:
main = getArgs exit (\argv -> 
       let arg = case argv of {[w] -> words w; _ -> []}
           [n] = if length arg == 1
                   then (map read arg :: [Int])
                   else [7]
       in
           appendChan stdout (picture n) exit done)
-}


picture n = go n pic


go :: Int -> Csg -> [Char]
go n = (cdraw n) . quadoct . (octcsg n)

