module Main where


import Test.HUnit
import Test.HUnit.Text
import BinarySearchTreeTest

main = do
    putStrLn "BinarySearchTreeTest:"
    runTestTT testList



















{-
import BinarySearchTree
{-Tests-}
testInsert1 = insert 3 Nil
testInsert2 = insert 5 testInsert1
testInsert3 = insert 2 testInsert2
testInsert4 = insert 3 testInsert3
testInsert5 = insert 7 testInsert4

testContains1 = contains 5 testInsert5
testContains2 = contains 1 testInsert5

testInsertList = insertList [5,2,1,7,9,3,6,8,4,7,9,3,74,123,5,2,6] Nil

testBST = insertList [5,3,1,4,9,7,13] Nil
bstList = [testBST]
testPreOrder = preOrder testBST
testPostOrder = postOrder testBST
testInOrder = inOrder testBST
testLevelOrder = levelOrder testBST

--import Graphics.UI.Gtk
{-
main :: IO ()
main = do
  initGUI
  window <- windowNew
  widgetShowAll window
  mainGUI
  -}
-}