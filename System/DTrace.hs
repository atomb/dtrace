{-# LANGUAGE ForeignFunctionInterface, CPP #-}
module System.DTrace (trace) where

#ifdef ENABLE_TRACE

import Control.Monad ( when )
import Foreign.C.String

{-# CFILES cbits/user_trace.c #-}
foreign import ccall "trace.h user_trace" user_trace :: CString -> IO ()
foreign import ccall "trace.h user_trace_enabled" user_trace_enabled :: IO Bool

trace :: String -> IO ()
trace msg = do
    enabled <- user_trace_enabled
    when enabled
        (withCString msg user_trace)

#else

trace :: String -> IO ()
trace _ = return ()

#endif
