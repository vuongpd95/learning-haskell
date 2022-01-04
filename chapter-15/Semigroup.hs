import Test.QuickCheck
import Data.Monoid (First, Last, Sum, Product)

data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
  _ <> _ = Trivial

instance Arbitrary Trivial where
  arbitrary = return Trivial

semigroupAssoc :: (Eq m, Semigroup m)
                => m -> m -> m -> Bool
semigroupAssoc a b c =
  (a <> (b <> c)) == ((a <> b) <> c)

type TrivAssoc =
  Trivial -> Trivial -> Trivial -> Bool

-- Ex2

newtype Identity a =
  Identity a
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
  (Identity a) <> (Identity a') = Identity (a <> a')

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = Identity <$> arbitrary
  
type IdentityAssoc = Identity (Sum Int)
                  -> Identity (Sum Int)
                  -> Identity (Sum Int)
                  -> Bool

-- Ex3

newtype BoolConj = BoolConj Bool deriving (Eq, Show)

instance Semigroup BoolConj where
  (BoolConj True) <> (BoolConj True) = BoolConj True
  (BoolConj _) <> (BoolConj _) = BoolConj False

instance Arbitrary BoolConj where
  arbitrary = BoolConj <$> arbitrary

type BoolConjAssoc = BoolConj
                    -> BoolConj
                    -> BoolConj
                    -> Bool

-- Ex4

data Or a b =
    Fst a
  | Snd b
  deriving (Eq, Show)

instance Semigroup (Or a b) where
  (Fst _) <> (Snd b) = Snd b
  (Fst _) <> (Fst b) = Fst b
  (Snd a) <> (Fst b) = Snd a
  (Snd a) <> (Snd _) = Snd a

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
  arbitrary = oneof [fmap Fst arbitrary, fmap Snd arbitrary]

type OrAssoc = Or Int String
          -> Or Int String
          -> Or Int String
          -> Bool

-- Ex5

newtype Combine a b =
  Combine { unCombine :: (a -> b) }

funEquality :: (Arbitrary a, Show a, Eq b, Show b) => Combine a b -> Combine a b -> Property
funEquality (Combine f) (Combine g) =
  property $ \a -> f a === g a

instance Semigroup Bool where
  True <> True = True
  _ <> _ = False

instance Semigroup b => Semigroup (Combine a b) where
  (Combine f1) <> (Combine f2) = Combine (\x -> (f1 x) <> (f2 x))

instance (Arbitrary a, CoArbitrary a, Arbitrary b, CoArbitrary b) => Arbitrary (Combine a b) where
  arbitrary = Combine <$> arbitrary

type CombineAssoc a b = Combine a b
                      -> Combine a b
                      -> Combine a b
                      -> Property

semigroupFuncAssoc :: (Arbitrary a, Show a, Eq b, Show b, Semigroup b) => CombineAssoc a b
semigroupFuncAssoc a b c =
  (a <> (b <> c)) `funEquality` ((a <> b) <> c)

main :: IO ()
main = do
  quickCheck (semigroupAssoc :: TrivAssoc)
  quickCheck (semigroupAssoc :: IdentityAssoc)
  quickCheck (semigroupAssoc :: BoolConjAssoc)
  quickCheck (semigroupAssoc :: OrAssoc)
  quickCheck $ \(Fn f) (Fn g) (Fn h) ->
    (semigroupFuncAssoc :: CombineAssoc Int Bool) (Combine f) (Combine g) (Combine h)
