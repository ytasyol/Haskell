module BinaryTreeModul
( BinaryTree(Nil,Node), hasLeft, hasRight, size, isEmpty
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

--getLeft :: BinaryTree a -> BinaryTree a


--getRight
--insertLeft
--insertRight
--remove
--attach

instance DataStruct (BinaryTree a) where
    size (Nil) = 0
    size (Node element left right) = 1 + size left + size right

    isEmpty (Nil) = True
    isEmpty (Node _ _ _) = False