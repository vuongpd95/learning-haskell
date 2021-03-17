module Ciphers where

import Data.Char

caesar :: Int -> [Char] -> [Char]
caesar _ [] = []
caesar num sentence
  | num <= 0  = sentence
  | otherwise = go num sentence []
                  where go n [] r   = reverse r
                        go n (x:xs) r = go n xs $ ((chr . (+ 97) . (`mod` 26) . (+  (-97)) . (+ n) . ord) x):r
