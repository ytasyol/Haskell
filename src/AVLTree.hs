module AVLTree (
AVLTree, BST.BinarySearchTree(Nil,Node), BST.isEmpty, BST.size, BST.contains, insert, remove,
BST.insertList, BST.preOrder, BST.postOrder, BST.inOrder, BST.levelOrder, rebalance
) where

import qualified BinarySearchTree as BST

type AVLTree = BST.BinarySearchTree

rebalance :: AVLTree a -> AVLTree a
rebalance BST.Nil = BST.Nil
rebalance (BST.Node tElement tLeft tRight)
    | (<) (abs (heightDiffChilds (BST.Node tElement tLeft tRight))) 2 = (BST.Node tElement tLeft tRight)
    | (>) (abs (heightDiffChilds tLeft)) 1 = (BST.Node tElement (rebalance tLeft) tRight)
    | (>) (abs (heightDiffChilds tRight)) 1 = (BST.Node tElement tLeft (rebalance tRight))
    | (<) (BST.height tLeft) (BST.height tRight) && (<) (heightDiffChilds tRight) 0 =
        rotateLeft(BST.Node tElement tLeft tRight)
    | (>) (BST.height tLeft) (BST.height tRight) && (>) (heightDiffChilds tLeft) 0 =
        rotateRight (BST.Node tElement tLeft tRight)
    | (<) (BST.height tLeft) (BST.height tRight) && (>) (heightDiffChilds tRight) 0 =
        rotateRL (BST.Node tElement tLeft tRight)
    | (>) (BST.height tLeft) (BST.height tRight) && (<) (heightDiffChilds tLeft) 0 =
        rotateLR (BST.Node tElement tLeft tRight)
    | otherwise = (BST.Nil)
    where
        heightDiffChilds BST.Nil = 0
        heightDiffChilds (BST.Node _ tLeft tRight) = ((-) (BST.height tLeft) (BST.height tRight))
        rotateRL (BST.Node tElement tLeft tRight) = rotateLeft (BST.Node tElement tLeft (rotateRight tRight))
        rotateLR (BST.Node tElement tLeft tRight) = rotateRight (BST.Node tElement (rotateLeft tLeft) tRight)
        rotateLeft (BST.Node tElement tLeft (BST.Node ctElement ctLeft ctRight)) =
            BST.Node ctElement (BST.Node tElement tLeft ctLeft) ctRight
        rotateRight (BST.Node tElement (BST.Node ctElement ctLeft ctRight) tRight) =
            BST.Node ctElement ctLeft (BST.Node tElement ctRight tRight)

insert :: (Ord a, Eq a) => a -> AVLTree a -> AVLTree a
insert pElement pTree = rebalance (BST.insert pElement pTree)

remove :: (Ord a, Eq a) => a -> AVLTree a -> AVLTree a
remove pElement pTree = rebalance (BST.remove pElement pTree)

insertList :: (Ord a, Eq a) => [a] -> AVLTree a -> AVLTree a
insertList [] pTree = pTree
insertList (x:xs) pTree = insertList xs (rebalance (insert x pTree))
