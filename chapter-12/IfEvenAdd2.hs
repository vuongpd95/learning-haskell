ifEvenAdd2 :: Integer -> Maybe Integer
ifEvenAdd2 n =
  if even n then Just (n + 2) else Nothing
