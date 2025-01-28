{-# LANGUAGE FlexibleInstances #-}

instance Monoid [a] where
  mempty = []
  mappend = (++)

instance Semigroup a => Semigroup [a] where
  (<>) = mappend

data Expr a = Val a | Add (Expr a) (Expr a)

instance Num a => Num (Expr a) where
  (+) = Add
  (*) = undefined
  (-) = undefined
  abs = undefined
  signum = undefined
  fromInteger = undefined

instance Monoid (Expr a) where
  mempty = undefined
  mappend = undefined

instance Semigroup (Expr a) where
  (<>) = undefined

main :: IO ()
main = do
  print (Val 5 + Val 10)
