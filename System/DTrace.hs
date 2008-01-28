{-# LANGUAGE ForeignFunctionInterface #-}

{-# CFILES cbits/user_trace.c #-}

module System.DTrace (trace) where

import Foreign.C.String

foreign import ccall "trace.h user_trace" user_trace :: CString -> IO ()

trace :: String -> IO ()
trace msg = withCString msg user_trace
