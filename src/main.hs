module Main where

{-Imports-}
import BinarySearchTreeTest as BSTT
import AVLTreeTest as AVLT
import AVLTree as AVL
{-Imports Tests-}
import Test.HUnit
import Test.HUnit.Text
{-Imports GUI-}
import Graphics.UI.Gtk
import Data.IORef
import Data.Global

tests = do
    putStrLn "BinarySearchTreeTest:"
    runTestTT BSTT.bstTestList
    putStrLn "AVLTreeTest:"
    runTestTT AVLT.avlTestList

main :: IO ()
main = do
    --damit der AVL-Baum zwischen gespeichert werden kann (mutable Variable)
    avlTreeList <- newIORef []
    {-GUI Aufbauen-}
    initGUI
    window <- windowNew
    set window [windowTitle := "AVL-Tree", containerBorderWidth := 10]
    --Container
    hb <- hBoxNew False 5
    containerAdd window hb
    vb <- vBoxNew False 5
    boxPackStart hb vb PackNatural 0
    vb2 <- vBoxNew False 5
    boxPackStart hb vb2 PackNatural 0
    -- Function Label
    label_func <- labelNewWithMnemonic "functions:"
    boxPackStart vb label_func PackNatural 0
    -- INSERT Button
    btn_insert <- buttonNewWithLabel "insert"
    boxPackStart vb btn_insert PackNatural 0
    -- REMOVE Buttn
    btn_remove <- buttonNewWithLabel "remove"
    boxPackStart vb btn_remove PackNatural 0
    -- CLEAR Button
    btn_clear <- buttonNewWithLabel "clear"
    boxPackStart vb btn_clear PackNatural 0
    -- TINPUT Field
    txtfield <- entryNew
    boxPackStart vb2 txtfield PackNatural 3
    -- OUTPUT Field
    txtView <- labelNewWithMnemonic ""
    boxPackStart vb2 txtView PackNatural 3
    -- STATUSBAR
    txtstack <- statusbarNew
    boxPackStart vb2 txtstack PackNatural 0
    id <- statusbarGetContextId txtstack "Line"

    widgetShowAll window

    {-Button Events-}
    onPressed btn_insert (do
        inputString <- entryGetText txtfield
        tmpList <- readIORef avlTreeList
        let tmpTree = insertList tmpList Nil
        let afterInsert = insert (read inputString :: Int) tmpTree
        let newList = levelOrder afterInsert
        writeIORef avlTreeList newList
        showMessage txtView (drawAVLTreePretty afterInsert)
        setBar txtstack ("Insert " ++ inputString) id
        )

    onPressed btn_remove (do
        inputString <- entryGetText txtfield
        tmpList <- readIORef avlTreeList
        let tmpTree = insertList tmpList Nil
        let afterInsert = AVL.remove (read inputString :: Int) tmpTree
        let newList = levelOrder afterInsert
        writeIORef avlTreeList newList

        showMessage txtView (drawAVLTreePretty afterInsert)
        setBar txtstack ("Remove " ++ inputString) id
        )

    onPressed btn_clear (do
        writeIORef avlTreeList []
        showMessage txtView ""
        setBar txtstack "Clear" id
        )

    onDestroy window mainQuit
    mainGUI

{-Hilfsfunktionen-}
showMessage ::  Label -> String -> IO ()
showMessage label string = do
    labelSetText label string
    return ()

setBar ::  Statusbar -> String -> ContextId -> IO ()
setBar statusBar string id = do
    statusbarPush statusBar id string
    return ()
