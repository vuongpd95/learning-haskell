{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany (Int, String) where
  tooMany (a, b) = a > 42

-- instance TooMany (Int, Int) where
--   tooMany (n, m) = (n + m) > 42

-- instance TooMany ((Num a, TooMany a) => (a, a)) where
--   tooMany (x, y) = True

instance (Num a, TooMany a) => TooMany (a, a)  where
  tooMany (x, y) = tooMany (x + y)

newtype Goats = Goats Int deriving (Eq, Show, TooMany)
