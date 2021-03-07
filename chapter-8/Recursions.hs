sumUp :: (Ord a, Num a) => a -> a
sumUp n
  | n == 0    = 0
  | n < 0     = negate . sumUp . negate $ n
  | otherwise = go n 0
  where
    go number sum
      | number == 0 = sum
      | otherwise   = go (number - 1) (sum + number)

sumIntegral :: (Integral a) => a -> a -> a
sumIntegral x y
  | x < 0 = negate (sumIntegral (- x) y)
  | y < 0 = negate (sumIntegral x (- y))
  | otherwise = go x y 0
  where
    go number times sum
      | times == 0 = sum
      | otherwise = go number (times - 1) (sum + number)
