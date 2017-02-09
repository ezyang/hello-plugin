module Hello (frontendPlugin) where

import GhcPlugins
import DriverPhases
import GhcMonad

frontendPlugin :: FrontendPlugin
frontendPlugin = defaultFrontendPlugin {
  frontend = hello
  }

hello :: [String] -> [(String, Maybe Phase)] -> Ghc ()
hello flags args = do
    liftIO $ print flags
    liftIO $ print args
