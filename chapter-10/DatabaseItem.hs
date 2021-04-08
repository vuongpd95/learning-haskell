import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbNumber 1000
  , DbString "Hello, world"
  , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
  ]

filterDbDate :: [DatabaseItem] -> [UTCTime] 
filterDbDate = foldr (filter) []
                where filter (DbDate t) arr = t:arr
                      filter _ arr = arr 

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr (filter) []
                  where filter (DbNumber n) arr = n:arr
                        filter _ arr = arr

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = undefined

sumDb :: [DatabaseItem] -> Integer
sumDb db = foldr (+) 0 $ filterDbNumber db

avgDb :: [DatabaseItem] -> Double
avgDb db = fromIntegral(foldr (+) 0 numbers) / fromIntegral(length(numbers))
            where numbers = filterDbNumber db

