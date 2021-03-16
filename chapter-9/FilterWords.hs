myFilter :: [Char] -> [[Char]]
myFilter = filter (/= "a") . filter (/= "an") . words
