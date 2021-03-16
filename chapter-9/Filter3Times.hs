module Filter3Times where
  filter3 :: [Integer] -> [Integer]
  filter3 arr = filter ff arr
                  where ff x
                         | ((x `mod` 3) == 0) = True
                         | otherwise          = False

  length3 = length . filter3
