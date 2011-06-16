module Paths_test (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,0,0], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/rick/.cabal/bin"
libdir     = "/home/rick/.cabal/lib/test-0.0.0/ghc-7.0.2"
datadir    = "/home/rick/.cabal/share/test-0.0.0"
libexecdir = "/home/rick/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "test_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "test_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "test_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "test_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
