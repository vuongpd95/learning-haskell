f :: Show a => (a, b) -> IO (a, b)
f t@(a, _) = do
  print a
  return t

isSubseqOf :: (Eq a)
            => [a]
            -> [a]
            -> Bool

isSubseqOf [] _   = True
isSubseqOf _ []   = False
isSubseqOf s1@(x:xs) s2@(y:ys)
  | x == y = isSubseqOf xs ys
  | x /= y = isSubseqOf s1 ys
