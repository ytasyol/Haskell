module BinarySearchTree (
BinarySearchTree(Nil,Node), isEmpty, size, contains, insert, {-remove,-}
insertList, preOrder, postOrder, inOrder, {-levelOrder-}
) where

{-Datenstruktur-}
data BinarySearchTree a = Nil | Node  a (BinarySearchTree a) (BinarySearchTree a)
	deriving Show

{-Informations Funktionen-}
isEmpty :: BinarySearchTree a -> Bool
isEmpty Nil = True
isEmpty _ = False

size :: BinarySearchTree a -> Int
size Nil = 0
size (Node _ lTree rTree) = 1 + size lTree + size rTree

contains :: (Ord a, Eq a) => a -> BinarySearchTree a -> Bool
contains _ Nil = False
contains pElement (Node tElement tLeft tRight)
    | (==) pElement tElement = True
    | (<) pElement tElement = contains pElement tLeft
    | otherwise = contains pElement tRight

{-Manipulations Funktionen-}
insert :: (Ord a, Eq a) => a -> BinarySearchTree a -> BinarySearchTree a
insert pElement Nil = Node pElement Nil Nil
insert pElement (Node tElement tLeft tRight)
    | (<=) pElement tElement = Node tElement (insert pElement tLeft) tRight
    | otherwise = Node tElement tLeft (insert pElement tRight)

--remove :: (Ord a, Eq a) => a -> BinarySearchTree a -> BinarySearchTree a
--remove pElement Nil = Nil
--remove pElement (Node tElement tLeft tRight)
--    | (==) pElement tElement

insertList :: (Ord a, Eq a) => [a] -> BinarySearchTree a -> BinarySearchTree a
insertList [] pTree = pTree
insertList (x:xs) pTree = insertList xs (insert x pTree)

{-Traversierungs Funktionen-}
--ToDo: Funktionen Refactoren

preOrder :: BinarySearchTree a -> [a]
preOrder Nil = []
preOrder (Node tElement tLeft tRight) = [tElement] ++ (preOrder tLeft) ++ (preOrder tRight)

postOrder :: BinarySearchTree a -> [a]
postOrder Nil = []
postOrder (Node tElement tLeft tRight) = (postOrder tLeft) ++ (postOrder tRight) ++ [tElement]

inOrder :: BinarySearchTree a -> [a]
inOrder Nil = []
inOrder (Node tElement tLeft tRight) = (inOrder tLeft) ++ [tElement] ++ (inOrder tRight)

--levelOrder :: BinarySearchTree a -> [a]
--levelOrder Nil = []
--levelOrder (Node tElement tLeft tRight) = []
