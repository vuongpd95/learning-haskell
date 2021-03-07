addOneIfOdd n = case odd n of
  True -> (\n -> n + 1) n
  False -> n


-- addFive x y = (if x > y then y else x) + 5
addFive = \x -> \y -> (if x > y then y else x) + 5

-- mflip f = \x -> \y -> f y x
mflip f x y = f y x
