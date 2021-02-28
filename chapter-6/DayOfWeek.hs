data DayOfWeek =
  Mon | Tue | Weds | Thu | Fri | Sat | Sun
  deriving (Eq, Show)

data Date =
  Date DayOfWeek Int

-- instance Eq DayOfWeek where
--   (==) Mon Mon    = True
--   (==) Tue Tue    = True
--   (==) Weds Weds  = True
--   (==) Thu Thu    = True
--   (==) Fri Fri    = True
--   (==) Sat Sat    = True
--   (==) Sun Sun    = True
--   (==) _ _        = False

instance Ord DayOfWeek where
  compare Fri Fri = EQ
  compare Fri _   = GT
  compare _   Fri = LT
  compare _   _   = EQ

instance Eq Date where
  (==)  (Date weekDay dayOfMonth)
        (Date weekDay' dayOfMonth') =
      weekDay == weekDay' && dayOfMonth == dayOfMonth'
