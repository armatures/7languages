module Homework 
where

import Data.List--exposing (..)

data Fruit = Kiwi | Cranberry | Orange | Plum | Olive
  deriving (Show, Eq, Ord)


combine :: [ (Fruit,Fruit) ]
combine = [(a,b) | a <- fruits, b <- fruits, a < b]
  where fruits = [Kiwi, Cranberry, Orange, Plum, Olive]

timesTable = [(a,b,a*b) | a <- [1..12], b <- [1..12]]

sortAlphabetically :: Ord a => [a] -> [a]
sortAlphabetically = sortBy (\x y -> compare x y)
sortAlphabeticallyExample = sortAlphabetically ["fish","potatoes","enmity"]

everyThirdNum n = [n, n+3 ..]
everyFifthNum n = [n, n+5 ..]
byEights m n =  zipWith (+) ( everyThirdNum m )( everyFifthNum n )
exampleByEights = take 5 (byEights 1 6)
