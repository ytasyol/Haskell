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
--import Graphics.UI.Gtk.Builder
--import System.Glib.Attributes {-get, set-}

--avlTree = Nil

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

    -- INSERT
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

    txtfield <- entryNew
    boxPackStart vb2 txtfield PackNatural 3



    txtstack <- statusbarNew
    boxPackStart vb2 txtstack PackNatural 0
    id <- statusbarGetContextId txtstack "Line"

    widgetShowAll window
    --widgetSetSensitivity btn_insert False

    onEntryActivate txtfield (saveText txtfield btn_insert txtstack id)
    onPressed btn_insert (statusbarPop txtstack id)
    onDestroy window mainQuit

    mainGUI

saveText :: Entry -> Button -> Statusbar -> ContextId -> IO ()
saveText fld b stk id = do
         txt <- entryGetText fld
         let mesg | txt == reverse txt = "\"" ++ txt ++ "\""  ++
                                         " is equal to its reverse"
                  | otherwise =  "\"" ++ txt ++ "\""  ++
                                 " is not equal to its reverse"
         widgetSetSensitivity b True
         msgid <- statusbarPush stk id mesg
         return ()