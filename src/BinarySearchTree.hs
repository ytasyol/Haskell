module BinarySearchTree (
BinarySearchTree(Nil,Node), isEmpty, size, contains, insert, remove,
insertList, preOrder, postOrder, inOrder, levelOrder,
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

{- Quellen:
 -
 - remove: http://stackoverflow.com/questions/9626132/delete-node-from-binary-search-tree-haskell
 - removeRoot: DuA 09 Such- und AVL-B+ñume v 8.0 valid [Script Herr Meinholz]
 -}
remove :: (Ord a, Eq a) => a -> BinarySearchTree a -> BinarySearchTree a
remove _ Nil = Nil
remove pElement (Node tElement tLeft tRight)
    | (==) pElement tElement = removeRoot (Node tElement tLeft tRight)
    | (<) pElement tElement = (Node tElement (removeRoot tLeft) tRight)
    | otherwise = (Node tElement tLeft (removeRoot tRight))
    where
        removeRoot Nil = Nil
        removeRoot (Node _ Nil tRight) = tRight
        removeRoot (Node _ tLeft Nil) = tLeft
        removeRoot (Node _ )



insertList :: (Ord a, Eq a) => [a] -> BinarySearchTree a -> BinarySearchTree a
insertList [] pTree = pTree
insertList (x:xs) pTree = insertList xs (insert x pTree)

{-Traversierungs Funktionen-}
--ToDo: Funktionen Refactoren

preOrder :: BinarySearchTree a -> [a]
preOrder Nil = []
preOrder (Node tElement tLeft tRight) = [tElement] ++ preOrder tLeft ++ preOrder tRight

postOrder :: BinarySearchTree a -> [a]
postOrder Nil = []
postOrder (Node tElement tLeft tRight) = postOrder tLeft ++ postOrder tRight ++ [tElement]

inOrder :: BinarySearchTree a -> [a]
inOrder Nil = []
inOrder (Node tElement tLeft tRight) = inOrder tLeft ++ [tElement] ++ inOrder tRight

levelOrder :: BinarySearchTree a -> [a]
levelOrder Nil = []
levelOrder pTree = getElements (generateNodeList [pTree])
	where
	    generateNodeList [] = []
	    generateNodeList nodes = nodes ++ generateNodeList (listListToList [getChilds node | node <- nodes])
	    getChilds Nil = []
	    getChilds (Node _ tLeft tRight) = [tLeft,tRight]
	    listListToList [] = []
	    listListToList (x:xs) = x ++ listListToList xs
	    getElements [] = []
	    getElements (Nil:xs) = []
	    getElements ((Node tElement tLeft tRight):xs) = [tElement] ++ getElements xs

{-Signaturen fuer Interne Funktionen (fuer Verstaendnis)-}
--generateNodeList :: [BinarySearchTree a] -> [BinarySearchTree a]
--getChilds :: BinarySearchTree a -> [BinarySearchTree a]
--getElements :: [BinarySearchTree a] -> [a]
--listListToList :: [[BinarySearchTree a]] -> [BinarySearchTree a]