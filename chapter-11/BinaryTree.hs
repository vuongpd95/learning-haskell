data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Node left a right
  | b < a  = Node (insert' b left) a right
  | b > a  = Node left a (insert' b right)

-- mapTree exercises
mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b

mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
  Node (mapTree f left) (f a) (mapTree f right)

testTree' :: BinaryTree Integer
testTree' =
  Node  (Node Leaf 3 Leaf)
        1
        (Node Leaf 4 Leaf)

mapExpected =
  Node  (Node Leaf 4 Leaf)
        2
        (Node Leaf 5 Leaf)

mapOkay =
  if mapTree (+1) testTree' == mapExpected
  then print "Yup Okay!"
  else error "Test failed!"

-- Turn BinaryTree into a List 
preorder :: BinaryTree a -> [a]
preorder (Node left a right) =
  order (Node left a right) [] where
    order (Node left a right) r =
      a:(order left (order right r))
    order _ r = r
 
preorder _ = []

inorder :: BinaryTree a -> [a]
inorder (Node left a right) =
  order (Node left a right) [] where
    order (Node left a right) r =
      order left (a:(order right r))
    order _ r = r
 
inorder _ = []

postorder :: BinaryTree a -> [a]
postorder (Node left a right) =
  order (Node left a right) [] where
    order (Node left a right) r =
      order left (order right (a:r))
    order _ r = r
 
postorder _ = []

testTree :: BinaryTree Integer
testTree =
  Node  (Node Leaf 1 Leaf)
        2
        (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder =
  if preorder testTree == [2, 1, 3]
  then putStrLn "Preorder fine!"
  else putStrLn "Bed new bears!"

testInorder :: IO ()
testInorder =
  if inorder testTree == [1, 2, 3]
  then putStrLn "Inorder fine!"
  else putStrLn "Bed new bears!"

testPostorder :: IO ()
testPostorder =
  if postorder testTree == [1, 3, 2]
  then putStrLn "Postorder fine!"
  else putStrLn "Bed new bears!"

main :: IO ()
main = do
  testPreorder
  testInorder
  testPostorder

-- foldr for BinaryTree
foldTree :: (a -> b -> b)
          -> b
          -> BinaryTree a
          -> b

foldTree _ z Leaf = z
foldTree f base (Node left a right) =
  f a (foldTree f (foldTree f base left) right)
