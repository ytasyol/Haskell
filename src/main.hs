module Main where

{-
import Test.HUnit
import Test.HUnit.Text
import BinarySearchTreeTest
import AVLTree

testBST = insertList [5,3,1,4,9,7,13] Nil


main = do
    putStrLn "BinarySearchTreeTest:"
    runTestTT testList

-}
{-
-- module Main where
import Test.HUnit
import Test.HUnit.Text
import BinarySearchTreeTest
import AVLTreeTest
main = do
    putStrLn "BinarySearchTreeTest:"
    runTestTT bstTestList
    putStrLn "AVLTreeTest:"
    runTestTT avlTestList
-}


import Graphics.UI.Gtk
import Graphics.UI.Gtk.Builder
--import Graphics.Rendering.Cairo
--import Graphics.UI.Gtk.Glade
import BinarySearchTree
import Data.Tree
import Data.Tree.Pretty

main = do
    initGUI

    builder <- builderNew
    builderAddFromFile builder "interface.glade"

    mainWindow <- builderGetObject builder castToWindow "window1"
    onDestroy mainWindow mainQuit

    label <- builderGetObject builder castToLabel "label1"

    btn_insert0 <- builderGetObject builder castToButton "btn_ins_0"
    btn_insert1 <- builderGetObject builder castToButton "btn_ins_1"
    btn_insert2 <- builderGetObject builder castToButton "btn_ins_2"
    btn_insert3 <- builderGetObject builder castToButton "btn_ins_3"
    btn_insert4 <- builderGetObject builder castToButton "btn_ins_4"
    btn_insert5 <- builderGetObject builder castToButton "btn_ins_5"
    btn_insert6 <- builderGetObject builder castToButton "btn_ins_6"
    btn_insert7 <- builderGetObject builder castToButton "btn_ins_7"
    btn_insert8 <- builderGetObject builder castToButton "btn_ins_8"
    btn_insert9 <- builderGetObject builder castToButton "btn_ins_9"


    btn_remove0 <- builderGetObject builder castToButton "btn_rem_0"
    btn_remove1 <- builderGetObject builder castToButton "btn_rem_1"
    btn_remove2 <- builderGetObject builder castToButton "btn_rem_2"
    btn_remove3 <- builderGetObject builder castToButton "btn_rem_3"
    btn_remove4 <- builderGetObject builder castToButton "btn_rem_4"
    btn_remove5 <- builderGetObject builder castToButton "btn_rem_5"
    btn_remove6 <- builderGetObject builder castToButton "btn_rem_6"
    btn_remove7 <- builderGetObject builder castToButton "btn_rem_7"
    btn_remove8 <- builderGetObject builder castToButton "btn_rem_8"
    btn_remove9 <- builderGetObject builder castToButton "btn_rem_9"

    testTree :: BinarySearchTree Int

    onClicked btn_insert0 $ do
        testTree <- insert 0 testTree
        let putStrLn testTree
        --labelSetText label (drawVerticalTree testTree)

    onClicked btn_insert1 (putStrLn "btn_insert1")
    onClicked btn_insert2 (putStrLn "btn_insert2")
    onClicked btn_insert3 (putStrLn "btn_insert3")
    onClicked btn_insert4 (putStrLn "btn_insert4")
    onClicked btn_insert5 (putStrLn "btn_insert5")
    onClicked btn_insert6 (putStrLn "btn_insert6")
    onClicked btn_insert7 (putStrLn "btn_insert7")
    onClicked btn_insert8 (putStrLn "btn_insert8")
    onClicked btn_insert9 (putStrLn "btn_insert9")

    onClicked btn_remove0 (putStrLn "btn_remove0")
    onClicked btn_remove1 (putStrLn "btn_remove1")
    onClicked btn_remove2 (putStrLn "btn_remove2")
    onClicked btn_remove3 (putStrLn "btn_remove3")
    onClicked btn_remove4 (putStrLn "btn_remove4")
    onClicked btn_remove5 (putStrLn "btn_remove5")
    onClicked btn_remove6 (putStrLn "btn_remove6")
    onClicked btn_remove7 (putStrLn "btn_remove7")
    onClicked btn_remove8 (putStrLn "btn_remove8")
    onClicked btn_remove9 (putStrLn "btn_remove9")


    -- entry <- builderGetObject builder castToEntry "entry1"

    -- btn_insert <- builderGetObject builder castToButton "btn_insert"
    --onClicked btn_insert (labelSetText label (drawVerticalTree tree))

    --btn_remove <- builderGetObject builder castToButton "btn_remove"

    --onClicked btn_remove $ do
        --entyText <- entryGetText entry

    -- text <- builderGetObject builder castToTextView "textview1"
    -- textViewSetBuffer  text (putStrLn "test")

    windowSetDefaultSize mainWindow 640 480

    widgetShowAll mainWindow
    mainGUI


{-

tree :: Tree String
tree = Node "hello" [ Node "foo" []
                     , Node "bars" [ Node "oi!" []
                                   , Node "baz" [ Node "a" [ Node "b" []
                                                           , Node "c" []]
                                                , Node "d" [ Node "e" []]]]
                     , Node "foobar" []]

-}
{-
main :: IO ()
main = do
    initGUI
    window      <- windowNew
    drawingArea <- drawingAreaNew
    containerAdd window drawingArea

    drawingArea `onExpose` (\_ -> renderScene drawingArea)
    window `onDestroy` mainQuit

    windowSetDefaultSize window 640 480
    widgetShowAll window
    mainGUI

renderScene :: DrawingArea -> IO Bool
renderScene da = do
    dw <- widgetGetDrawWindow da
    renderWithDrawable dw $ do setSourceRGBA 0.5 0.5 0.5 1.0
                               moveTo 100.0 100.0
                               showText (drawVerticalTree tree)
    return True

    -}
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



