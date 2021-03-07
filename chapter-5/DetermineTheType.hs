{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

example = 1

a_1 = (* 9) 6 -- a_1 :: Num a => a

b_1 = head [(0, "doge"), (1, "kitteh")] --
