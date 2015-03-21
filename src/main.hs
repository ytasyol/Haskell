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
import AVLTree
{-GUI Imports-}
import Graphics.UI.Gtk
import Data.IORef
--import Graphics.UI.Gtk.Builder
--import System.Glib.Attributes {-get, set-}
-- import Data.Tree
-- import Data.Tree.Pretty


avlTree :: IORef AVLTree Int
avlTree = unsafePerformIO (newIORef (Node 20 (Node 13 Nil Nil) (Node 24 Nil Nil)))


-- avlTree :: AVLTree Int
-- avlTree <- newIORef (Node 20 (Node 13 Nil Nil) (Node 24 Nil Nil))


main :: IO ()
main = do
    initWindow

initWindow :: IO ()
initWindow = do
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

     -- readIORef v
     --  v 7

    onPressed btn_insert (do
        myString <- readInput txtfield
        writeIORef avlTree ((addToTree (read myString :: Int) (readIORef avlTree)))
        showMessage txtView (drawAVLTreePretty avlTree)
        )

    onPressed btn_clear (do
         showMessage txtView ""
         setBar txtstack "Clear" id)

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


readInput :: Entry -> IO String
readInput entry = entryGetText entry


saveText :: Entry -> Label -> Statusbar -> ContextId -> IO ()
saveText fld label stk id = do
         txt <- entryGetText fld
         x txt stk id
         --msgid <- statusbarPush stk id mesg
         myString <- readInput fld
         showMessage label myString
         return ()

x :: String -> Statusbar -> ContextId -> IO ()
x txt statusBar id
    | txt == "" = setBar statusBar "no Input.." id
    | length txt > 5 = setBar statusBar "Input to long.." id
    | otherwise = setBar statusBar ("Input \"" ++ txt ++ "\"") id

addToTree :: (Ord a, Eq a) => a -> AVLTree a -> AVLTree a
addToTree  element tree = insert element tree

--removeFromTree :: (Ord a, Eq a) => a -> AVLTree a -> AVLTree a
--removeFromTree element tree = remove element tree