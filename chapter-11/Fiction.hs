-- data Fiction = Fiction deriving Show
-- data NonFiction = NonFiction deriving Show

data BookType = FictionBook Fiction
              | NonFictionBook NonFiction
              deriving Show

type AuthorName = String

data Author = Author (AuthorName, BookType)


