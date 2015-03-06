module BinaryTreeModul
( BinaryTree(Nil,Node), hasLeft, hasRight, size, isEmpty, getLeft, getRight, insertLeft, insertRight, attach
) where

import DataStructModul

data BinaryTree a = Nil | Node a (BinaryTree a) (BinaryTree a) deriving (Show)

--addRoot => Wird fuer obige Datenstruktur nicht benoetigt

hasLeft :: BinaryTree a -> Bool
hasLeft Nil = False
hasLeft (Node _ Nil _) = False
hasLeft (Node _ _ _) = True

hasRight :: BinaryTree a -> Bool
hasRight Nil = False
hasRight (Node _ _ Nil) = False
hasRight (Node _ _ _) = True

getLeft :: BinaryTree a -> BinaryTree a
getLeft (Node _ left _) = left
getLeft _ = Nil

getRight :: BinaryTree a -> BinaryTree a
getRight (Node _ _ right) = right
getRight _ = Nil

insertLeft :: a -> BinaryTree a -> BinaryTree a
insertLeft nElement (Node element  Nil right) = Node element (Node nElement Nil Nil) right
insertLeft _ tree = tree

insertRight :: a -> BinaryTree a -> BinaryTree a
insertRight nElement (Node element  left Nil) = Node element left (Node nElement Nil Nil)
insertRight _ tree = tree

--remove

attach :: a -> BinaryTree a -> BinaryTree a -> BinaryTree a
attach element leftTree rightTree = Node element leftTree rightTree


instance DataStruct (BinaryTree a) where
    size (Nil) = 0
    size (Node element left right) = 1 + size left + size right

    isEmpty (Nil) = True
    isEmpty (Node _ _ _) = False