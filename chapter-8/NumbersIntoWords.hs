module WordNumber where

import Data.List (intersperse, intercalate)

digitToWord :: Int -> String
digitToWord 0 = "Zero"
digitToWord 1 = "One"
digitToWord 2 = "Two"
digitToWord 3 = "Three"
digitToWord 4 = "Four"
digitToWord 5 = "Five"
digitToWord 6 = "Six"
digitToWord 7 = "Seven"
digitToWord 8 = "Eight"
digitToWord 9 = "Nine"
digitToWord _ = "Nein!"

digits :: Int -> [Int]
digits n
  | n < 0 = digits . negate $ n
  | otherwise = go n []
  where
    go n n_digits
      | n < 10 = n : n_digits
      | otherwise = go quotR (remR : n_digits)
      where
        (quotR, remR) = quotRem n 10

wordNumber :: Int -> String
-- wordNumber n = concat . (intersperse '-') . digits n
-- wordNumber n = intercalate "-" (map digitToWord (digits n))
wordNumber = intercalate "-" . map digitToWord . digits -- Point-free
