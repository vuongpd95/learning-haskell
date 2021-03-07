data DividedByResult = Result Integer | DividedByZero deriving Show

fixedDividedBy :: Integral a => a -> a -> DividedByResult

fixedDividedBy nom denom
  | denom == 0 = DividedByZero
  | otherwise  = go nom denom 0
  where go nom denom count
          | nom < denom = Result count
          | otherwise   = go (nom - denom) denom (count + 1)
