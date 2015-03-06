module BinaryTreeModul
( BinaryTree(Nil,Node), addRoot, hasLeft, hasRight, size, isEmpty
) where

import DataStructModul

data BinaryTree a = Nil | Node a (BinaryTree a) (BinaryTree a) deriving (Show)

--addRoot :: a -> BinaryTree a
--addRoot element = Node element Nil Nil
addRoot :: a -> BinaryTree a -> BinaryTree a
addRoot element Nil = Node element Nil Nil
addRoot _ bTree = bTree

hasLeft :: BinaryTree a -> Bool
hasLeft Nil = False
hasLeft (Node _ Nil _) = False
hasLeft (Node _ _ _) = True

hasRight :: BinaryTree a -> Bool
hasRight Nil = False
hasRight (Node _ _ Nil) = False
hasRight (Node _ _ _) = True

instance DataStruct (BinaryTree a) where
    size (Nil) = 0
    size (Node element left right) = 1 + size left + size right

    isEmpty (Nil) = True
    isEmpty (Node _ _ _) = False