-----------------------------------------------------------------------------
-- |
-- Module      :  System.Exit
-- Copyright   :  (c) The University of Glasgow 2001
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  portable
--
-- Exiting the program.
--
-----------------------------------------------------------------------------

module System.Exit
    (
      ExitCode(ExitSuccess,ExitFailure)
    , exitWith      -- :: ExitCode -> IO a
    , exitFailure   -- :: IO a
    , exitSuccess   -- :: IO a
  ) where

import Prelude

#ifdef __GLASGOW_HASKELL__
import GHC.IO
import GHC.IO.Exception
#endif

#ifdef __HUGS__
import Hugs.Prelude (ExitCode(..))
import Control.Exception.Base
#endif

#ifdef __NHC__
import System
  ( ExitCode(..)
  , exitWith
  )
#endif

-- ---------------------------------------------------------------------------
-- exitWith

-- | Computation 'exitWith' @code@ throws 'ExitCode' @code@.
-- Normally this terminates the program, returning @code@ to the
-- program's caller.
--
-- On program termination, the standard 'Handle's 'stdout' and
-- 'stderr' are flushed automatically; any other buffered 'Handle's
-- need to be flushed manually, otherwise the buffered data will be
-- discarded.
--
-- A program that fails in any other way is treated as if it had
-- called 'exitFailure'.
-- A program that terminates successfully without calling 'exitWith'
-- explicitly is treated as it it had called 'exitWith' 'ExitSuccess'.
--
-- As an 'ExitCode' is not an 'IOError', 'exitWith' bypasses
-- the error handling in the 'IO' monad and cannot be intercepted by
-- 'catch' from the "Prelude".  However it is a 'SomeException', and can
-- be caught using the functions of "Control.Exception".  This means
-- that cleanup computations added with 'Control.Exception.bracket'
-- (from "Control.Exception") are also executed properly on 'exitWith'.
--
-- Note: in GHC, 'exitWith' should be called from the main program
-- thread in order to exit the process.  When called from another
-- thread, 'exitWith' will throw an 'ExitException' as normal, but the
-- exception will not cause the process itself to exit.
--
#ifndef __NHC__
exitWith :: ExitCode -> IO a
exitWith ExitSuccess = throwIO ExitSuccess
exitWith code@(ExitFailure n)
  | n /= 0 = throwIO code
#ifdef __GLASGOW_HASKELL__
  | otherwise = ioError (IOError Nothing InvalidArgument "exitWith" "ExitFailure 0" Nothing Nothing)
#endif
#endif  /* ! __NHC__ */

-- | The computation 'exitFailure' is equivalent to
-- 'exitWith' @(@'ExitFailure' /exitfail/@)@,
-- where /exitfail/ is implementation-dependent.
exitFailure :: IO a
exitFailure = exitWith (ExitFailure 1)

-- | The computation 'exitSuccess' is equivalent to
-- 'exitWith' 'ExitSuccess', It terminates the program
-- successfully.
exitSuccess :: IO a
exitSuccess = exitWith ExitSuccess
