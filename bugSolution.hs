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

instance (Num a, Monoid a) => Monoid (Expr a) where
  mempty = Val 0
  mappend (Val a) (Val b) = Val (a <> b)
  mappend (Add e1 e2) (Val a) = mappend (mappend e1 e2) (Val a)
  mappend (Val a) (Add e1 e2) = mappend (Val a) (mappend e1 e2)
  mappend (Add e1 e2) (Add e3 e4) = Add (mappend e1 e3) (mappend e2 e4)

instance (Num a, Semigroup a) => Semigroup (Expr a) where
  (<>) = mappend

main :: IO ()
main = do
  print (Val 5 + Val 10)
  print (mappend (Val 5) (Val 10))
  print (Val 5 <> Val 10)