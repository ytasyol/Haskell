module Main where

import Test.HUnit
import Test.HUnit.Text
import BinarySearchTreeTest
import AVLTreeTest

main = do
    putStrLn "BinarySearchTreeTest:"
    runTestTT bstTestList
    putStrLn "AVLTreeTest:"
    runTestTT avlTestList
