myWords :: [Char] -> [[Char]]
myWords sentence = go sentence []
  where go x results
          | x == ""   = reverse results
          | otherwise = go (drop 1 (dropWhile (/= ' ') x)) ((takeWhile (/= ' ') x):results)
