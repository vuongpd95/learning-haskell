mc91 :: (Ord n, Num n) => n -> n

mc91 n
  | n > 100  = n - 10
  | n <= 100 = mc91 . mc91 $ n + 11
