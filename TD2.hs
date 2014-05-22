module TD2 where

import Data.Ratio
import Control.Monad
import Control.Applicative

--data Prob a = Prob [(a, Rational)] deriving (Show)
data Prob a = Prob [(a, Ratio Int)] deriving (Show)

sameProbability :: [a] -> Prob a
sameProbability xs = Prob [(a, 1 % length xs) | a <- xs]


canonize :: Eq a => Prob a -> Prob a
--canonize (Prob l) = Prob $ let g = groupBy (\a b -> fst a == fst b) $ sort l
--                           in map (\e@((k, _) : _) -> (k, sum $ map snd e)) g
canonize (Prob l) = Prob $ partition 


probability :: Eq a => a -> Prob a -> Ratio Int
--probability v (Prob l) = maybe 0 id (lookup v l)
probability p (Prob l) = 




instance Functor Prob where
    fmap f (Prob l) = Prob [(f v, p) | (v, p) <- l]
    
instance Monad Prob where
    return x = Prob [(x, 1)]
    fail a = Prob []
    (Prob a) >>= f = Prob (a >>= (\(x, p) -> let Prob l2 = f x 
                                            in [(x2, p*p2) | (x2, p2) <- l2]))
    
--instance Applicative Prob where
    
dice :: Prob Int
dice = sameProbability [1.. 6]

double :: Prob Bool
-- if Prob is Applicative can shorten to
-- double = pure (==) <*> dice <*> dice
double = do
  x <- dice
  y <- dice
  return $ x == y

pair :: Prob Int
--pair = pure (+) <*> dice <*> dice
pair = do
    x <- dice
    y <- dice
    return $ x + y
    
renormalize :: Prob a -> Prob a
renormalize (Prob l) = Prob $ [(k, p / total) | (k, p) <- l]
                        where total = sum $ map snd l
    
    
sick = alternatives (1 % 100000) True False
    
positive :: Bool -> Prob Bool
positive sick - alternatives (999 % 1000) sick (not sick)
    
results :: Prob Bool
results = renormalize $  do
    s <- sick
    p <- positive s
    if p
        then return s
        else fail "uninteresting"