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
--import AVLTree
{-GUI Imports-}
import Graphics.UI.Gtk
import Graphics.UI.Gtk.Builder
--import System.Glib.Attributes {-get, set-}

--avlTree = Nil

main :: IO ()
main = do
    initWindow

initWindow :: IO ()
initWindow = do
    initGUI
    --Creat builder and load glade file
    builder <- builderNew
    builderAddFromFile builder "interface2.glade"
    mainWindow <- builderGetObject builder castToWindow "windowMain"
    onDestroy mainWindow mainQuit
    --Label, Inputs and there Events
    treeView <- builderGetObject builder castToLabel "labelView"
    --inputEntry <- builderGetObject builder castToEntry "entryInput"
    inputEntry <- entryNew
    --Button and ButtonEvents
    isEmptyButton <- builderGetObject builder castToButton "buttonIsEmpty"
    --onClicked isEmptyButton (set treeView [labelLabel := (show (insert 5 avlTree))])

    sizeButton <- builderGetObject builder castToButton "buttonSize"
    onClicked sizeButton (sizeClick inputEntry treeView)

    widgetShowAll mainWindow
    mainGUI

sizeClick :: Entry -> Label -> IO ()
sizeClick inputEntry treeView = do
    value <- entryGetText inputEntry
    --set treeView [labelLabel := ($ value)]
    --set treeView [labelLabel := (show (insert 5 avlTree))]
    return ()