module AVLTreeTest where

import Test.HUnit
import Test.HUnit.Text
import AVLTree

{-Liste aller Tests-}
avlTestList = TestList (removeTests ++ insertTests ++ insertListTests)

{-Tesdaten-}
testBST1 = insertList [5,3,1,4,9,7,13] Nil
testBST2 = insertList [5,3,1,9,7,13] Nil
testBST3 = (Node 5 (Node 3 (Node 1 Nil Nil) (Node 4 Nil Nil)) (Node 9 (Node 7 Nil Nil) (Node 13 Nil Nil)))

{-Testen von remove-}
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

{-Testen von insert-}
insertTest1 = assertEqual ("insert" ++ ("Nil")) (Node 7 Nil Nil) (insert 7 Nil)
insertTest2 = assertEqual ("insert" ++ (show testBST3)) (Node 5 (Node 3 (Node 1 Nil Nil) (Node 4 Nil Nil)) (Node 9 (Node 7 (Node 6 Nil Nil) Nil) (Node 13 Nil Nil))) (insert 6 testBST3)
insertTests = [TestLabel "insertTest1" (TestCase insertTest1), TestLabel "insertTest2" (TestCase insertTest2)]

{-Testen von insertList-}
insertListTest1 = assertEqual "insertList1" (Node 5 (Node 3 (Node 1 Nil (Node 2 Nil Nil)) (Node 4 Nil Nil)) (Node 9 (Node 7 (Node 6 Nil Nil) (Node 8 Nil Nil)) (Node 13 Nil Nil))) (insertList [6,8,2] testBST3)
insertListTest2 = assertEqual "insertList1" (Node 7 (Node 4 Nil Nil) (Node 9 Nil (Node 13 Nil Nil))) (insertList [7,4,9,13] Nil)
insertListTests = [TestLabel "insertListTest1" (TestCase insertListTest1), TestLabel "insertListTest2" (TestCase insertListTest2)]