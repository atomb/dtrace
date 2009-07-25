{-# LANGUAGE ForeignFunctionInterface #-}

{-# CFILES cbits/user_trace.c #-}

module System.DTrace (trace) where

import Control.Monad ( when )
import Foreign.C.String

foreign import ccall "trace.h user_trace" user_trace :: CString -> IO ()
foreign import ccall "trace.h user_trace_enabled" user_trace_enabled :: IO Bool

trace :: String -> IO ()
trace msg = do
    enabled <- user_trace_enabled
    when enabled
        (withCString msg user_trace)
