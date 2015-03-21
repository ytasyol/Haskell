module AVLTreeTest where

import Test.HUnit
import Test.HUnit.Text
import AVLTree

{-Liste aller Tests-}
avlTestList = TestList (insertTests ++ rebalanceTests)

{-Tesdaten-} --ToDo
testAVL = (Node 44 (Node 17 Nil (Node 32 Nil Nil)) (Node 78 (Node 50 (Node 48 Nil Nil) (Node 62 Nil Nil)) (Node 88 Nil Nil)))
resultInsertAVL = (Node 44 (Node 17 Nil (Node 32 Nil Nil)) (Node 62 (Node 50 (Node 48 Nil Nil) (Node 54 Nil Nil)) (Node 78 Nil (Node 88 Nil Nil))))
drawTestAVLPretty = putStrLn (drawAVLTreePretty testAVL)

{-Testen von remove-} --ToDo


{-Testen von insert-} --ToDo
insertTest1 = assertEqual "insert" resultInsertAVL (insert 54 testAVL)
insertTests = [TestLabel "insertTest1" (TestCase insertTest1)]

{-Testen von insertList-} --ToDo
--insertListTest1 = assertEqual "insertList1" (Node 5 (Node 3 (Node 1 Nil (Node 2 Nil Nil)) (Node 4 Nil Nil)) (Node 9 (Node 7 (Node 6 Nil Nil) (Node 8 Nil Nil)) (Node 13 Nil Nil))) (insertList [6,8,2] testBST3)
--insertListTest2 = assertEqual "insertList1" (Node 7 (Node 4 Nil Nil) (Node 9 Nil (Node 13 Nil Nil))) (insertList [7,4,9,13] Nil)
--insertListTests = [TestLabel "insertListTest1" (TestCase insertListTest1), TestLabel "insertListTest2" (TestCase insertListTest2)]

{-Testen von rotate-}
testAVLTree1 = (Node 13 Nil (Node 20 Nil (Node 24 Nil Nil)))
testAVLTree2 = (Node 24 (Node 20 (Node 13 Nil Nil) Nil) Nil)
testAVLTree3 = (Node 13 Nil (Node 24 (Node 20 Nil Nil) Nil))
testAVLTree4 = (Node 24 (Node 13 Nil (Node 20 Nil Nil)) Nil)
resultAVLTree = (Node 20 (Node 13 Nil Nil) (Node 24 Nil Nil))
rebalanceTest1 = assertEqual "rebalance" resultAVLTree (rebalance testAVLTree1)
rebalanceTest2 = assertEqual "rebalance" resultAVLTree (rebalance testAVLTree2)
rebalanceTest3 = assertEqual "rebalance" resultAVLTree (rebalance testAVLTree3)
rebalanceTest4 = assertEqual "rebalance" resultAVLTree (rebalance testAVLTree4)
rebalanceTests = [TestLabel "rebalanceTest1" (TestCase rebalanceTest1),TestLabel "rebalanceTest2" (TestCase rebalanceTest2),
                  TestLabel "rebalanceTest3" (TestCase rebalanceTest3), TestLabel "rebalanceTest4" (TestCase rebalanceTest4)]
