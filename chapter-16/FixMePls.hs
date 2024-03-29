data FixMePls a =
    FixMe
  | Pls a
  deriving (Eq, Show)

instance Functor (FixMePls a) where
  fmap _ FixMe   = FixMe
  fmap f (Pls a) = Pls (f a)

data WhoCares a =
    ItDoesnt
  | Matter a
  | WhatThisIsCalled
  deriving (Eq, Show)

instance Functor WhoCares where
  fmap _ ItDoesnt = ItDoesnt
  fmap _ WhatThisIsCalled = WhatThisIsCalled
  fmap f (Matter a) = Matter (f a)

data CountingBad a =
  Heisenberg Int a
  deriving (Eq, Show)

instance Functor CountingBad where
  fmap f (Heisenberg n a) =
    Heisenberg (n) (f a)
