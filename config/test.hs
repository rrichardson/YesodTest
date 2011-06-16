{-# LANGUAGE CPP #-}
#if PRODUCTION
import Controller (withTest)
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = withTest $ run 3000
#else
import Controller (withTest)
import System.IO (hPutStrLn, stderr)
import Network.Wai.Middleware.Debug (debug)
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = do
    let port = 3000
    hPutStrLn stderr $ "Application launched, listening on port " ++ show port
    withTest $ run port . debug
#endif
