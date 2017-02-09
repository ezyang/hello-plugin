import GHC.Paths
import System.Posix.Process
import System.Environment

main = do
  args <- getArgs
  let interactive = "--interactive" `elem` args
      args' = do
        arg <- args
        case arg of
          "--interactive" ->
            ["--frontend", "Hello",
             "-plugin-package", "hello-plugin"]
          -- If you used 'cabal install' to install hello-plugin,
          -- this line is enough; but if you installed it in an
          -- unusual package database, you will have to modify
          -- this line to feed the correct database(s) in
          "-no-user-package-db" | interactive -> []
          _ -> return arg
  executeFile ghc False args' Nothing
