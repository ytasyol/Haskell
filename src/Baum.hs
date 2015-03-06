
data Baum e = Nil | Blatt (Baum e) e (Baum e)

-- Sucht in einem Baum ein bestimmtes Element
existiert :: (Baum e) -> e -> Bool
existiert Nil x = False
existiert (Blatt links element rechts) x
   | x == element    = True
   | x < element     = existiert links x
   | otherwise = existiert rechts x

einfuegen :: (Baum e) -> e -> (Baum e)
einfuegen Nil x = Blatt Nil x Nil
einfuegen (Blatt links element rechts) x
  | x == element    = Blatt links element rechts
  | x < element     = Blatt (einfuegen links x) element rechts
  | otherwise = Blatt links element (einfuegen rechts x)

loescheMax :: (Baum e) -> (e,Baum e)
loescheMax (Blatt links element Nil) = (element,links)
loescheMax (Blatt links element rechts) = (z, Blatt links element tz)
  where (z,tz) = loescheMax rechts

{-
loescheBaum :: (Baum e) -> e -> (Baum e)
loescheBaum Nil x = Nil
loescheBaum (Blatt links element rechts) x
  | x < element   = Blatt (loescheBaum links x) element rechts
  | x > element   = Blatt links element (loescheBaum rechts x)
loescheBaum (Blatt Nil element rechts) x   = rechts
loescheBaum (Blatt links element rechts) x = Blatt tz z rechts
  where (z,tz) = loescheMax links
-}

baumEinfuegen :: (Baum e) -> e -> (Baum e)
baumEinfuegen Nil x = Blatt Nil x Nil
baumEinfuegen (Blatt links element rechts) x
  | x == element    = Blatt links element rechts
  | x < element     = rebalance (Blatt (baumEinfuegen links x) element rechts)
  | otherwise = rebalance (Blatt links element (baumEinfuegen rechts x))


loescheBaum :: (Baum e) -> e -> (Baum e)
loescheBaum Nil x = Nil
loescheBaum (Blatt links element rechts) x
  | x < element   = rebalance (Blatt (loescheBaum links x) element rechts)
  | x > element   = rebalance (links element (loescheBaum rechts x))
loescheBaum (Blatt Nil element rechts) x   = rechts
loescheBaum (Blatt links element rechts) x = rebalance (Blatt tz z rechts)
  where (z,tz) = loescheMax links

-- (inorder t1)++[y]++(inorder t21)++[z]++(inorder t22)++[x]++(inorder t3)

rebalance :: (Baum e) -> (Baum e)
rebalance (Blatt links element rechts)
 | abs (sy) < 2         = Blatt links element rechts
 | sy == 2 && st1 /= -1 = rotateright (Blatt links element rechts)
 | sy == 2 && st1 == -1 = rotateright (Blatt (rotateleft links) element rechts)
 | sy == -2 && st2 /= 1 = rotateleft (Blatt links element rechts)
 | sy == -2 && st2 == 1 = rotateleft (Blatt links element (rotateright rechts))
  where
  sy  = slope (Blatt links element rechts)
  st1 = slope links
  st2 = slope rechts

rotateright (Blatt (Blatt links element rechts) x t3) = Blatt links element (Blatt rechts x t3)
rotateleft  (Blatt links x (Blatt rechts element t3)) = Blatt (Blatt links element rechts) x t3


slope :: (Baum e) -> Int
slope Nil = 0
slope (Blatt links element rechts) = (height links) - (height rechts)

height :: (Baum e) -> Int
height Nil = 0
height (Blatt links element rechts) = 1 + (max (height links) (height rechts))

{-
height :: (Stree a) -> Int
height Nil = 0
height (Node m t1 x t2) = m
-}