module AVLTree (
BinarySearchTree(Nil,Node), isEmpty, size, contains, insert, remove,
insertList, preOrder, postOrder, inOrder, levelOrder
) where

import BinarySearchTree

newtype AVLTree a = BinarySearchTree a
