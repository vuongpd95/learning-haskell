module IsPalindrome where

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = if x == reverse (x) then True else False

myAbs :: Integer -> Integer
myAbs x = if x < 0 then negate (x) else x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))
