module BinarySearchTreeTest where

--https://wiki.haskell.org/HUnit_1.0_User%27s_Guide
--asserEqual (Text) (Erwartungswert) (Aktuellerwert)
import Test.HUnit
import Test.HUnit.Text
import BinarySearchTree

{-Liste aller Tests-}
testList = TestList (isEmptyTests ++ sizeTests ++ heightTests ++ containsTests ++ insertTests)

{-Tesdaten-}
testBST1 = insertList [5,3,1,4,9,7,13] Nil
testBST2 = insertList [5,3,1,9,7,13] Nil
testBST3 = (Node 5 (Node 3 (Node 1 Nil Nil) (Node 4 Nil Nil)) (Node 9 (Node 7 Nil Nil) (Node 13 Nil Nil)))

{-Testen von isEmpty-}
isEmptyTest1 = assertEqual "isEmpty Nil" True (isEmpty Nil)
isEmptyTest2 = assertEqual ("isEmpty" ++ (show testBST1)) False (isEmpty testBST1)
isEmptyTest3 = assertEqual ("isEmpty" ++ (show testBST2)) False (isEmpty testBST2)
isEmptyTests = [TestLabel "isEmptyTest1" (TestCase isEmptyTest1), TestLabel "isEmptyTest2" (TestCase isEmptyTest2),
                TestLabel "isEmptyTest3" (TestCase isEmptyTest3)]

{-Testen von size-}
sizeTest1 = assertEqual "size Nil" 0 (size Nil)
sizeTest2 = assertEqual ("size" ++ (show testBST1)) 7 (size testBST1)
sizeTest3 = assertEqual ("size" ++ (show testBST2)) 6 (size testBST2)
sizeTests = [TestLabel "sizeTest1" (TestCase sizeTest1), TestLabel "sizeTest2" (TestCase sizeTest2),
             TestLabel "sizeTest3" (TestCase sizeTest3)]

{-Testen von height-}
heightTest1 = assertEqual "height Nil" 0 (height Nil)
heightTest2 = assertEqual ("height" ++ (show testBST1)) 3 (height testBST1)
heightTest3 = assertEqual ("height" ++ (show testBST2)) 3 (height testBST2)
heightTests = [TestLabel "heightTest1" (TestCase heightTest1), TestLabel "heightTest2" (TestCase heightTest2),
               TestLabel "heightTest3" (TestCase heightTest3)]

{-Testen von contains-}
containsTest1 = assertEqual ("contains" ++ (show testBST1)) False (contains 28 testBST1)
containsTest2 = assertEqual ("contains" ++ (show testBST1)) True (contains 3 testBST1)
containsTests = [TestLabel "heightTest1" (TestCase containsTest1), TestLabel "heightTest2" (TestCase containsTest2)]

{-Testen von insert-}
insertTest1 = assertEqual ("insert" ++ ("Nil")) (Node 7 Nil Nil) (insert 7 Nil)
insertTest2 = assertEqual ("insert" ++ (show testBST3)) (Node 5 (Node 3 (Node 1 Nil Nil) (Node 4 Nil Nil)) (Node 9 (Node 7 (Node 6 Nil Nil) Nil) (Node 13 Nil Nil))) (insert 6 testBST3)
insertTests = [TestLabel "insertTest1" (TestCase insertTest1), TestLabel "insertTest2" (TestCase insertTest2)]
