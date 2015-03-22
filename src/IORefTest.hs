module IORefTest where

import AVLTree
import Data.IORef
import Data.Global

main = do
    avlTree <- newIORef [1,2,3,4,5]
    tmp <- readIORef avlTree
    print tmp
    writeIORef avlTree (tmp ++ [6])
    tmp <- readIORef avlTree
    print tmp


