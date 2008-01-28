module Main where

import System.DTrace

main :: IO ()
main = do
  c <- getChar
  trace $ "got: " ++ show c
  d <- getChar
  trace $ "and: " ++ show d
