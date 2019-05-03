module Operators ((***), (+++), (#), (//), (!), (##)) where

infixr 9 +++
infixr 7 ***

infixl 0 #
infixl 5 //
infixl 9 !

infix 9 ##

(***) :: Int -> Int -> Int
(+++) :: Int -> Int -> Int
(#) :: Int -> Int -> Int
(//) :: Int -> Int -> Int
(!) :: Int -> Int -> Int
(##) :: Int -> Int -> Int

a +++ b = a + b + 1

a *** b = 2*a*b

a # b = b

a // b = a-b

a ! b = -a

a ## b = a*a