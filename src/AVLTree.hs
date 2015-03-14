module AVLTree (
AVLTree, BST.BinarySearchTree(Nil,Node), BST.isEmpty, BST.size, BST.contains, insert, remove,
BST.insertList, BST.preOrder, BST.postOrder, BST.inOrder, BST.levelOrder
) where

import qualified BinarySearchTree as BST

type AVLTree = BST.BinarySearchTree

rebalance :: AVLTree a -> AVLTree a
rebalance pTree = pTree

insert :: (Ord a, Eq a) => a -> AVLTree a -> AVLTree a
insert pElement pTree = rebalance (BST.insert pElement pTree)

remove :: (Ord a, Eq a) => a -> AVLTree a -> AVLTree a
remove pElement pTree = rebalance (BST.remove pElement pTree)

insertList :: (Ord a, Eq a) => [a] -> AVLTree a -> AVLTree a
insertList [] pTree = pTree
insertList (x:xs) pTree = insertList xs (rebalance (insert x pTree))
