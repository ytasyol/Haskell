module Main where
{-
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

{-Imports-}
import AVLTree as AVL
--import qualified BinarySearchTree as BST
{-GUI Imports-}
import Graphics.UI.Gtk
import Data.IORef
import Data.Global
--import Graphics.UI.Gtk.Builder
--import System.Glib.Attributes {-get, set-}
-- import Data.Tree
-- import Data.Tree.Pretty
-- avlTree :: AVLTree Int
-- avlTree <- newIORef (Node 20 (Node 13 Nil Nil) (Node 24 Nil Nil))

--list = [4,2,6,1,3,5,7]
--tree = Node 4 (Node 2 (Node 1 Nil Nil) (Node 3 Nil Nil)) (Node 6 (Node 5 Nil Nil) (Node 7 Nil Nil))
main :: IO ()
main = do
    --IORef Var
    avlTreeList <- newIORef []
    --readIORef
    --writeIORef

    initGUI
    window <- windowNew
    set window [windowTitle := "AVL-Tree", containerBorderWidth := 10]

    hb <- hBoxNew False 5
    containerAdd window hb

    vb <- vBoxNew False 5
    boxPackStart hb vb PackNatural 0

    vb2 <- vBoxNew False 5
    boxPackStart hb vb2 PackNatural 0

    -- Function Label
    label_func <- labelNewWithMnemonic "functions:"
    boxPackStart vb label_func PackNatural 0

    -- INSERT
    btn_insert <- buttonNewWithLabel "insert"
    boxPackStart vb btn_insert PackNatural 0

    -- REMOVE
    btn_remove <- buttonNewWithLabel "remove"
    boxPackStart vb btn_remove PackNatural 0

    -- CLEAR
    btn_clear <- buttonNewWithLabel "clear"
    boxPackStart vb btn_clear PackNatural 0

    -- Texteingabefeld
    txtfield <- entryNew
    boxPackStart vb2 txtfield PackNatural 3

    -- TextAusgabeFeld
    txtView <- labelNewWithMnemonic ""
    boxPackStart vb2 txtView PackNatural 3

    txtstack <- statusbarNew
    boxPackStart vb2 txtstack PackNatural 0
    id <- statusbarGetContextId txtstack "Line"

    widgetShowAll window
    --widgetSetSensitivity btn_insert False

    -- onEntryActivate txtfield (saveText txtfield btn_insert txtstack id)
    -- onPressed btn_insert (statusbarPop txtstack id)
    -- onPressed btn_insert (saveText txtfield txtView txtstack id)

    onPressed btn_insert (do
        myString <- entryGetText txtfield
        tmpList <- readIORef avlTreeList
        let tmpTree = insertList tmpList Nil
        let afterInsert = insert (read myString :: Int) tmpTree
        let newList = levelOrder afterInsert
        writeIORef avlTreeList newList

        showMessage txtView (drawAVLTreePretty afterInsert)
        setBar txtstack ("Insert " ++ myString) id
        )

    onPressed btn_remove (do
        myString <- entryGetText txtfield
        tmpList <- readIORef avlTreeList
        let tmpTree = insertList tmpList Nil
        let afterInsert = AVL.remove (read myString :: Int) tmpTree
        let newList = levelOrder afterInsert
        writeIORef avlTreeList newList

        showMessage txtView (drawAVLTreePretty afterInsert)
        setBar txtstack ("Remove " ++ myString) id
        )

    onPressed btn_clear (do
        writeIORef avlTreeList []
        showMessage txtView ""
        setBar txtstack "Clear" id
        )

    onDestroy window mainQuit

    mainGUI

showMessage ::  Label -> String -> IO ()
showMessage label string = do
    labelSetText label string
    return ()

setBar ::  Statusbar -> String -> ContextId -> IO ()
setBar statusBar string id = do
    statusbarPush statusBar id string
    return ()
