module AVLTree (
AVLTree, BST.BinarySearchTree(Nil,Node), BST.isEmpty, BST.size, BST.contains, insert, remove,
insertList, BST.preOrder, BST.postOrder, BST.inOrder, BST.levelOrder, rebalance {-rebalance nur zum Testen-}
) where

import qualified BinarySearchTree as BST

type AVLTree = BST.BinarySearchTree

rebalance :: AVLTree a -> AVLTree a
rebalance BST.Nil = BST.Nil
rebalance (BST.Node tE tL tR)
    | (>) (abs (hDC tL)) 1 = (BST.Node tE (rebalance tL) tR)
    | (>) (abs (hDC tR)) 1 = (BST.Node tE tL (rebalance tR))
    | (<) (BST.height tL) (BST.height tR) && (<) (hDC tR) 0 = rL(BST.Node tE tL tR)
    | (>) (BST.height tL) (BST.height tR) && (>) (hDC tL) 0 = rR (BST.Node tE tL tR)
    | (<) (BST.height tL) (BST.height tR) && (>) (hDC tR) 0 = rRL (BST.Node tE tL tR)
    | (>) (BST.height tL) (BST.height tR) && (<) (hDC tL) 0 = rLR (BST.Node tE tL tR)
    | otherwise = (BST.Node tE tL tR)
    where
        hDC = heightDiffChilds
        rRL = rotateRL
        rLR = rotateLR
        rL = rotateLeft
        rR = rotateRight

heightDiffChilds :: AVLTree e -> Int
heightDiffChilds BST.Nil = 0
heightDiffChilds (BST.Node _ tLeft tRight) = ((-) (BST.height tLeft) (BST.height tRight))

rotateRL :: AVLTree e -> AVLTree e
rotateRL (BST.Node tElement tLeft tRight) = rotateLeft (BST.Node tElement tLeft (rotateRight tRight))

rotateLR :: AVLTree e -> AVLTree e
rotateLR (BST.Node tElement tLeft tRight) = rotateRight (BST.Node tElement (rotateLeft tLeft) tRight)

rotateLeft :: AVLTree e -> AVLTree e
rotateLeft (BST.Node tElement tLeft (BST.Node ctElement ctLeft ctRight)) =
    BST.Node ctElement (BST.Node tElement tLeft ctLeft) ctRight

rotateRight :: AVLTree e -> AVLTree e
rotateRight (BST.Node tElement (BST.Node ctElement ctLeft ctRight) tRight) =
    BST.Node ctElement ctLeft (BST.Node tElement ctRight tRight)


insert :: (Ord a, Eq a) => a -> AVLTree a -> AVLTree a
insert pElement pTree = rebalance (BST.insert pElement pTree)

remove :: (Ord a, Eq a) => a -> AVLTree a -> AVLTree a
remove pElement pTree = rebalance (BST.remove pElement pTree)

insertList :: (Ord a, Eq a) => [a] -> AVLTree a -> AVLTree a
insertList [] pTree = pTree
insertList (x:xs) pTree = insertList xs  (insert x pTree)
