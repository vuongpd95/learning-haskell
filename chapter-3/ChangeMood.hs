module ChangeMood where

data Mood = Blah | Woot deriving (Show)

reverse :: Mood -> Mood
reverse Blah = Woot
reverse _ = Blah
