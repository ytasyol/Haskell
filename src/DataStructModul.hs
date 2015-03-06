{--------------------------------------------------------------------
 - Diess Modul beinhaltet eine Klasse für selbst erstellte
 - Datenstrukturen. Hier werden alle Funktionen eingetragen,
 - die alle Datenstrukturen gemeinsam haben. Dies wird gemacht,
 - damit die Funktions Aufrufe einheiltlich sind.
 -}
module DataStructModul where

class DataStruct a where
    size :: a -> Int
    isEmpty :: a -> Bool