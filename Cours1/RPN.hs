module RPN where

import Prelude hiding (drop)

type Stack = [Int]

type Operator = Stack -> Stack

parseOp :: String -> Operator
parseOp "+" = mais
parseOp "-" = menos
parseOp "*" = vezes
parseOp "/" = divide
parseOp "dup" = dup
parseOp "swap" = swap
parseOp "drop" = drop
parseOp "depth" = depth

-- en cas d'un entier comme argument, l'ajuter a quelle pile?
-- parseOp a = (read a :: Int) : restePile


mais :: Stack -> Stack
mais [] = []
mais (h : x) = (h + head x) : tail x

menos :: Stack -> Stack
menos [] = []
menos (h : x) = (h - head x) : tail x

vezes :: Stack -> Stack
vezes [] = []
vezes (h: x) = (h * head x) : tail x

divide :: Stack -> Stack
divide [] = []
divide (h : x) = (div h (head x) : tail x) 

dup :: Operator
dup [] = []
dup a = head a : a

swap :: Operator
swap [] = []
swap (a : b) = (head b : a : tail b)

drop :: Operator
drop [] = []
drop a = tail a

depth :: Operator
depth a = (length a : a)

-- pick should have another argument n? 
-- uses first number in pile as n and replaces it for a copy of n-th element
pick :: Operator
pick (a: b) = b !! a : b

eval :: Stack -> [Operator] -> Stack
eval a [] = a
eval a (h: t) = eval (h a) t 


