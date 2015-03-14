module AVLTreeTest where

import Test.HUnit
import Test.HUnit.Text
import AVLTree

{-Liste aller Tests-}
avlTestList = TestList (insertTests ++ rebalanceTests)

{-Tesdaten-} --ToDo
testAVL = (Node 44 (Node 17 Nil (Node 32 Nil Nil)) (Node 78 (Node 50 (Node 48 Nil Nil) (Node 62 Nil Nil)) (Node 88 Nil Nil)))
resultInsertAVL = (Node 44 (Node 17 Nil (Node 32 Nil Nil)) (Node 62 (Node 50 (Node 48 Nil Nil) (Node 54 Nil Nil)) (Node 78 Nil (Node 88 Nil Nil))))

{-Testen von remove-} --ToDo
remove1 = insertList [5,3,7,1,4] Nil
remove1comp = insertList [5,3,1,4] Nil
removeTest1 = assertEqual "remove1" (remove1comp) (remove 7 remove1)

remove2 = insertList [5,3,7,6,1,4] Nil
remove2comp = insertList [5,3,1,4,7] Nil
removeTest2 = assertEqual "remove2" (remove2comp) (remove 6 remove2)

remove3 = insertList [5,3,7,8,1,4] Nil
remove3comp = insertList [5,3,1,4,7] Nil
removeTest3 = assertEqual "remove3" (remove3comp) (remove 8 remove3)

remove4 = insertList [5,3,7,6,1,4] Nil
remove4comp = insertList [5,3,1,4,6] Nil
removeTest4 = assertEqual "remove4" (remove4comp) (remove 7 remove4)

remove5 = insertList [5,3,7,8,1,4] Nil
remove5comp = insertList [5,3,1,4,8] Nil
removeTest5 = assertEqual "remove5" (remove5comp) (remove 7 remove5)

remove6 = insertList [5,3,7,8,1,4] Nil
remove6comp = insertList [7,3,1,4,8] Nil
removeTest6 = assertEqual "remove6" (remove6comp) (remove 5 remove6)

remove7 = insertList [5,3,7,6,1,4] Nil
remove7comp = insertList [6,7,3,1,4] Nil
removeTest7 = assertEqual "remove7" (remove7comp) (remove 5 remove7)

remove8 = insertList [5,3,1,4,7,6,7] Nil
remove8comp = insertList [6,7,7,3,1,4] Nil
removeTest8 = assertEqual "remove8" (remove8comp) (remove 5 remove8)

removeTests = [TestLabel "remove1" (TestCase removeTest1),TestLabel "remove2" (TestCase removeTest2),
               TestLabel "remove3" (TestCase removeTest3), TestLabel "remove4" (TestCase removeTest4),
               TestLabel "remove5" (TestCase removeTest5),TestLabel "remove6" (TestCase removeTest6),
               TestLabel "remove7" (TestCase removeTest7),TestLabel "remove8" (TestCase removeTest8)]

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
