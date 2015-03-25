module AVLTreeTest where

import Test.HUnit
import Test.HUnit.Text
import AVLTree

{-Liste aller Tests-}
avlTestList = TestList (insertTests ++ rebalanceTests ++ removeTests)

{-Tesdaten-}
testAVL = (Node 44 (Node 17 Nil (Node 32 Nil Nil)) (Node 78 (Node 50 (Node 48 Nil Nil) (Node 62 Nil Nil)) (Node 88 Nil Nil)))
resultInsertAVL = (Node 44 (Node 17 Nil (Node 32 Nil Nil)) (Node 62 (Node 50 (Node 48 Nil Nil) (Node 54 Nil Nil)) (Node 78 Nil (Node 88 Nil Nil))))
testAVLTree5 = (Node 4 (Node 2 (Node 1 Nil Nil) (Node 3 Nil Nil)) (Node 6 (Node 5 Nil Nil) (Node 7 Nil Nil)))
resultAVLTree5 = (Node 4 (Node 2 (Node 1 Nil Nil) (Node 3 Nil Nil)) (Node 6 (Node 5 Nil Nil) (Node 7 Nil (Node 8 Nil Nil))))

drawTestAVLPretty1 = putStrLn (drawAVLTreePretty testAVL)
drawTestAVLPretty2 = putStrLn (drawAVLTreePretty resultAVLTree5)

{-Testen von remove-}
remove1 = resultAVLTree5 -- 5
remove1comp = (Node 4 (Node 2 (Node 1 Nil Nil) (Node 3 Nil Nil)) (Node 7 (Node 6 Nil Nil) (Node 8 Nil Nil)))
removeTest1 = assertEqual "remove1" (remove1comp) (remove 5 remove1)
removeTests = [TestLabel "remove1" (TestCase removeTest1)]


{-Testen von insert-}
insertTest1 = assertEqual "insert" resultInsertAVL (insert 54 testAVL)
insertTest2 = assertEqual "insert" resultAVLTree5 (insert 8 testAVLTree5)
insertTests = [TestLabel "insertTest1" (TestCase insertTest1), TestLabel "insertTest2" (TestCase insertTest2)]

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
