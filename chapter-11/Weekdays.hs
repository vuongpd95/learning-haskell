data Weekday =
    Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday

f :: Weekday -> String
f Friday = "Miller Time"

g xs = xs !! (length xs - 1)
