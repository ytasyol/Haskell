
  data Baum e = Nil | Blatt (Baum e) e (Baum e)

  existiert :: (Baum e) -> e -> Bool
  existiert Nil e = False
  existiert (Blatt links e rechts) x
    | x == e    = True
    | x < e     = existiert links x
    | otherwise = existiert rechts x


  einfuegen :: (Baum e) -> e -> (Baum e)
  einfuegen Nil x = Blatt Nil x Nil
  einfuegen (Node links e rechts) x
    | x == e    = Node links e rechts
    | x < e     = Node (einfuegen links x) e rechts
    | otherwise = Node links e (einfuegen rechts x)


  deletemax :: (STree a) -> (a,STree a)
  deletemax (Node t1 y Nil) = (y,t1)
  deletemax (Node t1 y t2) = (z, Node t1 y tz)
    where (z,tz) = deletemax t2

  deletetree :: (Stree a) -> a -> (Stree a)
  deletetree Nil x = Nil
  deletetree (Node tleft y tright) x
    | x < y   = Node (deletetree tleft x) y tright
    | x > y   = Node tleft y (deletetree tright x)


  deletetree (Node Nil y tright) x   = tright
  deletetree (Node tleft y tright) x = Node tz z tright
    where (z,tz) = deletemax tleft


  inserttree :: (Stree a) -> a -> (Stree a)
  inserttree Nil x = Node Nil x Nil
  inserttree (Node tleft y tright) x
    | x == y    = Node tleft y tright
    | x < y     = rebalance (Node (inserttree tleft x) y tright)
    | otherwise = rebalance (Node tleft y (inserttree tright x))


  deletetree :: (Stree a) -> a -> (Stree a)
  deletetree Nil x = Nil
  deletetree (Node tleft y tright) x
    | x < y   = rebalance (Node (deletetree tleft x) y tright)
    | x > y   = rebalance (tleft y (deletetree tright x))



  deletetree (Node Nil y tright) x   = tright
  deletetree (Node tleft y tright) x = rebalance (Node tz z tright)
    where (z,tz) = deletemax tleft

-- (inorder t1)++[y]++(inorder t21)++[z]++(inorder t22)++[x]++(inorder t3)

   rebalance :: (Stree a) -> (Stree a)
   rebalance (Node t1 y t2)
     | abs (sy) < 2         = Node t1 y t2
     | sy == 2 && st1 /= -1 = rotateright (Node t1 y t2)
     | sy == 2 && st1 == -1 = rotateright (Node (rotateleft t1) y t2)
     | sy == -2 && st2 /= 1 = rotateleft (Node t1 y t2)
     | sy == -2 && st2 == 1 = rotateleft (Node t1 y (rotateright t2))
     where
       sy  = slope (Node t1 y t2)
       st1 = slope t1
       st2 = slope t2

       rotateright (Node (Node t1 y t2) x t3) = Node t1 y (Node t2 x t3)
       rotateleft  (Node t1 x (Node t2 y t3)) = Node (Node t1 y t2) x t3


  slope :: (Stree a) -> Int
  slope Nil = 0
  slope (Node t1 x t2) = (height t1) - (height t2)

  height :: (Stree a) -> Int
  height Nil = 0
  height (Node t1 x t2) = 1 + (max (height t1) (height t2))

  data (Ord a) => STree a = Nil | Node Int (STree a) a (STree a)


  height :: (Stree a) -> Int
  height Nil = 0
  height (Node m t1 x t2) = m
